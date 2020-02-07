//
//  ExploreResultEntity.swift
//  LiveScore
//
//  Created by MinhNT on 9/18/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class ExploreResultEntity: Mappable {
    var popular: [ExploreLeaguesEntity] = []
    var world: [ExploreLeaguesEntity] = []
    var national: [ExploreNationEntity] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        popular <- map["popular"]
        national <- map["national"]
        world <- map["world"]
    }
}
