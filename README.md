# How to setup compute


## Create ssh profile

For example:
```
Host DataCrunch01
  HostName 65.109.75.32
  User root
  IdentityFile <ssh_file_path>
```

## Git Clone this Repo

1. Setup zshrc: run `zshrc/_main_setup.sh`
2. Setup uv
  - run `uv/_main_setup.sh`
  - edit uv paths at the top of `~/.shell_setup/uv_setup.sh`

## [Optional] Create cheatsheet.sh w/ compute-specific commands

## TODOs
- Add git setup instructions
- Add main script to setup everything


