// Generated by CoffeeScript 1.6.3
(function() {
  chrome.browserAction.onClicked.addListener(function(tab) {
    return chrome.tabs.create({
      "url": 'index.html'
    });
  });

}).call(this);
