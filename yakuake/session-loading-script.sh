#!/usr/bin/env bash

yakuake-session --hold --workdir ~/ -t "misc" -e cd
# yakuake-session --hold --workdir ~/timew/ -t "timew" -e timew
# yakuake-session --hold --homedir -t "summary" -e bash /home/terra9/storage/projects/scripts/timew/timew-summary-script.sh
# yakuake-session --hold --homedir -t "tags" -e bash /home/terra9/storage/projects/scripts/timew/timew-tags-list-script.sh
yakuake-session --hold --homedir -t "searx" -e searx-run
# yakuake-session --hold --workdir ~/storage/projects/scripts/activity/ -t "active-windows" -e ./window-activity-logging-script.sh
yakuake-session --hold --workdir ~/storage/projects/scripts/battery/ -t "battery-status" -e ./battery-status-script.sh
# yakuake-session --hold --workdir ~/storage/projects/scripts/timew/ -t "timew-notify" -e ./timew-activity-notify.sh
yakuake-session --hold --workdir ~/storage/projects/scripts/uptime/ -t "uptime" -e ./system-uptime-script.sh
