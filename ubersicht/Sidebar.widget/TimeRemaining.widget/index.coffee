options =
  widgetEnable: false
  order: 1
  events: [
    {
      date: '2018-09-17',
      name: 'new work'
    }
  ]

refreshFrequency: '1h'

style: """
  white1 = rgba(white,1)
  white05 = rgba(white,0.5)
  white02 = rgba(white,0.2)
  black02 = rgba(black,0.2)
  width 176px
  overflow hidden
  white-space nowrap

  *, *:before, *:after
    box-sizing border-box

  .wrapper
    position: relative
    font-size 8pt
    line-height 11pt
    color white
    padding 8px
    align-items center
    display flex
    flex-direction column
    flex-wrap nowrap

  .wrapper ul
    padding-left 2px

  .wrapper span:first-of-type
    font-weight 700
    color white
"""

options : options

dayUntil: (date_string) ->
  ONE_DAY = 1000 * 60 * 60 * 24
  today = new Date()
  date = new Date(date_string)

  date_ms = date.getTime()
  today_ms = today.getTime()

  difference_ms = Math.abs(date_ms - today_ms)
  return Math.round(difference_ms/ONE_DAY)

# Only call when the widget is created
render: (output) ->

  html = "<div class='wrapper'><ul>"
  for event in @options.events
    html += "<li>"
    html += "<span id='#{event.name.replace(" ","")}_value'>0</span>"
    html += "<span> days before #{event.name}</span>"
    html += "</li>"
  html += "</ul></div>"

  return html

# Update the rendered output.
# In function of refreshFrequency
update: (output, domEl) ->
  # Get our main DIV.
  div = $(domEl)
  if @options.widgetEnable
    for event in @options.events
      div.find("##{event.name.replace(" ","")}_value").html @dayUntil(event.date)

    # Sort out flex-box positioning.
    div.parent('div').css('order', @options.order)
    div.parent('div').css('flex', '0 1 auto')
  else
    div.remove()
