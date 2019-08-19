$(function () {
  var $grid = $('.grid');
  $grid.isotope({
    itemSelector: '.element-item',
    resizable: false, // disable normal resizing
    layoutMode: 'fitRows'
  });

  $('#filters a').click(function () {
    var filterValue = $(this).attr('data-filter');
    $grid.isotope({ filter: filterValue });
    $('#filters a').removeClass('active');
    $(this).toggleClass('active');
    return false;
  });

  //parse job feed
  var feed = "//careerseurope.danielwellington.com/jobs.rss?department_id=21328";

  $.ajax(feed, {
    accepts: {
      xml: "application/rss+xml"
    },
    dataType: "xml",
    success: function (data) {
      if ($(data).find("item").length > 0) {
        var html = '<ul class="career-list">';
        $(data).find("item").each(function () { // or "item" or whatever suits your feed
          var el = $(this);
          html += '<li><a href="'+el.find("link").text()+'" target="_blank">'+el.find("title").text()+'</a>';
          html += '</li>';
        });
        html += '</ul>';
        $('#js--career-list').html(html);
      } else {
        $('.js--empty-job-list').hide();
      }
    }
  });

});