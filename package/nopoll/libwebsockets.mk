################################################################################
#
# libwebsockets
#
################################################################################

NOPOLL_VERSION = 0.4.3
#NOPOLL_SOURCE = nopoll-$(NOPOLL_VERSION).tar.xz
NOPOLL_SITE_METHOD=git
NOPOLL_SITE = https://github.com/ASPLes/nopoll
NOPOLL_DEPENDENCIES = zlib
NOPOLL_AUTORECONF = YES
NOPOLL_CONF_OPTS=LIBS=-pthread


$(eval $(autotools-package))
