#!/bin/bash

trackInfo=`osascript <<<'tell application "Spotify"
        set theTrack to current track
        set theArtist to artist of theTrack
        set trackName to name of theTrack
        set albumName to album of theTrack
        set artworkUrl to artwork url of theTrack
        set playerState to player state
        set percentOfSong to player position / ((duration of current track) / 1000)
        return  trackName & "|" & theArtist & "|" & albumName & "|" & artworkUrl & "|" & playerState & "|" & percentOfSong & "|"
    end tell'`;

echo $trackInfo;
