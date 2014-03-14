################################################################################
#
# xdriver_xf86-video-omap
#
################################################################################

XDRIVER_XF86_VIDEO_OMAP_VERSION = 0.4.5
XDRIVER_XF86_VIDEO_OMAP_SOURCE = xf86-video-omap-$(XDRIVER_XF86_VIDEO_OMAP_VERSION).tar.bz2
XDRIVER_XF86_VIDEO_OMAP_SITE = http://xorg.freedesktop.org/releases/individual/driver
XDRIVER_XF86_VIDEO_OMAP_LICENSE = MIT
XDRIVER_XF86_VIDEO_OMAP_LICENSE_FILES = COPYING
XDRIVER_XF86_VIDEO_OMAP_AUTORECONF = YES
XDRIVER_XF86_VIDEO_OMAP_DEPENDENCIES = \
	xserver_xorg-server \
	libdrm \
	xorgproto

define XDRIVER_XF86_VIDEO_OMAP_CONFIG_FIXUP
	mkdir -p $(@D)/m4
endef
XDRIVER_XF86_VIDEO_OMAP_PRE_CONFIGURE_HOOKS += XDRIVER_XF86_VIDEO_OMAP_CONFIG_FIXUP

$(eval $(autotools-package))

