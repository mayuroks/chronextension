func = () ->
	#alert $("#a_name").val()
	console.log("APP")
	cache = new LastFMCache();
	lastfm = new LastFM({
		apiKey    : 'e3d64479d574074eac7058d08de0dda7',
		apiSecret : '063d322566d3a8bcbd48ac160aa5097a',
		cache     : cache
	})
	
	lastfm.track.getSimilar(
		{artist: $("#a_name").val(),track : $("#s_name").val() , limit: 5},
		{success: (data) ->
				$('#sucks').append("<li><a>#{song.artist.name} - #{song.name}</a></li>") for song in data.similartracks.track
				#alert data.similartracks.track[0].name
				$('#sucks').listview("refresh")
				$("#a_name").val("")
				$("#s_name").val("")
		},
		{error:	(code,message) ->
				## Show error message
		})

clickHandler = () ->
	func()

test_handle = () ->
	console.log("TEST")
	alert "SUBMITTED"
	$('#sucks').remove()
	$('#sucks').listview("refresh")

$ ->
	console.log("LOADED")
	$("#sub").click func
	$("#test").click test_handle


