//
//  StandingTableEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class StandingTableEntity: Mappable {
    var group_name: String?
    var league_id:Int?
    var season_id:Int?
    var round_id:Int?
    var stage_id:Int?
    var stage_name:String?
    var data_position:[StandingPositionEntity] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        group_name <- map["group_name"]
        league_id <- map["league_id"]
        season_id <- map["season_id"]
        round_id <- map["round_id"]
        stage_id <- map["stage_id"]
        stage_name <- map["stage_name"]
        data_position <- map["data_position"]
    }
}
