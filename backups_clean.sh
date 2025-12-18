#!/bin/bash

mounts=("/mnt/backupdrive1/weekly_snapshots"
        "/mnt/backupdrive2/weekly_snapshots")

min_backup=5

for mount in "${mounts[@]}"; do
  # Replace the next line with your action
  echo "Processing directories in $mount"
  backups=($(find "$mount" -mindepth 1 -maxdepth 1 -type d | sort))
  count=${#backups[@]}
  echo "Found $count backup directories in $mount"

    if (( count > min_backup )); then
        to_delete=$((count - min_backup))
        echo "Deleting $to_delete oldest backup(s) in $mount"
        for (( i=0; i<to_delete; i++ )); do
        echo "Deleting: ${backups[i]}"
        done
    else
        echo "No backups need to be deleted in $mount"
    fi
done
