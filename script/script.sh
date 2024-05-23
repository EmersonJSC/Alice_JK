#!/bin/sh
SRC=_aulas/

# ####################################
# Creating the credits clip
# ####################################
if test tmp-credits.mkv -ot credits.svg ; then
	ffmpeg -y -loop 1 -i credits.svg -i credits.wav -shortest tmp-credits.mkv
fi

# ####################################
# Creating dest dir
# ####################################
mkdir -p thumbs
mkdir -p videos

for aula in ./${SRC}*.md; do 
	# ####################################
	# Getting parameters from aulas
	# ####################################
    	NAME="$(basename "${aula}" .md)"
	AUTHOR=$(grep "^author: " "${aula}" | sed -e 's/author: //g')
	INPUT="${SRC}${NAME}.mkv"
	SCRIPT=$(dirname $0)"/"

	echo "########################################"
	echo "# Aula: ${aula}"
	echo "# Author: ${AUTHOR}"
	echo "# Input: ${INPUT}"
	echo "# Src: ${SRC}"
	echo "# Name: ${NAME}"
	echo "# Script Path: ${SCRIPT}"
	echo "########################################"

	# ####################################
	# Creating the thumbnail if does not exist
	# ####################################
	if test ! -f "thumbs/${NAME}.jpg" ; then
		ffmpeg -y -i "${INPUT}" -vframes 1 -an -s 400x222 -ss 30 "thumbs/${NAME}.jpg"
	fi

	# ####################################
	# if output exist, continue
	# ####################################
	if test -f "videos/${NAME}.mp4" ; then
		continue
	fi

	# ####################################
	# Creating the intro clip
	# ####################################
	sed "s/nomenome/$AUTHOR/g" ${SCRIPT}intro.svg | sed "s/curso/${NAME}/g" > ${SCRIPT}tmp-intro.svg
	ffmpeg  -y -loop 1 -i ${SCRIPT}tmp-intro.svg -i ${SCRIPT}intro.wav -shortest ${SCRIPT}tmp-intro.mkv

	# ###################################################
	# Audio adjustment
	# ###################################################
	# Some possible options
	# -af loudnorm 
	# -af dynaudnorm=p=1
	# -af speechnorm=e=12.5:r=0.0001:l=1 
	# -af acompressor=threshold=0.089:ratio=9:attack=200:release=1000:makeup=2 
	ffmpeg -y -i "${INPUT}" -af dynaudnorm=p=1  ${SCRIPT}tmp-normalized.mkv

	# ####################################################
	# Wartermarking the video file
	# ####################################################
	sed "s/nomenome/$AUTHOR/g" ${SCRIPT}watermark.svg | sed "s/curso/${NAME}/g" > ${SCRIPT}tmp-watermark.svg
	# add watermark to video
	ffmpeg -y -i ${SCRIPT}tmp-normalized.mkv -i ${SCRIPT}tmp-watermark.svg -i ${SCRIPT}logo.png -filter_complex "[0][1]overlay=5:H-h-5:format=auto[bg];[bg][2]overlay=W-w-5:5:format=auto" -c:a copy ${SCRIPT}tmp-video.mkv

	# ####################################################
	# Concatenating videos
	# ####################################################
					
		PARAM="scale=1920:1080: force_original_aspect_ratio=decrease: eval=frame,pad=1920:1080: -1:-1:color=black"
	ffmpeg -y \
		-i ${SCRIPT}tmp-intro.mkv \
		-i ${SCRIPT}tmp-video.mkv \
		-i ${SCRIPT}tmp-credits.mkv \
		-filter_complex \
		"[0:v]$PARAM[v0]; [1:v]$PARAM[v1]; [2:v]$PARAM[v2]; [v0][0:a][v1][1:a][v2][2:a] concat=n=3:v=1:a=1 [v] [a]" \
		-map [v] -map [a] \
		-s hd720 \
		-vcodec libx264 \
		-pix_fmt yuv420p \
		-vsync 2 \
		"videos/${NAME}.mp4"
done

rm -f ${SCRIPT}tmp-intro.svg
rm -f ${SCRIPT}tmp-intro.mkv
rm -f ${SCRIPT}tmp-normalized.mkv
rm -f ${SCRIPT}tmp-watermark.svg
rm -f ${SCRIPT}tmp-video.mkv

