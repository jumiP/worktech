package com.groupware.worktech.chat.common;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(chattingHandler(), "/chat")
				.addInterceptors(new HttpSessionHandshakeInterceptor())
				.withSockJS();
	}

	@Bean
	public WebSocketHandler chattingHandler() {
		return new ChattingHandler();
	}
	
	@Bean
    public ServletServerContainerFactoryBean createWebSocketContainer(){
        // WebSocket의 런타임 특성 제어
        ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean();
//        container.setMaxTextMessageBufferSize(8192);
//        container.setMaxBinaryMessageBufferSize(8192);
        return container;
    }
}
