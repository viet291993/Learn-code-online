$(document).on('click', '.btn-send-ajax', function () {
    var url = $(this).data('controller');
    if (url) {
        sendAjax(url, 'GET', null, function (data) {
            reloadAjaxContent();
        });
    }
});

$(document).on('click', '.btn-send-ajax-alert', function () {
    var url = $(this).data('controller');
    if (url) {
        sendAjax(url, 'GET', null, function (data) {
            openAlert(data.value);
            reloadAjaxContent();
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

function sendAjaxWithJsonObj(url, type, data, handle) {
    $.ajax({
        url: url,
        type: type,
        data: data,
        contentType: 'application/json',
        success: function (data) {
            if (typeof handle !== "undefined") {
                handle(data);
            }
        }, error: function () {
            alert('Error!');
        }
    });
}
function reloadAjaxContent() {
    var url = $('#reloadController').val();
    sendAjax(url, 'GET', null, function (data) {
        $('.ajax-content').html(data);
    });
}

/*

$(document).on('show.bs.dropdown', '.table-responsive', function () {
    $(this).css("overflow", "inherit");
});

$(document).on('hide.bs.dropdown', '.table-responsive', function () {
    $(this).css("overflow", "auto");
});


var timeoutDisplayMessage;
function openMessage(data, callback) {
    clearTimeout(timeoutDisplayMessage);
    if (typeof data !== "undefined") {
        $('body').append(data);
    }
    if (typeof callback === 'function') {
        callback();
    }
    $('#message').fadeIn(200, function () {
        reloadAjaxContent();
    });
    timeoutDisplayMessage = setTimeout(function () {
        $('#message').remove();
    }, 3000);
}
$(document).on('click', '#message .close', function () {
    clearTimeout(timeoutDisplayMessage);
    $('#message').remove();
});




$(document).on('change', '.btn-change-display-per-page', function () {
    window.location.href = $(this).attr('controller') + $(this).val();
});
$(document).on('click', '.btn-open-modal', function (e) {
    e.preventDefault();
    var controller = $(this).data('controller');
    if (typeof controller !== "undefined") {
        sendAjax(controller, 'GET', null, function (data) {
            $('body').append(data);
            $('#myModal').modal({show: true});
        });
    }
});
$(document).on('hide.bs.modal', '.modal', function () {
    $(this).remove();
});
$(document).on('hidden.bs.modal', '.modal', function () {
    $(this).remove();
});
$(document).on('click', '.dropdown-select', function (e) {
    e.stopPropagation();
});
$(document).ready(function () {
    $(document).on('change', '.module-role-list li>label input[type=checkbox]', function () {
        if ($(this).is(':checked')) {
            $(this).parents('label').parent('li').children('ul').find('input[type=checkbox]').prop('checked', true);
        } else {
            $(this).parents('label').parent('li').children('ul').find('input[type=checkbox]').prop('checked', false);
        }
    });

});

$(document).on('click touchstart', '#treeDiagram .far', function () {
    $(this).toggleClass('fa-plus-square').addClass('fa-minus-square');
    $(this).parent().next('ul').toggle(0);
});
$(document).on('click touchstart', '#treeDiagram .far', function () {
    var target = $(this).parents('.next-item');
    $(target).removeClass('next-item');
    var controller = $(this).attr('controller');
    sendAjax(controller, 'GET', null, function (data) {
        $(target).append(data);
    });
});
$(document).ready(function () {
    $('.popover-dismiss').popover({
        trigger: 'hover',
        html: true,
        container: 'body'
    });
});
$(document).ajaxComplete(function () {
    if ($('.popover-dismiss').length) {
        $('.popover-dismiss').popover({
            trigger: 'hover',
            html: true,
            container: 'body'
        });
    }
});

function openMessageNotReload(data, callback) {
    clearTimeout(timeoutDisplayMessage);
    if (typeof data !== "undefined") {
        $('body').append(data);
    }
    $('#message').fadeIn(200);
    timeoutDisplayMessage = setTimeout(function () {
        $('#message').remove();
        if (callback !== null) {
            callback();
        }
    }, 3000);
}

$('.btn-change-lang').click(function (e) {
    e.preventDefault();
    var lang = $(this).data('lang');
    document.cookie = 'adminLang=' + lang + '; path=/';
    window.location.href = '';
});
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
    if (!getCookie("adminLang")) {
        document.cookie = 'adminLang=vi; path=/';
        $('.selected-lang').html('vi');
    }
});*/