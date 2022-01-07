package com.groupware.worktech.chat.common;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// EndPoint : 서버와 클라이언트가 웹소켓 통신을 하기 위한 엔드포인트
		//			    클라이언트에서 Socket을 생성할 때 이 부분에서 정의한 문자열을 사용하여야 함 
		
		registry.addEndpoint("/chat").setAllowedOriginPatterns("*").withSockJS(); // STOMP에서 prefix URL을 어떻게 적용할 것인지 설정함
		// withSockJS()를 사용하는 경우 websocket 형태로 연결이 불가능한 경우에 http를 사용하여 연결이 지속되도록 함
	}
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		// 해당 문자열로 시작하는 message 주소값을 받아서 처리하는 Broker를 활성화함
		// 메모리 기반 메시지 브로커가 /topic 접두사가 붙은 클라이언트로 메시지를 전달할 수 있도록 설정
		// -> 클라이언트 A,B,C가 각각 /topic/master, /topic/sub, /topic/master를 구독하고 있을때 /topic/master로 메시지를 전송하면 클라이언트 A,C만 메시지를 받게 됨
		registry.enableSimpleBroker("/topic"); 
		
		// 클라이언트가 서버로 메시지를 보낼 때 붙어야 하는 url prefix
		// /app로 접근하는 메시지만 핸들러로 라우팅함
		// -> /topic/hello라는 토픽에 대해 구독하면 실제 경로는 /app/topic/hello가 됨
		registry.setApplicationDestinationPrefixes("/app"); 
	}
	
}
