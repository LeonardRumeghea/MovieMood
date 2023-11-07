package com.example.api_gateway;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.task.TaskExecutor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.*;
import org.springframework.http.*;
import org.springframework.web.client.*;
import jakarta.servlet.http.*;

import java.util.*;
import java.util.concurrent.CompletableFuture;

@RestController
class Controller {
    @Qualifier("applicationTaskExecutor")
    @Autowired
    private TaskExecutor executor;

    private RestTemplate restTemplate;
    private Map<String, String> micoserviceUrl;

    Controller() {
        this.restTemplate = new RestTemplate();
        this.micoserviceUrl = new HashMap<>();
        //todo: read from config file
    }


    @RequestMapping(value = "/**", method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE})
    public ResponseEntity<String> proxy(HttpServletRequest request) {
        HttpMethod method = HttpMethod.valueOf(request.getMethod());
        String path = request.getRequestURI();
        Map<String, String> headers = getHeaders(request);
        RequestCallback requestCallback = restTemplate.httpEntityCallback(new HttpEntity<>(headers), String.class);
        ResponseExtractor<ResponseEntity<String>> responseExtractor = restTemplate.responseEntityExtractor(String.class);

        CompletableFuture<ResponseEntity<String>> future = CompletableFuture.supplyAsync(() -> restTemplate.execute(path, method, requestCallback, responseExtractor), executor);

        return future.join();
    }

    private Map<String, String> getHeaders(HttpServletRequest request) {
        Map<String, String> map = new HashMap<>();
        Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String key = headerNames.nextElement();
            String value = request.getHeader(key);
            map.put(key, value);
        }
        return map;
    }
}