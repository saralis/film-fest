$( document ).ready( function() {
  $( '.outside-comments-container' ).on( 'click', 'a.new-comment', function( e ) {
    e.preventDefault();
    var target = e.target;
    var url = $(target).attr('href');
    var spanExist = $( target ).parent().has('span')

    if ( spanExist.length > 0 ) {
      $( '.outside-comments-container span' ).toggle();
    } else {
      $.ajax({
        url: url
      }).done( function( response ) {
        $(target).parent().append( response )
      });
    }
  });

  $( '.outside-comments-container' ).on( 'submit', 'form.new_comment', function( e ) {
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
      $(target).parent().parent().prepend(response)
      $( '.outside-comments-container span' ).remove();
    });
  });
});
