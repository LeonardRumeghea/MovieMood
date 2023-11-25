package com.example.service.rabbitmq;

import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

@Service
public class RabbitMqService implements IRabbitMqService {

    private Jackson2JsonMessageConverter converter;
    private final String QUEUE = "queue";
    private final String EXCHANGE = "exchange";
    private final String ROUTING_KEY = "routingKey";


    @Bean
    public Queue queue() {
        return new Queue(QUEUE);
    }

    @Bean
    public TopicExchange exchange() {
        return new TopicExchange(EXCHANGE);
    }

    @Bean
    public Binding binding(Queue queue, TopicExchange exchange) {
        return BindingBuilder.bind(queue).to(exchange).with(ROUTING_KEY);
    }

    @Override
    public void send(Object obj) {

        RabbitTemplate rabbitTemplate = new RabbitTemplate();

        rabbitTemplate.setMessageConverter(converter);
        rabbitTemplate.convertAndSend(EXCHANGE, ROUTING_KEY, obj);
    }

}
