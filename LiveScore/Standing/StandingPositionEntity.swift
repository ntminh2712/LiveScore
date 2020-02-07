//
//  StandingPositionEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class StandingPositionEntity: Mappable {
    var position: Int?
    var points:Int?
    var team_id:Int?
    var team_name:String?
    var team_flag:String?
    var played:Int = 0
    var wins:Int = 0
    var lost:Int = 0
    var draws:Int = 0
    var goal_diff:Int = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        position <- map["position"]
        points <- map["points"]
        team_id <- map["team_id"]
        team_name <- map["team_name"]
        team_flag <- map["team_flag"]
        played <- map["played"]
        wins <- map["wins"]
        lost <- map["lost"]
        draws <- map["draws"]
        goal_diff <- map["goal_diff"]
    }
}
