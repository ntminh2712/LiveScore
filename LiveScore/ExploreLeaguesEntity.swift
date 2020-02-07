//
//  ExploreDataEntity.swift
//  LiveScore
//
//  Created by MinhNT on 9/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class ExploreLeaguesEntity: Mappable {
    var league_id:Int = 0
    var status:Int = 0
    var popular:Int = 0
    var world:Int = 0
    var country_id:Int = 0
    var logo_path:String = ""
    var name:String = ""
    var country:String = ""
    var favorites:Bool = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        league_id <- map["league_id"]
        status <- map["status"]
        popular <- map["popular"]
        world <- map["world"]
        country_id <- map["country_id"]
        logo_path <- map["logo_path"]
        name <- map["name"]
        country <- map["country"]
        favorites <- map["favorites"]
    }
}
