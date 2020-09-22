#!/usr/bin/env zsh
RED='\033[01;31m'
NOCOLOR='\033[00m'
GREEN='\033[01;32m'
echo "$RED Removing the old .zshrc from local backup directory...$NOCOLOR"
#rm -r /home/terra9/Storage/backup/zshrc
echo "$GREEN Creating the directory zshrc..$NOCOLOR"
#cd /home/terra9/Storage/backup
#mkdir zshrc
echo "$GREEN Started copying .zshrc...$NOCOLOR"
#cp -r /home/terra9/.zshrc /home/terra9/Storage/backup/zshrc/.zshrc
echo "$GREEN Done copying .zshrc.$NOCOLOR"
echo ""
echo ""
sleep 2
echo "$RED Removing the old .timewarrior from local backup directory...$NOCOLOR"
#rm -r /home/terra9/Storage/backup/timewarrior
echo "$GREEN Creating the directory timewarrior...$NOCOLOR"
#cd /home/terra9/Storage/backup
#mkdir timewarrior
echo "$GREEN Started copying .timewarrior...$NOCOLOR"
#cp -r /home/terra9/.timewarrior /home/terra9/Storage/backup/timewarrior/.timewarrior
echo "$GREEN Done copying .timewarrior.$NOCOLOR"
echo ""
echo ""
sleep 2
echo "$RED Removing the old .task from local backup directory...$NOCOLOR"
#rm -r /home/terra9/Storage/backup/taskwarrior
echo "$GREEN Creating the directory taskwarrior$NOCOLOR"
#cd /home/terra9/Storage/backup
#mkdir taskwarrior
echo "$GREEN Started copying .task...$NOCOLOR"
#cp -r /home/terra9/.task        /home/terra9/Storage/backup/taskwarrior/.task
echo "$GREEN Done copying .task.$NOCOLOR"
echo ""
echo ""
sleep 2
echo "$RED Removing the old trilium-data folder from local backup directory...$NOCOLOR"
rm -r /home/terra9/Storage/backup/trilium-data
echo "$GREEN Started copying trilium-data...$NOCOLOR"
cp -r /home/terra9/.local/share/trilium-data /home/terra9/Storage/backup/ && progress -mp $!
echo "$GREEN Done copying trilium-data.$NOCOLOR"
echo ""
echo ""
sleep 2
echo "$GREEN Yay!!! Everything is copied to local backup directory!!!$NOCOLOR"
echo ""
sleep 2
echo "$GREEN Moving into Local backup directory...$NOCOLOR"
#cd /home/terra9/Storage/backup
echo "$GREEN Syncing the remote backup directory with local backup directory on Google Drive... data on remote is being modified...$NOCOLOR"
#rclone sync . remote:backup -P -L
echo "$GREEN Done syncing the remote backup directory with local backup directory.$NOCOLOR"
echo ""
sleep 2
echo ""
echo "$GREEN Yay!!! Everything is backed up!!!$NOCOLOR"
