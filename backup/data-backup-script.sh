#!/usr/bin/env zsh
RED='\033[01;31m'
NOCOLOR='\033[00m'
GREEN='\033[01;32m'
DURATION=2

BACKUP_DIR_DEST=/home/terra9/Storage/backup
ZSHRC_FILE_SOURCE=/home/terra9/.zshrc
TIMEWARRIOR_DIR_SOURCE=/home/terra9/.timewarrior
TASKWARRIOR_DIR_SOURCE=/home/terra9/.task
TRILIUM_DATA_DIR_SOURCE=/home/terra9/.local/share/trilium-data
REMOTE_BACKUP_DIR_DEST=remote:backup

DATE=$(date +%Y-%m-%d-%H%M%S)

protoSync(){
    echo "$RED Removing the old FOLDER_NAME from local backup directory...$NOCOLOR"
    rm -r /home/terra9/Storage/backup/FOLDER_NAME
    echo "$GREEN Creating the directory FOLDER_NAME..$NOCOLOR"
    cd /home/terra9/Storage/backup
    mkdir FOLDER_NAME
    echo "$GREEN Started copying FOLDER_NAME...$NOCOLOR"
    rclone copy -P /home/terra9/FOLDER_NAME_TO_BE_BACKEDUP /home/terra9/Storage/backup/FOLDER_NAME_WHERE_TO_BE_BACKEDUP/
    echo "$GREEN Done copying FOLDER_NAME.$NOCOLOR"
    echo ""
    echo ""
    sleep $DURATION
}

zshrcSync(){
    echo "$RED Removing the old .zshrc from local backup directory...$NOCOLOR"
    rm -r ${BACKUP_DIR_DEST}/zshrc
    echo "$GREEN Creating the directory zshrc...$NOCOLOR"
    cd ${BACKUP_DIR_DEST}
    mkdir zshrc && cd zshrc
    echo "$GREEN Started copying .zshrc...$NOCOLOR"
    rclone sync -P ${ZSHRC_FILE_SOURCE} -L .
    echo "$GREEN Done copying .zshrc.$NOCOLOR"
    echo ""
    echo ""
    sleep $DURATION
}

zsh_historySync(){
    echo "$RED Removing the old .zshrc from local backup directory...$NOCOLOR"
    rm -r ${BACKUP_DIR_DEST}/zsh_history
    echo "$GREEN Creating the directory zsh_history...$NOCOLOR"
    cd ${BACKUP_DIR_DEST}
    mkdir zsh_history && cd zsh_history
    echo "$GREEN Started copying .zsh_history...$NOCOLOR"
    rclone sync -P ${HOME}/.zsh_history -L .
    echo "$GREEN Done copying .zsh_history.$NOCOLOR"
    echo ""
    echo ""
    sleep $DURATION
}

oh-my-zshSync(){
    echo "$RED Removing the old .oh-my-zsh from local backup directory...$NOCOLOR"
    rm -r ${BACKUP_DIR_DEST}/oh-my-zsh
    echo "$GREEN Creating the directory oh-my-zsh...$NOCOLOR"
    cd ${BACKUP_DIR_DEST}
    mkdir oh-my-zsh && cd oh-my-zsh
    mkdir .oh-my-zsh && cd .oh-my-zsh
    echo "$GREEN Started copying .oh-my-zsh...$NOCOLOR"
    rclone sync -P ${HOME}/.oh-my-zsh -L .
    echo "$GREEN Done copying .oh-my-zsh.$NOCOLOR"
    echo "$GREEN Now creating the tarball...$NOCOLOR"
    cd ..
    tar -cvzpf ${HOME}/Storage/tar_backup/backup_$DATE.tar.gz .
    echo "$GREEN Tar ball is created.$NOCOLOR"
    echo ""
    echo ""
    sleep $DURATION
}

timewarriorSync(){
    echo "$RED Removing the old .timewarrior from local backup directory...$NOCOLOR"
    rm -r ${BACKUP_DIR_DEST}/timewarrior
    echo "$GREEN Creating the directory timewarrior...$NOCOLOR"
    cd ${BACKUP_DIR_DEST}
    mkdir timewarrior && cd timewarrior
    mkdir .timewarrior && cd .timewarrior
    echo "$GREEN Started copying .timewarrior...$NOCOLOR"
    rclone sync -P ${TIMEWARRIOR_DIR_SOURCE} .
    echo "$GREEN Done copying .timewarrior.$NOCOLOR"
    echo ""
    echo ""
    sleep $DURATION
}

taskwarriorSync(){
    echo "$RED Removing the old .task from local backup directory...$NOCOLOR"
    rm -r ${BACKUP_DIR_DEST}/taskwarrior
    echo "$GREEN Creating the directory taskwarrior$NOCOLOR"
    cd ${BACKUP_DIR_DEST}
    mkdir taskwarrior && cd taskwarrior
    mkdir .taskwarrior && cd .taskwarrior
    echo "$GREEN Started copying .task...$NOCOLOR"
    rclone sync -P ${TASKWARRIOR_DIR_SOURCE} .
    echo "$GREEN Done copying .task.$NOCOLOR"
    echo ""
    echo ""
    sleep $DURATION
}

triliumNotesSync(){
    echo "$RED Removing the old trilium-data folder from local backup directory...$NOCOLOR"
    rm -r ${BACKUP_DIR_DEST}/trilium-data
    cd ${BACKUP_DIR_DEST}
    mkdir trilium-data && cd trilium-data
    echo "$GREEN Started copying trilium-data...$NOCOLOR"
    rclone sync ${TRILIUM_DATA_DIR_SOURCE} . -P
    echo "$GREEN Done copying trilium-data.$NOCOLOR"
    echo ""
    echo ""
    sleep $DURATION
}

rcloneSync(){
    echo "$GREEN Yay!!! Everything is copied to local backup directory!!!$NOCOLOR"
    echo ""
    sleep $DURATION
    echo "$GREEN Moving into Local backup directory...$NOCOLOR"
    cd ${BACKUP_DIR_DEST}
    echo "$GREEN Syncing remote:backup.7 to remote:backup.8...$NOCOLOR"
    rclone sync remote:backup.7 remote:backup.8 -P -L
    echo "$GREEN Syncing remote:backup.6 to remote:backup.7...$NOCOLOR"
    rclone sync remote:backup.6 remote:backup.7 -P -L
    echo "$GREEN Syncing remote:backup.5 to remote:backup.6...$NOCOLOR"
    rclone sync remote:backup.5 remote:backup.6 -P -L
    echo "$GREEN Syncing remote:backup.4 to remote:backup.5...$NOCOLOR"
    rclone sync remote:backup.4 remote:backup.5 -P -L
    echo "$GREEN Syncing remote:backup.3 to remote:backup.4...$NOCOLOR"
    rclone sync remote:backup.3 remote:backup.4 -P -L
    echo "$GREEN Syncing remote:backup.2 to remote:backup.3...$NOCOLOR"
    rclone sync remote:backup.2 remote:backup.3 -P -L
    echo "$GREEN Syncing remote:backup.1 to remote:backup.2...$NOCOLOR"
    rclone sync remote:backup.1 remote:backup.2 -P -L
    echo "$GREEN Syncing remote:backup   to remote:backup.1...$NOCOLOR"
    rclone sync remote:backup remote:backup.1 -P -L
    echo "$GREEN Syncing the remote backup directory with local backup directory on Google Drive... data on remote is being modified...$NOCOLOR"
    rclone sync . ${REMOTE_BACKUP_DIR_DEST} -P -L
    echo "$GREEN Done syncing the remote backup directory with local backup directory.$NOCOLOR"
    echo ""
    sleep $DURATION
    echo ""
}

driveQuota(){
    echo "$GREEN Yay!!! Everything is backed up!!!$NOCOLOR"
    echo ""
    echo ""
    echo "Google Drive Quota Details are..."
    rclone about remote:
}

##zshrcSync
#oh-my-zshSync
#zsh_historySync
#timewarriorSync
#taskwarriorSync
#triliumNotesSync
# rcloneSync
# driveQuota
echo "$GREEN Syncing remote:backup-sync.3 to remote:backup-sync.4...$NOCOLOR"
rclone sync -P -L remote:backup-sync.3 remote:backup-sync.4

echo "$GREEN Syncing remote:backup-sync.2 to remote:backup-sync.3...$NOCOLOR"
rclone sync -P -L remote:backup-sync.2 remote:backup-sync.3

echo "$GREEN Syncing remote:backup-sync.1 to remote:backup-sync.2...$NOCOLOR"
rclone sync -P -L remote:backup-sync.1 remote:backup-sync.2

echo "$GREEN Syncing remote:backup-sync to remote:backup-sync.1...$NOCOLOR"
rclone sync -P -L remote:backup-sync remote:backup-sync.1

echo "$GREEN Syncing latest backintime snapshot to remote:backup-sync...$NOCOLOR"
rclone sync -P -L $1 remote:backup-sync/latest-backintime-backup --multi-thread-streams 0
