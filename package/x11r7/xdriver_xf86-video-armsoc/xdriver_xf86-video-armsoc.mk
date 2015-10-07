################################################################################
#
# xdriver_xf86-video-armsoc
#
################################################################################

XDRIVER_XF86_VIDEO_ARMSOC_VERSION = 1.4.1
XDRIVER_XF86_VIDEO_ARMSOC_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-armsoc
XDRIVER_XF86_VIDEO_ARMSOC_LICENSE = MIT
XDRIVER_XF86_VIDEO_ARMSOC_LICENSE_FILES = COPYING
XDRIVER_XF86_VIDEO_ARMSOC_DEPENDENCIES = \
	xserver_xorg-server \
	libdrm \
	xproto_fontsproto \
	xproto_xproto \
	xproto_xf86driproto \
	xproto_dri2proto \
	host-automake host-autoconf host-libtool

XDRIVER_XF86_VIDEO_ARMSOC_AUTORECONF = YES

define XDRIVER_XF86_VIDEO_ARMSOC_CONFIG_FIXUP
	mkdir -p $(@D)/m4
	touch $(@D)/AUTHORS
endef
XDRIVER_XF86_VIDEO_ARMSOC_PRE_CONFIGURE_HOOKS += XDRIVER_XF86_VIDEO_ARMSOC_CONFIG_FIXUP

XDRIVER_XF86_VIDEO_ARMSOC_CONF_OPTS += --with-drmmode=pl111

$(eval $(autotools-package))
