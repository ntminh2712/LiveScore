//
//  MatchesDetailEntity.swift
//  LiveScore
//
//  Created by MinhNT on 10/2/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import ObjectMapper
class MatchesDetailEntity: Mappable {
    var fixture_id: Int?
    var localteam_id: Int?
    var localteam_name:String?
    var localteam_flag:String?
    var visitorteam_id: Int?
    var visitorteam_name:String?
    var visitorteam_flag:String?
    var localteam_score:Int?
    var visitorteam_score:Int?
    var status:String?
    var highlights:[HighLightEntity] = []
    var kick_of_date:Int?
    var lineup:[MatchesLineupsEntity] = []
    var scores:MatchesScoresEntity?
    var favorites:Bool? = false
    var tag_pen:Bool?
    var tag_agg:Bool?
    var events: [MatchesEventsEntity] = []
    var coaches: [MatchesCoachesEntity] = []
    var referee: MatchesRefereeEntity?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        fixture_id <- map["fixture_id"]
        localteam_id <- map["localteam_id"]
        localteam_name <- map["localteam_name"]
        localteam_flag <- map["localteam_flag"]
        visitorteam_id <- map["visitorteam_id"]
        visitorteam_name <- map["visitorteam_name"]
        visitorteam_flag <- map["visitorteam_flag"]
        localteam_score <- map["localteam_score"]
        visitorteam_score <- map["visitorteam_score"]
        status <- map["status"]
        highlights <- map["highlights"]
        kick_of_date <- map["kick_off_date"]
        lineup <- map["lineup"]
        scores <- map["scores"]
        favorites <- map["favorite"]
        tag_pen <- map["tag_pen"]
        tag_agg <- map["tag_agg"]
        events <- map["events"]
        coaches <- map["coaches"]
        referee <- map["referee"]
    }
}
