## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := p700

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/p700/device_p700.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p700
PRODUCT_NAME := cm_p700
PRODUCT_BRAND := lge
PRODUCT_MODEL := p700
PRODUCT_MANUFACTURER := lge
