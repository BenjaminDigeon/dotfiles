options =
  widgetEnable: true

command: "source Sidebar.widget/Playbox.widget/spotify-info.sh"

refreshFrequency: '1s'

style: """
  white05 = rgba(white,0.5)
  white02 = rgba(white,0.2)

  width 176px
  overflow hidden
  white-space nowrap
  opacity 0

  .wrapper
    font-size 8pt
    line-height 11pt
    color white
    padding 8px

  .art
    width 44px
    height @width
    background-image url(Sidebar.widget/Playbox.widget/as/default.png)
    -webkit-transition background-image 0.5s ease-in-out
    background-size cover
    float left
    margin 0 8px 0 0
    border-radius 50%

  .text
    foat left

  .progress
    width: @width
    height: 2px
    background: white
    position: absolute
    bottom: 0
    left: 0

  .wrapper, .album, .artist, .song
    overflow: hidden
    text-overflow: ellipsis

  .song
    font-weight: 700

  .album
    color white05
"""

options : options

render: -> """
  <div class='wrapper'>
    <div class='art'></div>
    <div class='text'>
      <div class='song'></div>
      <div class='artist'></div>
      <div class='album'></div>
    </div>
    <div class='progress'></div>
  </div>
"""

update: (output, domEl) ->
  # Get our main DIV.
  div = $(domEl)
  if @options.widgetEnable
    # Get our pieces.
    values = output.split('|')
    trackName = values[0]
    artist = values[1]
    album = values[2]
    tArtwork = values[3]
    playing = values[4]
    percentOfSong = parseFloat(values[5].replace(',', '.'))

    tWidth = div.width()
    tCurrent = percentOfSong * tWidth

    currArt = div.find('.art').css('background-image').split('/').pop().slice(0,-1)
    if playing != 'playing'
      div.animate({ opacity: 0 }, 250)
      setTimeout(div.hide(1), 1)
    else
      div.animate({ opacity: 1 }, 250, 'swing', setTimeout(div.show(1), 1))
      div.find('.song').html(trackName)
      div.find('.artist').html(artist)
      div.find('.album').html(album)
      div.find('.progress').css('width', tCurrent)
      if tArtwork isnt currArt
        if tArtwork == 'NA'
          div.find('.art').css('background-image', 'url(Sidebar.widget/Playbox.widget/as/default.png)')
        else
          div.find('.art').css('background-image', "url(#{tArtwork})")

    # Sort out flex-box positioning.
    div.parent('div').css('order', '7')
    div.parent('div').css('flex', '0 1 auto')
  else
    div.remove()
