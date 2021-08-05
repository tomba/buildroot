################################################################################
#
# kmsxx
#
################################################################################

KMSXX_VERSION = e451c2d
KMSXX_SITE = https://github.com/tomba/kmsxx.git
KMSXX_SITE_METHOD = git
KMSXX_LICENSE = MPL-2.0
KMSXX_LICENSE_FILES = LICENSE
KMSXX_INSTALL_STAGING = YES
KMSXX_GIT_SUBMODULES = YES
KMSXX_DEPENDENCIES = fmt libdrm host-pkgconf
KMSXX_CONF_OPTS = \
	-Dkmscube=false \
	-Dpykms=enabled \
	-Dpyv4l2=enabled \
	-Domap=disabled \
	-Dlibutils=true -Dutils=true

ifeq ($(BR2_STATIC_LIBS),y)
KMSXX_CONF_OPTS += -Dstatic-libc=true
else
KMSXX_CONF_OPTS += -Dstatic-libc=false
endif

ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
endif

$(eval $(meson-package))
