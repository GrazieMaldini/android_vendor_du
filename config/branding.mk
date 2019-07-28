# Versioning System
DU_REX_BASE_VERSION = HOMEMADE

ifndef DU_BUILD_TYPE
    DU_BUILD_TYPE := UNOFFICIAL
endif

# Only include DU-Updater for official, weeklies, and rc builds
ifeq ($(filter-out OFFICIAL WEEKLIES RC,$(DU_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        DU-Updater
endif

# Sign builds if building an official or weekly build
ifeq ($(filter-out OFFICIAL WEEKLIES,$(DU_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(KEYS_LOCATION)
endif

# Set all versions
DATE := $(shell date -u +%Y%m%d)
TIME := $(shell date -u +%H%M)
DU_VERSION := $(DU_BUILD_TYPE)-$(DU_REX_BASE_VERSION)-$(DATE)-$(TIME)
TARGET_BACON_NAME := $(DU_VERSION)
ROM_FINGERPRINT := DirtyUnicorns/$(PLATFORM_VERSION)/$(DU_BUILD_TYPE)/$(DATE)$(TIME)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.du.version=$(DU_VERSION) \
    ro.mod.version=$(DU_BUILD_TYPE)-$(DU_REX_BASE_VERSION)-$(DATE) \
    ro.du.fingerprint=$(ROM_FINGERPRINT)
