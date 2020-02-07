//
//  StandingDetailEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class StandingDetailEntity: Mappable {
    var league_id: Int?
    var logo_path:String?
    var league_name:String?
    var data_table:[StandingTableEntity] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        league_id <- map["league_id"]
        logo_path <- map["logo_path"]
        league_name <- map["league_name"]
        data_table <- map["data_table"]
    }
}
