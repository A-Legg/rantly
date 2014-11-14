// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function () {

//  $('.dashboard-content').on('click', '.follow-link', function () {
//    $('.dashboard-content').css("background-color","blue");
//
//
//
//    $(this).removeClass(".follow-link")
//    $(this).addClass(".unfollow-link")
////    $(this).parents('.dashboard-content').css('background-color, "blue"');
//    debugger;

//    $.post("/users/:user_id/following", { followed_user_id: 25, follower_id: current_user.id }
//      .done(function( data ) {
//        alert( "Data Loaded: " + data );
//
//  });

  $('[data-favorite]').on('click', function (e) {
    e.preventDefault();
    e.stopPropagation();
    var favoriteLink = this
    var favorite = this.dataset.favorite;

    if (favorite == 'true') {
      favoriteFunctions.unfavorite(favoriteLink)

    }
    else {
      favoriteFunctions.favorite(favoriteLink);
    }


  })

  var favoriteFunctions = {
    unfavorite: function (link) {
      $.ajax({
        type: 'delete',
        url: '/users/0/favorites/' + link.dataset.rantId,
        dataType: 'json',
        success: favoriteFunctions.unfavorited(link)
      })

    },

    favorite: function (link) {
      $.post('/users/0/favorites.json', {id: link.dataset.rantId}).success(favoriteFunctions.favorited(link))
    },

    unfavorited: function (link) {
      console.log('callback');
      link.dataset.favorite = 'false';
      link.dataset.count--;
      $(link).text('Favorite (' + link.dataset.count + ')');
    },


    favorited: function (link) {
      console.log('callback');
      link.dataset.favorite = 'true';
      link.dataset.count++;
      $(link).text('Unfavorite (' + link.dataset.count + ')');
    }


  };


  setTimeout(function () {
    $(".flash").fadeOut('slow');
  }, 1000);

  $('#start_date').datepicker({format: "yyyy-mm-dd", orientation: 'top auto'});

  $('#end_date').datepicker({format: "yyyy-mm-dd", orientation: 'top auto'});


})
;


