# Versioning System
DU_BASE_VERSION = HOMEMADE

ifndef DU_BUILD_TYPE
    DU_BUILD_TYPE := UNOFFICIAL
endif

# Only include DU-Updater for official, weeklies, and rc builds
ifeq ($(filter-out OFFICIAL WEEKLIES RC,$(DU_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        DU-Updater
endif

# Set all versions
DU_DATE := $(shell date -u +%d-%m-%Y)
DATE := $(shell date -u +%Y%m%d)
TIME := $(shell date -u +%H%M)
DU_BUILD_VERSION := $(DU_BUILD_TYPE)-$(DU_BASE_VERSION)-$(DATE)-$(TIME)
DU_VERSION := DU-REX-V_$(DU_BASE_VERSION)-$(DATE)-$(DATE)-$(TIME)
TARGET_BACON_NAME := $(DU_VERSION)
ROM_FINGERPRINT := DirtyUnicorns/$(PLATFORM_VERSION)/$(DU_BUILD_TYPE)/$(DATE)$(TIME)

export DU_BASE_VERSION
export DU_BUILD_VERSION
export DU_BUILD_TYPE
export DU_DATE
export DU_VERSION
export ROM_FINGERPRINT
