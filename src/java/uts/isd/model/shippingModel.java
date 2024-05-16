package uts.isd.model;

public class shippingModel {
    private String address;
    private String method;
    private String date;

    public shippingModel(String address, String method, String date) {
        this.address = address;
        this.method = method;
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
