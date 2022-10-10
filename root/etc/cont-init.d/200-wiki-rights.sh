#!/command/with-contenv bash
##############################################################################
# Environment setup
##############################################################################
# This section contains some needed environment configuration.
##############################################################################


chown -R abc:abc /config
chmod +x /config/run.sh

touch /config/.gitconfig
chmod 777 /config/.gitconfig


