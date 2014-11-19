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


  $('[data-following]').on('click', function (e) {
    console.log('clicked');
    e.preventDefault();
    e.stopPropagation();
    var followLink = this
    var follow = this.dataset.following;

    if (follow == 'true') {
      console.log('clicked on true');
      followFunctions.unfollow(followLink)
    }
    else {
      console.log('clicked on false')
      followFunctions.follow(followLink);
    }
  })

  var followFunctions = {

    unfollow: function (link) {


      console.log('making unfollow ajax call');
      $.ajax({
        type: 'delete',
        url: '/users/0/following/' + link.dataset.followedUserId,
        dataType: 'json',
        success: function(data) {
          $('[data-followed-user-id="' + data.id + '"]').each(function() {
            this.dataset.following = 'false';
            location.reload();
            $(this).text("Follow")

          })
        }
      })

    },
    follow: function (link) {
      console.log('making follow ajax call')
      $.post('/users/0/following.json', {id: link.dataset.followedUserId}).success(function(data) {
        $('[data-followed-user-id="' + data.id + '"]').each(function() {
          this.dataset.following = 'true';
          $(this).text("Unfollow")

        })
      })
    }

  };


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
      var location = window.location.href;
      var rantId = link.dataset.rantId;
      var rant = $('section').find("[data-rant-id='" + rantId + "']");
      if(location.indexOf('favorites') > -1) {
        rant.remove();
      }
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

  $('.rant_button').on('click', function (e) {
    e.preventDefault();
    e.stopPropagation();
    var description = $('#rant_description').val();
    var rant = $('#rant_rant').val();

    if (description.length > 50){
  $('.errors').append('Description must be less than 50 characters');
    }
    else if (rant.length < 140){
    $('.errors').append('Rant must be more than 140 characters');
      }
    else {
      $.post('/rants.json', {description: description, rant: rant});
      location.reload();
//      $('.errors').empty('');
//      $('#rant_description').val('');
//      $('#rant_rant').val('');

    }



    });

  setTimeout(function () {
    $(".flash").fadeOut('slow');
  }, 1000);

  $('#start_date').datepicker({format: "yyyy-mm-dd", orientation: 'top auto'});

  $('#end_date').datepicker({format: "yyyy-mm-dd", orientation: 'top auto'});

//  var client = new Keen({
//    projectId: "5464ed14bcb79c5a0c792171",
//    readKey: "06ee4f99ad5709a00f0df77a17379006ac62db9121414a6fced555196634df4679e0934b2db1626c387d377b061fa44bd144da96890802df8c2e8b6fdd43997e98bae299b0d549991947994f4e2ed4689d372577d790f27610b454dfe302dc935a171637fe3d1c2a55ad4c1151f52819"
//  });
//  Keen.ready(function(){
//    var query = new Keen.Query("count", {
//      eventCollection: "logins",
//      timeframe: "today",
//      interval: "hourly",
//      groupBy: "keen.timestamp"
//    });
//    client.draw(query, document.getElementById("my_chart"), {
//      // Custom configuration here
//      chartType: "columnchart",
//      title: "Logins per hour"
//    });
//  });

//  var client = new Keen({
//    projectId: "5464ed14bcb79c5a0c792171",
//    readKey: "06ee4f99ad5709a00f0df77a17379006ac62db9121414a6fced555196634df4679e0934b2db1626c387d377b061fa44bd144da96890802df8c2e8b6fdd43997e98bae299b0d549991947994f4e2ed4689d372577d790f27610b454dfe302dc935a171637fe3d1c2a55ad4c1151f52819"
//
//  });
//  Keen.ready(function(){
//    var query = new Keen.Query("count", {
//      eventCollection: "logins",
//      timeframe: "yearly",
//
//      groupBy: "keen.timestamp"
//    });
//    client.draw(query, document.getElementById("my_chart2"), {
//      // Custom configuration here
//      chartType: "columnchart",
//      title: "Logins"
//    });
//  });

})
;

var client = new Keen({
  projectId: "5464ed14bcb79c5a0c792171",
  readKey: "06ee4f99ad5709a00f0df77a17379006ac62db9121414a6fced555196634df4679e0934b2db1626c387d377b061fa44bd144da96890802df8c2e8b6fdd43997e98bae299b0d549991947994f4e2ed4689d372577d790f27610b454dfe302dc935a171637fe3d1c2a55ad4c1151f52819"
});
Keen.ready(function(){
  var query = new Keen.Query("count", {
    eventCollection: "logins",
    timeframe: "today",
    interval: "hourly",
    groupBy: "keen.timestamp"
  });
  client.draw(query, document.getElementById("my_chart"), {
    // Custom configuration here
    chartType: "columnchart",
    title: "Logins per hour"
  });
});

