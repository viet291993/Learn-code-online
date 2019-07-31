/*
 Author       : Hash Theme.
 Template Name: Davana - Industrial Constriction Business Html5 Template
 Version      : 1.0
 */
/*=============================================
 TABLE OF CONTENTS
 ================================================
 
 1. PRELOADER JS
 2. JQUERY STICKY MENU
 3. MENU JS
 4. SECTIONS BACKGROUNDS
 5. COUNTDOWN JS
 6. HOME SLIDER JS
 7. SIMPLE IMAGE SLIDER JS
 8. PORTFOLIO SLIDER JS
 9. TEAM SLIDER JS
 10. TESTIMONIAL SLIDER JS
 11. CLIENT SLIDER JS
 12. PRETTYPHOTO JS
 13. VENOBOX JS
 14. ACCORDION JS
 15. GOOGLE MAP
 16. WOW ANIMATION JS
 17. MIXITUP JS
 
 Table Of Contents end
 ================================================
 */

(function ($) {
    'use strict';

    jQuery(document).on('ready', function () {


        /* 1. PRELOADER JS */

//        $(window).on('load', function () {
//            function fadeOut(el) {
//                el.style.opacity = 0.4;
//                var last;
//                var tick = function () {
//                    el.style.opacity = +el.style.opacity - (new Date() - last) / 600;
//                    last = +new Date();
//                    if (+el.style.opacity > 0) {
//                        (window.requestAnimationFrame && requestAnimationFrame(tick)) || setTimeout(tick, 100);
//                    } else {
//                        el.style.display = "none";
//                    }
//                };
//                tick();
//            }
//            var pagePreloaderId = document.getElementById("page-preloader");
//            setTimeout(function () {
//                fadeOut(pagePreloaderId)
//            }, 1000);
//        });


        /* 2. JQUERY STICKY MENU */


        /* 3. MENU JS */

//        $('nav#dropdown').meanmenu({
//            meanMenuContainer: '.mobile-menu-area',
//            meanScreenWidth: "1366"
//        });


        $(window).on('scroll', function () {
            if ($(this).scrollTop() > 200) {
                $('.mainmenu-area').addClass('menu-animation');
            } else {
                $('.mainmenu-area').removeClass('menu-animation');
            }
        });

        $('a.js-scroll-trigger').on('click', function (e) {
            var anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: $(anchor.attr('href')).offset().top - 48
            }, 1000);
            e.preventDefault();
        });

        // Activate scrollspy to add active class to navbar items on scroll
        $('body').scrollspy({
            target: '.mainmenu-area',
            offset: 54
        });

        /* 4. SECTIONS BACKGROUNDS */

        var pageSection = $("section,div,a");
        pageSection.each(function (indx) {
            if ($(this).attr("data-background")) {
                $(this).css("background-image", "url(" + $(this).data("background") + ")");
            }
        });




        /* 5. COUNTDOWN JS */

        $('.counter-section').on('inview', function (event, visible, visiblePartX, visiblePartY) {
            if (visible) {
                $(this).find('.timer').each(function () {
                    var $this = $(this);
                    $({
                        Counter: 0
                    }).animate({
                        Counter: $this.text()
                    }, {
                        duration: 2000,
                        easing: 'swing',
                        step: function () {
                            $this.text(Math.ceil(this.Counter));
                        }
                    });
                });
                $(this).unbind('inview');
            }
        });
        /* END COUNTDOWN JS */


        /* 7. SIMPLE IMAGE SLIDER JS */

        $('.simple-image-slider').owlCarousel({
            loop: true,
            margin: 0,
            autoplay: true,
            autoplayTimeout: 4000,
            dots: true,
            items: 1,
            nav: false
        });


        /* 8. PORTFOLIO SLIDER JS */

        $('.portfolio-slider').owlCarousel({
            loop: true,
            autoplay: false,
            autoplayTimeout: 4000,
            dots: false,
            nav: true,
            navText: ['<i class="fas fa-chevron-left"></i>', '<i class="fas fa-chevron-right"></i>'],
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 4
                }
            }
        });


        /* 9. TEAM SLIDER JS */
        $('.team-slider').owlCarousel({
            loop: true,
            margin: 30,
            dots: true,
            autoplay: false,
            autoplayTimeout: 4000,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 4
                }
            }
        });


        /* 10. TESTIMONIAL SLIDER JS */

        $('.testimonial-slider').owlCarousel({
            loop: true,
            margin: 30,
            dots: true,
            autoplay: false,
            autoplayTimeout: 4000,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 3
                }
            }
        });


        /* 11. CLIENT SLIDER JS */
        $('.client-slider').owlCarousel({
            loop: true,
            margin: 30,
            dots: false,
            nav: true,
            navText: ['<i class="fas fa-chevron-left"></i>', '<i class="fas fa-chevron-right"></i>'],
            autoplay: true,
            autoplayTimeout: 3000,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 4
                }
            }
        });




        /* 12. PRETTYPHOTO JS */

        $('#portfolio').magnificPopup({
            delegate: 'a[data-gal^="prettyPhoto"]',
            type: 'image',
            tLoading: 'Loading image #%curr%...',
            mainClass: 'mfp-img-mobile',
            gallery: {
                enabled: true,
                navigateByImgClick: true,
                preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
            },
            image: {
                tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
//                titleSrc: function (item) {
//                    return item.el.attr('title') + '<small>by Marsel Van Oosten</small>';
//                }
            }
        });


        /* 13. VENOBOX JS */


        /* 14. ACCORDION JS  */

        var selectIds = $('#panel1,#panel2,#panel3,#panel4,#panel5,#panel6,#panel7,#panel8,#panel9,#panel10,#panel11,#panel12,#panel13,#panel14,#panel15');
        $(function ($) {
            selectIds.on('show.bs.collapse hidden.bs.collapse', function () {
                $(this).prev().find('.icofont').toggleClass('icofont-minus icofont-plus');
            })
        });





    });


    /* 16. WOW ANIMATION JS */

    new WOW().init();

    $('#contact-form').validate({
        submitHandler: function () {
            var data = JSON.stringify($('#contact-form').serializeObject());
            var url = $('#contact-form').attr('action');
            $.ajax({
                beforeSend: function () {
                    $('#contact-form button[type="submit"]').prop("disabled", true);
                },
                url: url,
                type: 'POST',
                data: data,
                contentType: 'application/json',
                success: function (data) {
                    openAlert(data.value, function () {
                        $('#contact-form button[type="reset"]').click();
                        $('#contact-form button[type="submit"]').prop("disabled", false);
                    });
                }, error: function () {
                    openAlert(null, function () {
                        noty({text: 'Đã xảy ra lỗi. Vui lòng thử lại sau!', layout: 'bottomCenter', type: 'error'});
                        $('#contact-form button[type="submit"]').prop("disabled", false);
                    });
                }
            });
        }
    });

    $('#email-form').validate({
        submitHandler: function () {
            var data = JSON.stringify($('#email-form').serializeObject());
            var url = $('#email-form').attr('action');
            $.ajax({
                beforeSend: function () {
                    $('#email-form button[type="submit"]').prop("disabled", true);
                },
                url: url,
                type: 'POST',
                data: data,
                contentType: 'application/json',
                success: function (data) {
                    openAlert(data.value, function () {
                        $('#email-form input[type="email"]').val('');
                        $('#email-form button[type="submit"]').prop("disabled", false);
                    });
                }, error: function () {
                    openAlert(null, function () {
                        noty({text: 'Đã xảy ra lỗi. Vui lòng thử lại sau!', layout: 'bottomCenter', type: 'error'});
                        $('#email-form button[type="submit"]').prop("disabled", false);
                    });
                }
            });
        }
    });
    if ($(window).width() > 991) {
        var $menuOffset = $('#logo-area').offset().top;
        var $menuHeight = $('#logo-area').height();
        $(window).scroll(function () {
            if ($(window).scrollTop() >= $menuOffset + $menuHeight) {
                $('#logo-area').addClass('fixed');
            } else {
                $('#logo-area').removeClass('fixed');
            }
        });
    } else {
        $('#btn-show-menu').click(function () {
            $('#sticker').stop(0).show(0);
            $('#sticker').stop(0).addClass('opened');
        });
        $('#btn-close-sticker').click(function () {
            $('#sticker').stop(0).removeClass('opened');
            $('#sticker').stop(0).fadeOut(300);
        });
        $('#sticker .main-menu>li>a>.fas').click(function (e) {
            e.preventDefault();
            $(this).parent('a').next('ul').stop(0).slideToggle(300);
            $(this).stop(0).toggleClass('fa-caret-down').toggleClass('fa-caret-up');
        });
    }
    $('.btn-change-lang').click(function (e) {
        e.preventDefault();
        var lang = $(this).data('lang');
        document.cookie = 'lang=' + lang + '; path=/';
        window.location.href = '/';
    });
})(jQuery);
function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) === ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) === 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
$(window).load(function () {
    if (!getCookie("lang")) {
        document.cookie = 'lang=vi; path=/';
        $('.selected-lang').html('VI');
        $('.selected-lang-invert').html('EN');
    }
    $('.account-parallax .img-parallax').tilt({
        scale: 1.1
    });
});

$(function () {
    $('[data-toggle="tooltip"]').tooltip();
});

$(document).on('click', '.btn-open-modal', function (e) {
    e.preventDefault();
    var controller = $(this).data('controller');
    if (typeof controller !== "undefined") {
        sendAjax(controller, 'GET', null, function (data) {
            $('body').append(data);
            $('#myModal').modal('show');
        });
    }
});

$(document).on('click', '.btn-opencontact-modal', function (e) {
    e.preventDefault();
    var controller = $(this).data('controller');
    if (typeof controller !== "undefined") {
        sendAjax(controller, 'GET', null, function (data) {
            $('body').append(data);
            $('#contactPriceModal').modal('show');
        });
    }
});


function sendAjax(url, type, data, handle) {
    $.ajax({
        url: url,
        type: type,
        data: data,
        success: function (data) {
            if (typeof handle !== "undefined") {
                handle(data);
            }
        }
    });
}
$(document).on('hidden.bs.modal', '#myModal', function () {
    $(this).remove();
});
$(document).ready(function () {
    $('.owl-carousel.d-none').removeClass('d-none');

    var sync1 = $(".slider-section .promotion-image");
    var sync2 = $(".slider-section .promotion-title");
    var slidesPerPage = 6;
    var responsiveSlidesPerPage = {
        // breakpoint from 0 up
        0: {
            items: 3
        },
        // breakpoint from 480 up
        768: {
            items: 4
        },
        // breakpoint from 768 up
        992: {
            items: 5
        },
        // breakpoint from 768 up
        1200: {
            items: 6
        }
    };
    var thumbnailItemClass = '.owl-item';

    sync1.owlCarousel({
        animateOut: 'fadeOut',
        video: true,
        items: 1,
        loop: true,
        margin: 0,
        autoplay: true,
        autoplayTimeout: 5000,
        autoplayHoverPause: false,
        nav: false,
        dots: false,
        lazyLoad: true
    }).on('changed.owl.carousel', syncPosition);

    function syncPosition(el) {
        $owl_slider = $(this).data('owl.carousel');
        var loop = $owl_slider.options.loop;

        if (loop) {
            var count = el.item.count - 1;
            var current = Math.round(el.item.index - (el.item.count / 2) - .5);
            if (current < 0) {
                current = count;
            }
            if (current > count) {
                current = 0;
            }
        } else {
            var current = el.item.index;
        }

        var owl_thumbnail = sync2.data('owl.carousel');
        var itemClass = "." + owl_thumbnail.options.itemClass;


        var thumbnailCurrentItem = sync2
                .find(itemClass)
                .removeClass("current")
                .eq(current);

        thumbnailCurrentItem.addClass('current');

        if (!thumbnailCurrentItem.hasClass('active')) {
            sync2.trigger('to.owl.carousel', [current, 0, true]);
        }
    }

    sync2.owlCarousel({
        startPosition: 12,
        items: slidesPerPage,
        loop: false,
        margin: 0,
        autoplay: false,
        nav: false,
        dots: false,
        responsive: responsiveSlidesPerPage,
        onInitialized: function (e) {
            var thumbnailCurrentItem = $(e.target).find(thumbnailItemClass).eq(this._current);
            thumbnailCurrentItem.addClass('current');
        }
    }).on('click', thumbnailItemClass, function (e) {
        e.preventDefault();
        e.stopPropagation();
        var duration = 0;
        var itemIndex = $(this).children('a').data('index');
        sync1.trigger('to.owl.carousel', [itemIndex, duration, true]);
    }).on("changed.owl.carousel", function (el) {
        var number = el.item.index;
        $owl_slider = sync1.data('owl.carousel');
        $owl_slider.to(number, 0, true);
    });
    $('#hot-product .owl-carousel').owlCarousel({
        startPosition: 12,
        items: slidesPerPage,
        loop: true,
        margin: 10,
        autoplay: true,
        autoplayTimeout: 5000,
        nav: true,
        navText: ['&lsaquo;', '&rsaquo;'],
        dots: false,
        lazyLoad: true,
        responsive: {
            // breakpoint from 0 up
            0: {
                items: 2
            },
            // breakpoint from 480 up
            576: {
                items: 2
            },
            // breakpoint from 480 up
            768: {
                items: 3
            },
            // breakpoint from 768 up
            992: {
                items: 4
            },
            // breakpoint from 768 up
            1200: {
                items: 6
            }
        },
        onInitialized: function (e) {
            var thumbnailCurrentItem = $(e.target).find(thumbnailItemClass).eq(this._current);
            thumbnailCurrentItem.addClass('current');
        }
    });


    //banner_top_1
    $('#owlCarousel-1').owlCarousel({
        loop: true,
        autoplay: true,
        margin: 10,
        nav: true,
        items: 1,
        autoHeight : true,
        singleItem : true,
        lazyLoad: true
    });

    $('#company-wrapper .company-slide .owl-carousel').magnificPopup({
        delegate: 'a.img-cover',
        type: 'image',
        tLoading: 'Loading image #%curr%...',
        mainClass: 'mfp-img-mobile',
        gallery: {
            enabled: true,
            navigateByImgClick: true,
            preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
        },
        image: {
            tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
            titleSrc: function (item) {
                return '';
            }
        }
    });
    $('#company-wrapper .company-slide .owl-carousel').owlCarousel({
        loop: false,
        margin: 10,
        autoplay: true,
        autoplayTimeout: 5000,
        nav: false,
        dots: true,
        lazyLoad: true,
        responsive: {
            // breakpoint from 0 up
            0: {
                items: 1
            },
            768: {
                items: 2
            },
            // breakpoint from 768 up
            1200: {
                items: 3
            }
        }
    });
});

$('#owlCarousel-2').owlCarousel({
    loop: false,
    margin: 10,
    autoplay: false,
    autoplayTimeout: 5000,
    dots: false,
    items: 3,
    nav: false,
    responsive: {
            // breakpoint from 0 up
            0: {
                items: 1,
                autoplay: true,
                loop: true,
                nav: true
            },
            480: {
                items: 3,
                nav: false
            }
        }
});

$(document).on('click', '.btn-send-ajax', function () {
    var url = $(this).data('controller');
    if (url) {
        sendAjax(url, 'GET', null, function (data) {
            openAlert(data.value);
        });
    }
});