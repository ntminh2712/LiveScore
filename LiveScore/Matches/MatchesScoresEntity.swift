//
//  MatchesScoresEntity.swift
//  LiveScore
//
//  Created by MinhNT on 11/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class MatchesScoresEntity: Mappable {
    var ft_score:String?
    var visitorteam_pen_score:String?
    var ht_score:String?
    var et_score:String?
    var visitorteam_score:Int?
    var localteam_score:Int?
    var localteam_pen_score:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        ft_score <- map["ft_score"]
        visitorteam_pen_score <- map["visitorteam_pen_score"]
        ht_score <- map["ht_score"]
        et_score <- map["et_score"]
        visitorteam_score <- map["visitorteam_score"]
        localteam_score <- map["localteam_score"]
        localteam_pen_score <- map["localteam_pen_score"]
    }
}
