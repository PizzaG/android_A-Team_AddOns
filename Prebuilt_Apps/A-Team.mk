# Copyright (C) 2019-Present A-Team Digital Solutions
#
#               Custom Shit

A-TEAM_PATH := vendor/A-Team

PRODUCT_COPY_FILES += \
    $(A-TEAM_PATH)/Prebuilt_Apps/Dependencies/com.google.android.dialer.support.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.dialer.support.xml \
    $(A-TEAM_PATH)/Prebuilt_Apps/Dependencies/com.google.android.dialer.support.jar:$(TARGET_COPY_OUT_SYSTEM)/framework/com.google.android.dialer.support.jar 

# Gboard Configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5 \
    ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms

PRODUCT_SOONG_NAMESPACES += \
    vendor/A-Team/FinalZip \
    vendor/A-Team/Prebuilt_Apps \
    vendor/A-Team/AddOns \

# Xiaomi Device Detection
ifeq ($(PRODUCT_DEVICE), olivewood)              
  PRODUCT_SOONG_NAMESPACES := device/xiaomi/prebuilt/kernel              
endif                                           

PRODUCT_PACKAGES += \
    GoogleDialer \
    NovaLauncher \
    LatinIMEGooglePrebuilt \
    PdaNetPlus \
    Xplore
