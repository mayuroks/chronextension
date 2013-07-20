chrome.browserAction.onClicked.addListener (tab) ->
	chrome.tabs.create({"url": 'index.html'})
chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
	console.log(if sender.tab then "from a content script:" + sender.tab.url else "from the extension")
	chrome.tabs.create({"url": request.greeting})
	sendResponse({farewell: "goodbye"})
