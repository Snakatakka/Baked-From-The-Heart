extends Node

# Dialogue specific events
# These only trigger when a piece of dialogue starts and finishes respectively.
signal dialogue_started(dialogue : String)
signal dialogue_finished(dialogue : String)
