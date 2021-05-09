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
```

