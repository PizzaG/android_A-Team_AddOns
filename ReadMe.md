# A-Team vendor Addon Package For Android 11 Roms


# Features
```
Custom Slimmed Down Android 11 Gapps(FULL not GO version)
X-Plore File Manager
Magisk Auto Installed During Rom Installation
Busybox Auto INstalled During Rom Installation
```


# Info
```
This Package and set of scripts aims to Add extra functionality to the roms you build,  
It also has options to build roms with or without gapps. 
```


# Things You Need To Add + General Reminders
```
1- Put these lines in your device.mk file in your device tree or common.mk if using 
   common device tree.  Sets the A-Team path, calls the custom A-Team mk file for 
   Adding our Addons and the switch for if you want or don't want gapps in your rom
```
```
A-TEAM_PATH := vendor/A-Team
                                          
$(call inherit-product, $(A-TEAM_PATH)/Prebuilt_Apps/A-Team.mk)                                                                                              
                                                                 
ifeq ($(HAS_GAPPS), true)                                        
  $(call inherit-product, $(A-TEAM_PATH)/Gapps/gapps.mk)                 
endif
```

2- Put this into a Gapps-11.sh file and make permissions rw and executable
```
```
#!/bin/bash

## Gapps Selector
echo ""
echo "Choose GAPPS Type:"
echo ""
echo "1 For Gapps"
echo "2 For No Gapps"
#echo "2 For Micro Gapps"
echo ""
echo "Select Your Option & PRESS ENTER"
read gapps
if [[ $gapps == 1 ]]
then
export HAS_GAPPS=true
clear
echo ""
echo "Including Gapps..."
echo ""
elif [[ $gapps == 2 ]]
then
clear
echo ""
echo "Not Including Gapps..."
echo ""
#elif [[ $gapps == 2 ]]
#then
#export GAPPS_TYPE=microg
fi
```

3- Use this Rom Build Script As A Base & Tweak It For Your Needs
```
#!/bin/bash

# Variables
export A_TEAM_PATH_1=/media/pizzag/Android/Roms/AICP/11/vendor/A-Team/FinalZip/Roms/AICP
export A_TEAM_PATH_2=/media/pizzag/Android/Roms/AICP/11/vendor/A-Team/FinalZip
ZIP_OUT="$OUT/aicp_olivewood_r-16.1-UNOFFICIAL*.zip"
GAPPS="/media/pizzag/Android/Uploads/Roms_Android-11/Gapps"
NOGAPPS="/media/pizzag/Android/Uploads/Roms_Android-11/No_Gapps"
MD="$OUT/aicp_olivewood_r-16.1-UNOFFICIAL*.md5sum"

## AICP

source build/envsetup.sh
echo ""
echo " Cleaning Up...."
echo ""
m clean
sleep 5
clear
if [ -d ~/.ccache ]; then
   echo -e "ccache is already setup"
   echo ""
   export USE_CCACHE=1
   echo ""
else
   ccache -M 500G
   export USE_CCACHE=1
fi
export LC_ALL=C \
    WITHOUT_CHECK_API=true
lunch aosp_olivewood-userdebug
m aex -j$(nproc --all)
#brunch olivewood
echo ""
echo " Rom Should Be Built"
echo ""
# Copy A-Team AddOns To Out Directory
#cp -R "$A_TEAM_PATH_2"/AddOns "$OUT" \
#    "$A_TEAM_PATH_2"/install "$OUT" \
#    "$A_TEAM_PATH_1"/META-INF "$OUT"
cp -R $A_TEAM_PATH_2/AddOns $OUT 
cp -R $A_TEAM_PATH_2/install $OUT
cp -R $A_TEAM_PATH_1/META-INF $OUT
# Gapps Finished File Output
if [[ "$HAS_GAPPS" = true ]]; then 
    # Add A-Team AddOns Into Final Zip
    zip -ur "$ZIP_OUT" META-INF AddOns install
    mv "$ZIP_OUT" "$GAPPS"
    mv "$MD" "$GAPPS"
else 
    # No_Gapps Finished File Output
    #  
    # Add A-Team AddOns Into Final Zip
    zip -ur "$ZIP_OUT" META-INF AddOns install
    mv "$ZIP_OUT" "$NOGAPPS"
    mv "$MD" "$NOGAPPS"
fi
cd /media/pizzag/Android/Roms/AICP/11 || exit
source build/envsetup.sh
echo ""
echo -e " Cleaning Up...."
echo ""
m clean
```


# Copyright (C) 2019-Present A-Team Digital Solutions
```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
