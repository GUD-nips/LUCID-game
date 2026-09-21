extends Node

@warning_ignore_start("unused_signal")

# Main Menu button functionality
signal newgame
signal continuegame
signal loadgame
signal options
signal exit

# Signals for use when game options menu is in use
signal optionsmenuopen

signal optionsreturn
signal subtitleson
signal subtitlesoff

# Signals for use when game pause menu is in use
signal pausemenuopen

signal pauseresume
signal pauseoptions
signal pausesavegame
signal pauseloadgame
signal pausesaveandquit

# Signals used when load game menu is in use 
signal loadgamemenuopen

signal loadgamemenureturn
signal loadslot1
signal loadslot2
signal loadslot3
signal loadslot4
signal loadslot5
signal loadslot6
signal loadslot7
signal loadslot8
signal loadslot9
signal loadslot10

# Signals used in camera selection and variance of sprites used
signal first_level_start
signal second_level_start

# Signals used when characters are deployed in point and click perspective
signal luci_pc_deploy
signal sven_pc_deploy
signal faye_pc_deploy
signal boss_pc_deploy
