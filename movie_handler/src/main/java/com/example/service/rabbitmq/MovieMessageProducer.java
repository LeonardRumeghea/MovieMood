package com.example.service.rabbitmq;

import com.example.model.Movie;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MovieMessageProducer {

    private final AmqpTemplate rabbitTemplate;

    @Autowired
    public MovieMessageProducer(AmqpTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
    }

    public void sendMessage(Movie movie) {
        rabbitTemplate.convertAndSend("movieQueue", movie);
    }
}
