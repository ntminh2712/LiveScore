//
//  StandingOverallEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class StandingOverallEntity: Mappable {
    var games_played: Int?
    var won:Int?
    var draw:Int?
    var lost:Int?
    var goals_scored:Int?
    var goals_against:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        games_played <- map["games_played"]
        won <- map["won"]
        draw <- map["draw"]
        lost <- map["lost"]
        goals_scored <- map["goals_scored"]
        goals_against <- map["goals_against"]
    }
}
