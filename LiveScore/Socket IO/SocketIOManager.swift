//
//  SocketIO.swift
//  LiveScore
//
//  Created by MinhNT on 9/6/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import SocketIO
import ObjectMapper
class SocketIOManager: NSObject {
    
    static  var sharedInstance:SocketIOManager?
    
    public class func getInstance()-> SocketIOManager{
        if sharedInstance != nil {
            return sharedInstance!
        }
        return SocketIOManager()
    }
    
    var manager: SocketManager = SocketManager(socketURL: URL(string: Config.socket)!, config: [.log(true), .compress])
    lazy var socket = manager.defaultSocket
    
    override init() {
        super.init()
        
        SocketIOManager.sharedInstance = self
        
        
        socket.on(clientEvent: .connect) {data, ack in
            self.getData()
        }
        
        socket.on("SendListAllMatchesLiveScore") { (data, ack) -> Void in
            let scores: [String: Any] = ["scores": Mapper<MatchesEntity>().map(JSONString: data[0] as! String)!]
            if scores != nil {
                NotificationCenter.default.post(name: notificationName.ScoresToday.notification, object: nil, userInfo: scores)
            }
        }
    }
    
    func getData(){
        if socket.status == .connected {
            socket.emit("SendListAllMatchesLiveScore", with: [])
        }
    }
    
    func closeConnection() {
        print("Ta Tuan Minh  closeConnection")
        socket.off("SendListAllMatchesLiveScore")
        socket.off(clientEvent:.connect)
        socket.disconnect()
    }
    
    func establishConnection() {
        if socket.status == .disconnected || socket.status == .notConnected{
            socket.connect()
        }
        
        
    }
    
}
