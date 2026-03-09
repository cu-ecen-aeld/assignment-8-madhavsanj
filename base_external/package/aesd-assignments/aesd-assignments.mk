##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = 9723c2c9c12a80881b826c4f73843f514c9dd4af
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-madhavsanj.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	# Build finder-app utilities
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	# Build aesdsocket from server/
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Install config files into /etc/finder-app/conf
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/finder-app/conf
	cp -a $(@D)/finder-app/conf/* $(TARGET_DIR)/etc/finder-app/conf/

	# Install scripts and binaries into /usr/bin
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh      $(TARGET_DIR)/usr/bin/finder.sh
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
	$(INSTALL) -m 0755 $(@D)/finder-app/writer         $(TARGET_DIR)/usr/bin/writer
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket         $(TARGET_DIR)/usr/bin/aesdsocket

	# Install init script for aesdsocket to run at boot
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
