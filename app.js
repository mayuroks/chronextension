/* Create a cache object */
var cache = new LastFMCache();

/* Create a LastFM object, please use your own key for real world usage */
var lastfm = new LastFM({
	apiKey    : 'e3d64479d574074eac7058d08de0dda7',
	apiSecret : '063d322566d3a8bcbd48ac160aa5097a',
	cache     : cache
});

/* Load some artist info. */
lastfm.track.getSimilar(
	{
		artist: 'rihanna',
		track : 'umbrella' 
	},{
		success: function(data){
			$('#resizable').html(data);
			alert(data.similartracks.track[0].name);
		}, 
		error: function(code, message){
			alert(code);
			/* Show error message. */
		}
	}
);
