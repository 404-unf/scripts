#!/usr/bin/env zsh
RED='\033[01;31m'
NOCOLOR='\033[00m'
GREEN='\033[01;32m'
DURATION=2

BACKUP_DIR=/home/terra9/Storage/backup
ZSHRC_FILE_SOURCE=/home/terra9/.zshrc
TIMEWARRIOR_DIR_SOURCE=/home/terra9/.timewarrior
TASKWARRIOR_DIR_SOURCE
TRILIUM_DATA_DIR_SOURCE

protofunction(){
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

zshrcCopy(){
    echo "$RED Removing the old .zshrc from local backup directory...$NOCOLOR"
    rm -r ${BACKUPDIR}/zshrc
    echo "$GREEN Creating the directory zshrc..$NOCOLOR"
    cd ${BACKUPDIR}
    mkdir zshrc
    echo "$GREEN Started copying .zshrc...$NOCOLOR"
    rclone sync -P ${ZSHRCSOURCE} ${BACKUPDIR}/zshrc/
    echo "$GREEN Done copying .zshrc.$NOCOLOR"
    echo ""
    echo ""
    sleep $DURATION
}

timewarrior(){
    echo "$RED Removing the old .timewarrior from local backup directory...$NOCOLOR"
    rm -r ${BACKUPDIR}/timewarrior
    echo "$GREEN Creating the directory timewarrior...$NOCOLOR"
    cd ${BACKUPDIR}
    mkdir timewarrior && cd timewarrior
    mkdir .timewarrior
    echo "$GREEN Started copying .timewarrior...$NOCOLOR"
    rclone copy -P /home/terra9/.timewarrior ${BACKUPDIR}/timewarrior/.timewarrior
    echo "$GREEN Done copying .timewarrior.$NOCOLOR"
    echo ""
    echo ""
    sleep $DURATION
}

taskwarrior(){
    echo "$RED Removing the old .task from local backup directory...$NOCOLOR"
    rm -r ${BACKUPDIR}/taskwarrior
    echo "$GREEN Creating the directory taskwarrior$NOCOLOR"
    cd ${BACKUPDIR}
    mkdir taskwarrior && cd taskwarrior
    mkdir .taskwarrior
    echo "$GREEN Started copying .task...$NOCOLOR"
    rclone copy -P /home/terra9/.task        ${BACKUPDIR}/taskwarrior/.taskwarrior
    echo "$GREEN Done copying .task.$NOCOLOR"
    echo ""
    echo ""
    sleep $DURATION
}

trilium-notes(){
    echo "$RED Removing the old trilium-data folder from local backup directory...$NOCOLOR"
    rm -r ${BACKUPDIR}/trilium-data
    echo "$GREEN Started copying trilium-data...$NOCOLOR"
    rclone copy /home/terra9/.local/share/trilium-data ${BACKUPDIR}/trilium-data -P
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
    cd ${BACKUPDIR}
    echo "$GREEN Syncing the remote backup directory with local backup directory on Google Drive... data on remote is being modified...$NOCOLOR"
    rclone sync . remote:backup -P -L
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

zshrcCopy