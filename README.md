# snapsync

The snapsync system is developed to backup storage on a network. For this to work all backup clients must mount the /snapsync disk and start the snapsync script locally. On the backup server once per week the cleanup script is run to ease up on the storage space. Check the crontab scripts supplied.

first release: 20121023