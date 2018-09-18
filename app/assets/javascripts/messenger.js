function testRequest(apiUrl, apiAction) {
  console.log('TESTING REQUEST');
  console.log(apiUrl);
  console.log(apiAction);
}

$(document).on('turbolinks:load', function() {
  $('#sync-schools').click(function(event) {
    event.preventDefault();
    var clickedLink = $(this);
    var apiUrl = clickedLink.data('api-url');
    var apiAction = clickedLink.data('api-action');
    var requestData = {};

    // Testing Setup
    console.log(apiUrl);
    console.log(apiAction);
    testRequest(apiUrl, apiAction);

    //if (apiAction === 'GET') {
      //$.getJSON(apiUrl, function( data ) {
        //requestData = data;
      //});
    //}

    // Testing Data
    //alert(requestData);


    //$.getJSON(apiUrl, function( data ) {
      //var items = [];
      //$.each( data, function( key, val ) {
        //items.push( "<li id='" + key + "'>" + val + "</li>" );
      //});

      //$( "<ul/>", {
        //"class": "my-new-list",
        //html: items.join( "" )
      //}).appendTo( "body" );
    //});
  });
})
