#/bin/bash

source ./tools/config.sh

#
# CLONE/UPDATE ARDUINO
#

if [ ! -d "$AR_COMPS/arduino" ]; then
	git clone $AR_REPO_URL "$AR_COMPS/arduino"
	if [ "$AR_BRANCH" ]; then
		git -C "$AR_COMPS/arduino" checkout "$AR_BRANCH"
	fi
    #git -C "$AR_COMPS/arduino" submodule update --init --recursive
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP32-CAMERA
#

if [ ! -d "$AR_COMPS/esp32-camera" ]; then
	git clone $CAMERA_REPO_URL "$AR_COMPS/esp32-camera"
else
	git -C "$AR_COMPS/esp32-camera" fetch && \
	git -C "$AR_COMPS/esp32-camera" pull --ff-only
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-FACE
#

if [ ! -d "$AR_COMPS/esp-face" ]; then
	git clone $FACE_REPO_URL "$AR_COMPS/esp-face"
else
	git -C "$AR_COMPS/esp-face" fetch && \
	git -C "$AR_COMPS/esp-face" pull --ff-only
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-LITTLEFS
#

if [ ! -d "$AR_COMPS/esp_littlefs" ]; then
	git clone $LITTLEFS_REPO_URL "$AR_COMPS/esp_littlefs" && \
    git -C "$AR_COMPS/esp_littlefs" submodule update --init --recursive
else
	git -C "$AR_COMPS/esp_littlefs" fetch && \
	git -C "$AR_COMPS/esp_littlefs" pull --ff-only && \
    git -C "$AR_COMPS/esp_littlefs" submodule update --init --recursive
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-RAINMAKER
#

if [ ! -d "$AR_COMPS/esp-rainmaker" ]; then
    git clone $RMAKER_REPO_URL "$AR_COMPS/esp-rainmaker"
    git -C "$AR_COMPS/esp-rainmaker" checkout f1b82c71c4536ab816d17df016d8afe106bd60e3
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-DSP
#

if [ ! -d "$AR_COMPS/esp-dsp" ]; then
	git clone $DSP_REPO_URL "$AR_COMPS/esp-dsp"
else
	git -C "$AR_COMPS/esp-dsp" fetch && \
	git -C "$AR_COMPS/esp-dsp" pull --ff-only
fi
if [ $? -ne 0 ]; then exit 1; fi

