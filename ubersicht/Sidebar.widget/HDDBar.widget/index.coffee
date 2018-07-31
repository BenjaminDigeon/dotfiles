options =
  widgetEnable: true
  order: 2

command: "df -H | grep '/dev/disk1s1' | awk '{ print $5 }'"

refreshFrequency: '2h'

style: """
  fColor1 = rgba(white,1)
  fColor02 = rgba(white,0.2)
  bColor02 = rgba(black,0.2)
  margin = 0
  transform-style preserve-3d
  bottom margin
  right margin
  width 176px
  overflow hidden
  white-space nowrap
  position relative
  -webkit-backdrop-filter: blur(30px) brightness(80%) contrast(100%) saturate(140%);
  background-color bColor02
  font-family system, -apple-system
  opacity 0
  display none
  *, *:before, *:after
    box-sizing border-box
  .wrapper
    font-size 8pt
    line-height 11pt
    color fColor1
    padding 8px
    height auto
  .hdd
    width 100%
    margin-bottom 4px
  .left
    opacity 0.5
    float left
  .hddPercent
    display block
    margin 0 0 0 auto
    font-weight 700
    text-align right
  .bars
    margin 4px 0 8px 0
    height 8px
    position relative
  .bar
    top 0
    left 0
    background-color fColor02
    height 8px
    width 100%
    max-width 100%
    min-width 1%
    z-index 1
    position absolute
  .progress
    background-color fColor1
    z-index 3
    width 1%
"""

options : options

render: -> """
  <div class='wrapper'>
    <div class='hdd'>
      <span class='left'>Disk</span>
      <span class='hddPercent'>%</span>
      <div class='bars'>
        <div class='bar'></div>
        <div class='bar progress'></div>
        <div class='bar goal'></div>
      </div>
    </div>
   </div>
"""

update: (output, domEl) ->
  div = $(domEl)
  if @options.widgetEnable
    percentage = output.replace('%','')
    tWidth = div.width()
    tCurrent = (percentage / 100) * tWidth
    div.find('.hdd .progress').css('width', tCurrent)
    div.find('.hddPercent').html("#{percentage} %")
    # Sort out flex-box positioning.
    div.parent('div').css('order', @options.order)
    div.parent('div').css('flex', '0 1 auto')
    # Animate
    div.css('display', 'block')
    div.animate {opacity: 1}, 250, 'swing'
  else
    # Animate
    div.css('display', 'none')
    div.animate {opacity: 0}, 250, 'swing'
    div.remove()
