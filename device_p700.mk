$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/p700/p700-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p700/overlay

PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=32m \
    dalvik.vm.heapsize=76m

PRODUCT_AAPT_CONFIG := normal hdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi mdpi

LOCAL_PATH := device/lge/p700
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES := \
	device/lge/p700/init.u0.rc:root/init.u0.rc \
	device/lge/p700/init.qcom.usb.rc:root/init.qcom.usb.rc \
	device/lge/p700/ueventd.u0.rc:root/ueventd.u0.rc \
        device/lge/p700/init.qcom.sh:root/init.qcom.sh \

PRODUCT_COPY_FILES := \
	device/lge/p700/prebuilt/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
	device/lge/p700/prebuilt/wlan.ko:system/lib/modules/wlan.ko \
	device/lge/p700/prebuilt/volans/WCN1314_rf.ko:system/lib/modules/volans/WCN1314_rf.ko \
        $(LOCAL_PATH)/config/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \


PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/config/AudioFilter.csv:system/etc/AudioFilter.csv \
        $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml

# Keylayout
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/config/u0_keypad.kl:system/usr/keylayout/u0_keypad.kl \
        $(LOCAL_PATH)/config/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
        $(LOCAL_PATH)/config/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
        $(LOCAL_PATH)/config/melfas-ts.kl:system/usr/keylayout/melfas-ts.kl 

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# HW HALS
PRODUCT_PACKAGES += \
    libgenlock \
    liboverlay \
    gps.default \
    gralloc.msm7x27a \
    copybit.msm7x27a \
    hwcomposer.msm7x27a \
    audio.a2dp.default \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    charger \
    charger_res_images

# OMX 
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_p700
PRODUCT_DEVICE := p700
