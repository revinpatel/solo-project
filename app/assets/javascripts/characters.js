$(function() {
  $.get("http://dnd5eapi.co/api/races").success( function ( data ) {
    // var races = <%= @races %>;
    var races = []
    $.each(data.results, function( x, y ) {
      races.push(y.name)
    });
    console.log(races)
  });
});



$(function() {
  $.get("http://dnd5eapi.co/api/classes/").success( function ( data) {
    $.each(data.results, function( x, y ) {
      console.log(y.name)
    });
    console.log(data.results)
  });
});