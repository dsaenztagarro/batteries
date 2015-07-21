var handleJqueryUnobtrusive = function() {
  "use strict";
  $('#page-container').removeClass('in');
  $('body').prepend('<div id="page-loader" class="fade in"><span class="spinner"></span></div>');
};

var Custom = function () {
	"use strict";

	return {
		//main function
		init: function () {
      handleJqueryUnobtrusive();
    }
  }
}();
