// Init sidebar
$(function() {
  var activeItem,
      helpList = $('#js-sidebar .js-topic'),
      firstOccurance = true,
      styleTOC = function() {
        var pathRegEx = /\/\/[^\/]+(\/.+)/g,
            docUrl = pathRegEx.exec(window.location.toString())
        if (docUrl){
          $('#js-sidebar .js-topic a').each(function(){
            if ($(this).parent('li').hasClass('disable'))
              $(this).parent('li').removeClass('disable')
            
            var url = $(this).attr('href').toString()
            var cleanDocUrl = docUrl[1]
            if(url.indexOf(cleanDocUrl) >= 0 && url.length == cleanDocUrl.length){
              $(this).parent('li').addClass('disable')
              var parentTopic = $(this).parentsUntil('div.sidebar-module > ul').last()
              parentTopic.addClass('js-current')
              parentTopic.find('.js-expand-btn').toggleClass('collapsed expanded')
            }
          });
        }
      }

  // bind every href with a hash; take a look at v3/search/ for example
  $('#js-sidebar .js-topic a[href*=#]').bind("click", function(e) {
    if (window.location.toString().indexOf($(e.target).attr('href')) == -1)
      setTimeout(styleTOC, 0); // trigger the window.location change, then stylize
  });

  // hide list items at startup
  if($('body.api') && window.location){
    styleTOC();
  }

  $('#js-sidebar .js-topic').each(function(){
    if(($(this).find('.disable').length == 0 || firstOccurance == false) &&
    $(this).hasClass('js-current') != true){
      $(this).find('.js-guides').children().hide()
    } else {
      activeItem = $(this).index()
      firstOccurance = false
    }
  })

  // Toggle style list. Expanded items stay
  // expanded when new items are clicked.
  $('#js-sidebar .js-toggle-list .js-expand-btn').click(function(){
    var clickedTopic = $(this).parents('.js-topic'),
        topicGuides  = clickedTopic.find('.js-guides li')
    $(this).toggleClass('collapsed expanded')
    topicGuides.toggle(100)
    return false
  })

  // Accordion style list. Expanded items
  // collapse when new items are clicked.
  $('#js-sidebar .js-accordion-list .js-topic h3 a').click(function(){
    var clickedTopic = $(this).parents('.js-topic'),
        topicGuides = clickedTopic.find('.js-guides li')

    if(activeItem != clickedTopic.index()){
      if(helpList.eq(activeItem)){
        helpList.eq(activeItem).find('.js-guides li').toggle(100)
      }
      activeItem = clickedTopic.index()
      topicGuides.toggle(100)
    } else {
      activeItem = undefined
      topicGuides.toggle(100)
    }

    return false
  })

  $('.help-search .search-box').focus(function(){
    $(this).css('background-position','0px -25px')
  })

  $('.help-search .search-box').focusout(function(){
    if($(this).val() == ''){
      $(this).css('background-position','0px 0px')
    }
  })

  // Dynamic year for footer copyright
  var currentYear = (new Date).getFullYear();
  $("#year").text( (new Date).getFullYear() );

  // Grab API status
  //$.getJSON('https://status.github.com/api/status.json?callback=?', function(data) {
    //if(data) {
      //var link = $("<a>")
        //.attr("href", "https://status.github.com")
        //.addClass(data.status)
        //.attr("title", "API Status: " + data.status + ". Click for details.")
        //.text("Status: " + data.status);
      //var img = $("<img>")
        //.attr("src", "/images/status-icon-" + data.status + ".png")
        //.height(16)
        //.width(16);
      //link.append(img);
      //$('.api-status').html(link);
    //}
  //});

});
