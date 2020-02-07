//
//  MatchesGateway.swift
//  LiveScore
//
//  Created by MinhNT on 10/2/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation

typealias MathchesGatewayCompletionHandler = (_ list: Result<MatchesEntity>) -> Void
typealias MathchesDetailGatewayCompletionHandler = (_ m : Result<MatchesEntity>) -> Void
typealias MathchesTopPlayerGatewayCompletionHandler = (_ topPlayer: Result<TopPlayerEntity>) -> Void
protocol MatchesGateway {
    func getListMatches(startDate:String, endDate:String, team_id:Int,leagues_id:Int, season_id:Int,include:String, completionHandler: @escaping MathchesGatewayCompletionHandler)
    func getMatchesDetail(fixture_id:Int?, completionHandler: @escaping MathchesGatewayCompletionHandler)
//    func getListStanding(leagues_id:Int, season_id:Int, round_id,)
    
    func getTopPlayerTeam(seasonId:Int, teamId:Int, completionHandler: @escaping MathchesTopPlayerGatewayCompletionHandler)
}
