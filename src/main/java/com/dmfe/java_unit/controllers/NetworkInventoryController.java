package com.dmfe.java_unit.controllers;

import com.dmfe.java_unit.model.NetworkElement;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/ni")
public class NetworkInventoryController {

    @GetMapping(value = "/network-elements", produces = "application/json")
    @ResponseStatus(HttpStatus.OK)
    public List<NetworkElement> getNetworkElements() {
        List<NetworkElement> networkElements = List.of(
                NetworkElement.builder()
                        .id("1")
                        .name("nn-gagar-gw1")
                        .type("router")
                        .vendor("cisco")
                        .ipAddress("172.16.1.1")
                        .build(),
                NetworkElement.builder()
                        .id("2")
                        .name("nn-gagar-dsw1")
                        .type("switch")
                        .vendor("cisco")
                        .ipAddress("172.16.1.2")
                        .build(),
                NetworkElement.builder()
                        .id("3")
                        .name("nn-gagar-asw1")
                        .type("switch")
                        .vendor("cisco")
                        .ipAddress("172.16.1.3")
                        .build()
                );

        return networkElements;
    }
}
