//
//  TeamGateway.swift
//  LiveScore
//
//  Created by MinhNT on 10/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
typealias TeamDetailGatewayCompletionHandler = (_ topPlayer: Result<TeamsEntity>) -> Void
typealias TeamTopPlayerGatewayCompletionHandler = (_ topPlayer: Result<TopPlayerEntity>) -> Void
typealias TeamFixturesGatewayCompletionHandler = (_ topPlayer: Result<TeamFixturesEntity>) -> Void
typealias TeamStandingGatewayCompletionHandler = (_ stading: Result<StandingEntity>) -> Void
typealias TeamLineupGatewayCompletionHandeler = (_ lineup: Result<LineupEntity>) -> Void
protocol TeamsGateway {
    func getTeamDetail(teamId:Int, seasonId:Int, completionHandler:@escaping TeamDetailGatewayCompletionHandler)
    func getTopPlayerTeam(teamId:Int,seasonId:Int, completionHandler:@escaping TeamTopPlayerGatewayCompletionHandler)
    func getTeamFixture(teamId:Int,page:Int,completionHandler:@escaping TeamFixturesGatewayCompletionHandler)
    func getTeamStanding(teamId:Int,completionHandler:@escaping TeamStandingGatewayCompletionHandler)
    func getTeamLineup(teamId:Int,completionHandler:@escaping TeamLineupGatewayCompletionHandeler)
}
