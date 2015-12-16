
$(function () {

    var $formLogin = $('#login-form');
    //var $divForms = $('#div-forms');
    var $modalAnimateTime = 300;
    var $msgAnimateTime = 150;
    var $msgShowTime = 2000;

    $("div").submit(function () {
        switch (this.id) {
            case "login-form":
                var $lg_username = $('#login_username').val();
                var $lg_password = $('#login_password').val();
                if ($lg_username == "ERROR") {
                    msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "error", "glyphicon-remove", "Login error");
                } else {
                    msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "success", "glyphicon-ok", "Login OK");
                }
                return false;
                break;
            case "lost-form":
                var $ls_email = $('#lost_email').val();
                if ($ls_email == "ERROR") {
                    msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "error", "glyphicon-remove", "Email error");
                } else {
                    msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "success", "glyphicon-ok", "Email enviado");
                }
                return false;
                break;
            default:
                return false;
        }
        return false;
    });

    $('#login_lost_btn').click(function () {
        $('.modal-lost-password').css('display', 'block');
        $('.modal-login').css('display', 'none');
        $('#login_username').prop('disabled', true);
        $('#login_password').prop('disabled', true);
        $('#lost_email').prop('disabled', false);
    });

    $('#lost_login_btn').click(function () {
        $('.modal-lost-password').css('display', 'none');
        $('.modal-login').css('display', 'block');
        $('#login_username').prop('disabled', false);
        $('#login_password').prop('disabled', false);
        $('#lost_email').prop('disabled', true);
    });


    function msgFade($msgId, $msgText) {
        $msgId.fadeOut($msgAnimateTime, function () {
            $(this).text($msgText).fadeIn($msgAnimateTime);
        });
    }

    function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass, $msgText) {
        var $msgOld = $divTag.text();
        msgFade($textTag, $msgText);
        $divTag.addClass($divClass);
        $iconTag.removeClass("glyphicon-chevron-right");
        $iconTag.addClass($iconClass + " " + $divClass);
        setTimeout(function () {
            msgFade($textTag, $msgOld);
            $divTag.removeClass($divClass);
            $iconTag.addClass("glyphicon-chevron-right");
            $iconTag.removeClass($iconClass + " " + $divClass);
        }, $msgShowTime);
    }
});