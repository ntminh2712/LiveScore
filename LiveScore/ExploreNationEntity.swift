//
//  ExploreNationEntity.swift
//  LiveScore
//
//  Created by MinhNT on 9/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class ExploreNationEntity: Mappable {
    var name:String = ""
    var country_id:Int = 0
    var code:String = ""
    var flag: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        country_id <- map["country_id"]
        code <- map["code"]
        flag <- map["flag"]
    }
}
