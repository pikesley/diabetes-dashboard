class Dashing.Graph extends Dashing.Widget

  @accessor 'current', ->
    return @get('average') if @get('average')
    return @get('displayedValue') if @get('displayedValue')
    points = @get('points')
    if points
      points[points.length - 1].y

  ready: ->
    color = '#138052'
    if @get('current') > 8
      color = '#f00'
    container = $(@node).parent()
    # Gross hacks. Let's fix this.
    width = (Dashing.widget_base_dimensions[0] * container.data("sizex")) + Dashing.widget_margins[0] * 2 * (container.data("sizex") - 1)
    height = (Dashing.widget_base_dimensions[1] * container.data("sizey"))   
    max = @get('max') + 50
    @graph = new Rickshaw.Graph(
      element: @node
      renderer: 'line'
      width: width
      height: height
      max: max
      series: [
        {
        color: color,
        data: [{x:0, y:0}]
        }
      ]
    )
    
    @graph.series[0].data = @get('points') if @get('points')

    x_axis = new Rickshaw.Graph.Axis.Time(graph: @graph)
    y_axis = new Rickshaw.Graph.Axis.Y(graph: @graph, tickFormat: Rickshaw.Fixtures.Number.formatKMBT)
    @graph.render()

  onData: (data) ->
    Dashing.debugMode = true
    if @graph
      @graph.series[0].data = data.points
      @graph.render()
