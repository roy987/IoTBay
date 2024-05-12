/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model;

import java.beans.*;
import java.io.Serializable;

/**
 *
 * @author jakesolsky
 */
public class UserLog implements Serializable {
    
    private String logId;
    private String email;
    private String eventType;
    private String eventTime;
    
    public UserLog() {
    }
    
    public UserLog(String logId, String email, String eventType, String eventTime) {
        this.logId = logId;
        this.email = email;
        this.eventType = eventType;
        this.eventTime = eventTime;
    }
    
    public String getLogId() {
        return this.logId;
    }
    
    public String getEmail() {
        return this.email;
    } 
    
    public String getEventType() {
        return this.eventType;
    }
    
    public String getEventTime(){
        return this.eventTime;
    }
    
    @Override
    public String toString() {
        return email + " | " + eventType + " - " + eventTime;
    }
    
    
}
