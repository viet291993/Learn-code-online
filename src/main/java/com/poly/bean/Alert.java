package com.poly.bean;

public class Alert {

    private static final String TYPE_ERROR = "error";
    private static final String TYPE_SUCCESS = "success";
    private static final String TYPE_WARNING = "warning";
    private static final String TYPE_INFO = "information";

    public static String createIntervalRedirect(String title, String redirectString, String redirectUrl, int timeInMiliseconds) {
        StringBuilder sB = new StringBuilder();
        sB.append("<script>")
                .append("var redirectIntervalCount = ").append(timeInMiliseconds).append(";")
                .append("new Noty({theme: 'nest',type: '")
                .append(TYPE_SUCCESS)
                .append("',layout: 'topCenter',text:'")
                .append(title).append("<br/>")
                .append(redirectString)
                .append("<strong id=\"countdown-time\">'+(redirectIntervalCount/1000)+'</strong>s'}).show();")
                .append("var redirectInterval = setInterval(function () {")
                .append("redirectIntervalCount -= 1000;")
                .append("if (redirectIntervalCount <= 0) {")
                .append("clearInterval(redirectInterval);")
                .append("window.location.href = '").append(redirectUrl).append("';")
                .append("} else {")
                .append("$('#countdown-time').html(redirectIntervalCount / 1000)")
                .append("}}, 1000);");
        sB.append("</script>");
        return sB.toString();
    }

    public static String createReloadPage() {
        StringBuilder sB = new StringBuilder();
        sB.append("<script>location.reload();</script>");
        return sB.toString();
    }

    public static String createRedirectPage(String href) {
        StringBuilder sB = new StringBuilder();
        sB.append("<script>window.location.href='");
        sB.append(href);
        sB.append("';</script>");
        return sB.toString();
    }

    public static String createSuccessAlert(String text) {
        StringBuilder sB = new StringBuilder();
        sB.append("<script>")
                .append("new Noty({theme: 'nest',type: '")
                .append(TYPE_SUCCESS)
                .append("',layout: 'topCenter',text:'<p><i class=\"fas fa-check-circle\"></i>&nbsp;&nbsp;")
                .append(text)
                .append("</p>'}).show();")
                .append("</script>");
        return sB.toString();
    }
    public static String createWarningAlert(String text) {
        StringBuilder sB = new StringBuilder();
        sB.append("<script>")
                .append("new Noty({theme: 'nest',type: '")
                .append(TYPE_WARNING)
                .append("',layout: 'topCenter',text:'<p><i class=\"fas fa-exclamation\"></i>&nbsp;&nbsp;")
                .append(text)
                .append("'}).show();")
                .append("</script>");
        return sB.toString();
    }
    public static String createErrorAlert(String text) {
        StringBuilder sB = new StringBuilder();
        sB.append("<script>")
                .append("new Noty({theme: 'nest',type: '")
                .append(TYPE_ERROR)
                .append("',layout: 'topCenter',text:'<p><i class=\"fas fa-exclamation-triangle\"></i>&nbsp;&nbsp;")
                .append(text)
                .append("'}).show();")
                .append("</script>");
        return sB.toString();
    }
    public static String createInfoAlert(String text) {
        StringBuilder sB = new StringBuilder();
        sB.append("<script>")
                .append("new Noty({theme: 'nest',type: '")
                .append(TYPE_INFO)
                .append("',layout: 'topCenter',text:'<p><i class=\"fas fa-info-circle\"></i>&nbsp;&nbsp;")
                .append(text)
                .append("'}).show();")
                .append("</script>");
        return sB.toString();
    }
    public static String createScript(String script) {
        StringBuilder sB = new StringBuilder();
        sB.append("<script>")
                .append(script)
                .append("</script>");
        return sB.toString();
    }
}
