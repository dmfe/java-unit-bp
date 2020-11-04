package com.dmfe.java_unit.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class NetworkElement {
    private String id;
    private String name;
    private String type;
    private String vendor;
    private String ipAddress;
}
