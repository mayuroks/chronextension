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

reset_handle = () ->
	console.log("TEST")
	$('#sucks').remove()
	$('#sucks').listview("refresh")

http_handle = () ->	
	$.ajax "http://www.mrtzcmp3.net/snow_patrol_chasing_cars_1s.html",
		success: (data, textStatus, jqXHR) ->
			myvar = data.match(/D\?.*?_/)[0]
			dl_url = "http://www.mrtzcmp3.net/" + myvar.substr(2,8) + "mrtzcmp3"
			chrome.runtime.sendMessage {greeting: dl_url}, (response) ->
        			alert(response.farewell)
			#alert "SUCCESS HTTP REQUEST"
			console.log("HTTP REQUEST")
		error: (jqXHR, textStatus, errorThrown) ->
			alert textStatus + " FAILED HTTP " + errorThrown 
			console.log("FAILED REQUEST")

$ ->
	console.log("LOADED")
	$("#sub").click func
	$("#reset").click reset_handle
	$("#test").click http_handle
