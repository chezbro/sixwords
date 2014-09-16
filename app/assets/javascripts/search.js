  // $(function() {
  //   var friends = <%= @friends.to_json.html_safe %>;

  //   $( "#search" ).autocomplete({
  //     minLength: 2,
  //     source: function( request, response ) {
  //           var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
  //           response($.grep(friends, function(value) {
  //               return matcher.test(value.value)
  //                   || matcher.test(value.label);
  //           }));
  //     }
  //   }).data( "autocomplete" )._renderItem = function( ul, item ) {
  //     return $( "<li></li>" )
  //     .data( "item.autocomplete", item )
  //     .append( "<a>" + '<img src="' + item.img + '"><strong>@' + item.value + "</strong><br>" + item.label + "</a>" )
  //     .appendTo( ul );
  //   };
  // });
