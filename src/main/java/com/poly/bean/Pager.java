package com.poly.bean;

public class Pager {

    private int displayPerPage = 10;
    private int currentPage = 1;
    private int totalResult = 0;
    private String orderColumn = "";
    private String keyword ="";
    private boolean asc = true;
    private Integer companyID = 0;
    private Integer typeHistoryID;
    private Integer status;  

    public Pager() {
    }

    public int getDisplayPerPage() {
        return displayPerPage;
    }

    public void setDisplayPerPage(int displayPerPage) {
        this.displayPerPage = displayPerPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalResult() {
        return totalResult;
    }

    public void setTotalResult(Integer totalResult) {
        this.totalResult = totalResult;
    }

    public boolean getAsc() {
        return asc;
    }

    public void setAsc(boolean asc) {
        this.asc = asc;
    }

    public String getOrderColumn() {
        return orderColumn;
    }

    public void setOrderColumn(String orderColumn) {
        this.orderColumn = orderColumn;
    }

    public int getTotalPage() {
        return totalResult % displayPerPage > 0 ? totalResult / displayPerPage + 1 : totalResult / displayPerPage;
    }

    public int getFirstResult() {
        return (currentPage - 1) * displayPerPage;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getCompanyID() {
        return companyID;
    }

    public void setCompanyID(Integer companyID) {
        this.companyID = companyID;
    }

    public Integer getTypeHistoryID() {
        return typeHistoryID;
    }

    public void setTypeHistoryID(Integer typeHistoryID) {
        this.typeHistoryID = typeHistoryID;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }


    
}
