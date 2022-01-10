package com.groupware.worktech.alarm.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class AlarmWsConfig implements WebSocketConfigurer{
	
	@Autowired
	private WebSocketHandler alarmHandler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(alarmHandler, "/alarm")
		.setAllowedOriginPatterns("*")
		.withSockJS();
	}

//	@Bean
//	public WebSocketHandler alarmHandler() {
//		return new AlarmHandler();
//	}
	
}

