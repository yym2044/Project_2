package com.yym.infra.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {

	List<WebSocketSession> sessions = new ArrayList<>();
    
    // 웹 소켓에 연결될 때 호출되는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("접속===========================");
        System.out.println(session.getId());
        System.out.println("접속===========================");
        sessions.add(session);
    }
    
    // 메시지를 전송받았을때 호출되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("메시지가 왔어요...");
        System.out.println(session.getId() + ", " + message.getPayload());
        System.out.println("메시지가 왔어요...");
        
//        for (WebSocketSession webSocketSession : sessions) {
//            if (webSocketSession.isOpen() && !session.getId().equals(webSocketSession.getId())) {
//                webSocketSession.sendMessage(message);
//            }
//        }
        
        for (WebSocketSession webSocketSession : sessions) {
			webSocketSession.sendMessage(message);
		} 
        
	}
	
	// 웹 소켓이 연결이 클로즈될때 호출되는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println("접속 close===========================");
        System.out.println(session.getId());
        System.out.println("접속 close===========================");
        sessions.remove(session);
    }

    
    
}
