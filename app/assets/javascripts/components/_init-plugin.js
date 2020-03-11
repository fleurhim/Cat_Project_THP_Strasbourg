$(document).on('ready', function () {
    $.HSCore.helpers.HSFocusState.init();
    $.HSCore.helpers.HSNotEmptyState.init();
    // initialization of input masking
    $.HSCore.components.HSMaskedInput.init('[data-mask]');
    // initialization of custom select
    $.HSCore.components.HSSelect.init('.js-custom-select');
    // initialization of tabs
    $.HSCore.components.HSTabs.init('[role="tablist"]');
    // initialization of scroll animation
    $.HSCore.components.HSOnScrollAnimation.init('[data-animation]');
    // initialization of go to
    $.HSCore.components.HSGoTo.init('.js-go-to');
      // initialization of carousel
    $.HSCore.components.HSCarousel.init('.js-carousel');
    // initialization of counters
    var counters = $.HSCore.components.HSCounter.init('[class*="js-counter"]');
    // initialization of rating
    $.HSCore.components.HSRating.init($('.js-rating'), {
      spacing: 2
    });
    // initialization of HSScrollBar component
    $.HSCore.components.HSScrollBar.init( $('.js-scrollbar') );
    // initialization of masonry
    $('.masonry-grid').imagesLoaded().then(function () {
      $('.masonry-grid').masonry({
        columnWidth: '.masonry-grid-sizer',
        itemSelector: '.masonry-grid-item',
        percentPosition: true
      });
    });
  });
 

  $(window).on('load', function () {
    // initialization of header
    $.HSCore.components.HSHeader.init($('#js-header'));
    $.HSCore.helpers.HSHamburgers.init('.hamburger');
    // initialization of HSMegaMenu component
    $('.js-mega-menu').HSMegaMenu({
      event: 'hover',
      pageContainer: $('.container'),
      breakpoint: 991
    });
    // initialization of sticky blocks
    $.HSCore.components.HSStickyBlock.init('.js-sticky-block');
    // initialization of horizontal progress bars
    setTimeout(function () { // important in this case
      var horizontalProgressBars = $.HSCore.components.HSProgressBar.init('.js-hr-progress-bar', {
        direction: 'horizontal',
        indicatorSelector: '.js-hr-progress-bar-indicator'
      });
    }, 1);
  });
  $(window).on('resize', function () {
    setTimeout(function () {
      $.HSCore.components.HSTabs.init('[role="tablist"]');
    }, 200);
  });
