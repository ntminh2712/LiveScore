//
//  MatchesLineupsEntity.swift
//  LiveScore
//
//  Created by MinhNT on 11/11/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class MatchesLineupsEntity: Mappable {
    
    var name: String?
    var data: [TopPlayerTypeEntity] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        data <- map["data"]
    }
}
