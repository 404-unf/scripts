#!/bin/sh

# Setting this, so the repo does not need to be given on the commandline:
# export BORG_REPO=/home/terra9/backup/demoborgbackupscript
export BORG_REPO=/home/terra9/backup/borgbackup

# See the section "Passphrase notes" for more infos.
export BORG_PASSPHRASE='borgbackup'

# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

info "Starting backup"

# Backup the most important directories into an archive named after
# the machine this script is currently running on:

borg create                         \
    --list                          \
    --stats                         \
    --progress                      \
    --show-rc                       \
    --compression zstd,1               \
    --exclude-caches                \
    --exclude '/home/*/.cache/*'    \
    --exclude '/var/cache/*'        \
    --exclude '/var/tmp/*'          \
    --exclude '/home/terra9/.npm/*'   \
    --exclude '/home/terra9/.electron/*'   \
    --exclude '/home/terra9/.java/*'   \
    --exclude '/home/terra9/.m2/*'   \
    --exclude '/home/terra9/.mplayer/*'   \
    --exclude '/home/terra9/.node*/*'   \
    --exclude '/home/terra9/.rustup/*'   \
    --exclude '/home/terra9/github-clones/*'   \
    --exclude '/home/terra9/.cargo/*'   \
    --exclude '/home/terra9/backup/*'   \
                                    \
    ::'{hostname}-{now}'            \
    /home/terra9/                           \
    

backup_exit=$?

info "Pruning repository"

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machines' archives also:

borg prune                          \
    --list                          \
    --prefix '{hostname}-'          \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  6               \

prune_exit=$?

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

if [ ${global_exit} -eq 0 ]; then
    info "Backup and Prune finished successfully"
elif [ ${global_exit} -eq 1 ]; then
    info "Backup and/or Prune finished with warnings"
else
    info "Backup and/or Prune finished with errors"
fi

exit ${global_exit}
