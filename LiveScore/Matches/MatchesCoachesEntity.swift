//
//  MatchesCoachesEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/2/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class MatchesCoachesEntity: Mappable {
   
    var localteam: MatchesCoachesEntity?
    var visitorteam: MatchesCoachesEntity?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        localteam <- map["localteam"]
        visitorteam <- map["visitorteam"]
    }
}
