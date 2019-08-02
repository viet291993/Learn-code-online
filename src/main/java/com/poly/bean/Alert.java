package com.poly.bean;

public class Alert {

    public static final String TYPE_ERROR = "error";
    public static final String TYPE_SUCCESS = "success";
    public static final String TYPE_WARNING = "warning";
    public static final String TYPE_INFO = "info";

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

    public static String createAlert(String type,String title,String text) {
        StringBuilder sB = new StringBuilder();
        sB.append("<script>")
                .append("new PNotify({title:'")
                .append(title)
                .append("',text:'")
                .append(text)
                .append("',type:'")
                .append(type)
                .append("',styling: 'bootstrap3'});")
                .append("</script>");
        return sB.toString();
    }
    
    public static String createAlertTopCenter(String type,String title,String text) {
        StringBuilder sB = new StringBuilder();
        sB.append("<script>")
                .append("new PNotify({title:'")
                .append(title)
                .append("',text:'")
                .append(text)
                .append("',type:'")
                .append(type)
                .append("',styling: 'bootstrap3', addclass: 'pnotify-center'});")
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
