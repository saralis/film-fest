$( document ).ready( function() {
  $( 'form#search' ).submit( function( e ) {
    e.preventDefault();
    var target = e.target;
    var type = target.method;
    var url = target.action;
    var data = $( target ).serialize();

    $.ajax({
      type: type,
      url: url,
      data: data
    }).done( function( response ) {
      if ( response.indexOf('No Film Found By That Name') !== -1 ) {
        alert( response )
      } else {
        window.location = response
      }
    });
  });
});
