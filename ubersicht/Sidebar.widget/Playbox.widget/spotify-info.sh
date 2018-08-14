#!/bin/bash

trackInfo=`osascript <<< '
if application "Spotify" is running then
  tell application "Spotify"
    set theTrack to current track
    set theArtist to artist of theTrack
    set trackName to name of theTrack
    set albumName to album of theTrack
    set artworkUrl to artwork url of theTrack
    set playerState to player state
    set percentOfSong to player position / ((duration of current track) / 1000)
  end tell
  return  trackName & "|" & theArtist & "|" & albumName & "|" & artworkUrl & "|" & playerState & "|" & percentOfSong & "|"
else
  return  "" & "|" & "" & "|" & "" & "|" & "" & "|" & "stop" & "|" & "" & "|"
end if'`;

echo $trackInfo;
