$.fn.serializeObject = function () {
    var o = {};
    $.each($(this).find('input:not(.external),select:not(.external),textarea:not(.external)'), function () {
        if (typeof $(this).attr('name') !== 'undefined') {
            var v;
            if ($(this).is('button')) {
                return;
            } else if ($(this).attr('type') === 'checkbox') {
                v = $(this).is(':checked');
                o[$(this).attr('name')] = v;
            } else if ($(this).attr('type') === 'radio') {
                if ($(this).is(':checked')) {
                    v = $(this).val();
                    o[$(this).attr('name')] = v;
                }
            } else if ($(this).val() === '') {
                return;
            } else if ($(this).data('json')) {
                v = {};
                switch ($(this).data('type')) {
                    case 'int':
                    {
                        v[$(this).data('json')] = parseInt($(this).val());
                        break;
                    }
                    case 'decimal':
                    {
                        v[$(this).data('json')] = parseFloat($(this).val());
                        break;
                    }
                    case 'boolean':
                    {
                        v[$(this).data('json')] = Boolean.valueOf($(this).val());
                        break;
                    }
                    default :
                    {
                        v[$(this).data('json')] = $(this).val();
                    }
                }
                o[$(this).attr('name')] = v;
            } else {
                switch ($(this).data('type')) {
                    case 'int':
                    {
                        v = parseInt($(this).val());
                        break;
                    }
                    case 'decimal':
                    {
                        v = parseFloat($(this).val());
                        break;
                    }
                    case 'boolean':
                    {
                        v = Boolean.valueOf($(this).val());
                        break;
                    }
                    case 'object':
                    {
                        v = JSON.parse($(this).val());
                        break;
                    }
                    default :
                    {
                        v = $(this).val();
                    }
                }
                o[$(this).attr('name')] = v;
            }
        }
    });
    return o;
};

var alertInterval;
function openAlert(data, callback) {
    clearInterval(alertInterval);
    $('body').append(data);
    if (typeof callback === 'function') {
        callback();
    }
    if (data != null) {
        if (data.toString().includes("error")) {
            alertInterval = setInterval(function () {
                $('#noty_layout__topCenter').remove();
            }, 5000);
        } else {
            alertInterval = setInterval(function () {
                $('#noty_layout__topCenter').remove();
            }, 3000);
        }
    }
}