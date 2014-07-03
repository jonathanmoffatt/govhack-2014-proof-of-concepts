Router.map ->
	@route 'home',
		path: '/'
		template: 'home'

Template.home.rendered = ->
	initialValue = 3
	$('#uxUsage').val(initialValue)
	sliderOptions =
		min: 0
		max: 30
		value: initialValue
		formater: (currentValue) ->
			"#{currentValue} times per week"
	setUsageDescription = ->
		usage = $('#uxUsage').val()
		$('#uxUsageDescription').text "#{usage} times per week"
	setUsageDescription()
	$("#uxUsage").slider(sliderOptions).on 'slide', setUsageDescription

	data = [
		{
			value: 300,
			color:"#F7464A",
			highlight: "#FF5A5E",
			label: "Red"
		},
		{
			value: 50,
			color: "#46BFBD",
			highlight: "#5AD3D1",
			label: "Green"
		},
		{
			value: 100,
			color: "#FDB45C",
			highlight: "#FFC870",
			label: "Yellow"
		}
	]
	ctx = $("#myChart")[0].getContext("2d")
	myPieChart = new Chart(ctx).Pie(data)

Template.home.events =
	'click a': (event) ->
		$anchor = $(event.currentTarget)
		href = $anchor.attr('href')
		isInternalLink = href.lastIndexOf('#', 0) is 0
		if isInternalLink
			$('html, body').stop().animate({scrollTop: $(href).offset().top}, 1500, 'easeInOutExpo')
		not isInternalLink