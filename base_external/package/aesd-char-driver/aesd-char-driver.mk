##############################################################
#
# AESD-CHAR-DRIVER
#
##############################################################

#AESD_CHAR_DRIVER_VERSION = 5d219fa
AESD_CHAR_DRIVER_VERSION = 9723c2c9c12a80881b826c4f73843f514c9dd4af
AESD_CHAR_DRIVER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-madhavsanj.git
AESD_CHAR_DRIVER_SITE_METHOD = git
AESD_CHAR_DRIVER_GIT_SUBMODULES = YES

AESD_CHAR_DRIVER_MODULE_SUBDIRS = aesd-char-driver

$(eval $(kernel-module))
$(eval $(generic-package))