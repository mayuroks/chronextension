func = () ->
	alert "TEST"
	console.log("LOADED")
	cache = new LastFMCache();
	lastfm = new LastFM({
		apiKey    : 'e3d64479d574074eac7058d08de0dda7',
		apiSecret : '063d322566d3a8bcbd48ac160aa5097a',
		cache     : cache
	})
	
	lastfm.track.getSimilar(
		{artist: 'way out west',track : 'spaceman' , limit: 10},
		{success: (data) ->
				$('#sucks').append("<li><a>#{song.artist.name} - #{song.name}</a></li>") for song in data.similartracks.track
				#alert data.similartracks.track[0].name
				$('#sucks').listview("refresh")
				
		},
		{error:	(code,message) ->
				## Show error message
		})

