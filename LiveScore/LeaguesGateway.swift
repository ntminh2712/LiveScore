//
//  LeaguesGateway.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation

typealias LeaguesGatewayCompletionHandler = (_ list: Result<LeaguesEntity>) -> Void
typealias LeaguesFixturesGatewayCompletionHandler = (_ fixture: Result<LeaguesFixturesEntity>) -> Void
typealias LeaguesStandingGatewayCompletionHandler = (_ standing: Result<StandingEntity>) -> Void
typealias LeaguesTeamGatewayCompletionHandler = (_ standing: Result<LeaguesTeamEntity>) -> Void
typealias LeaguesTopPlayerGatewayCompletionHandler = (_ topPlayer: Result<TopPlayerEntity>) -> Void
protocol LeaguesGateway {
    func getLeaguesDetail(id:Int, completionHandler:@escaping LeaguesGatewayCompletionHandler)
    func getLeaguesFixtures(leaguesId:Int?, page:Int?,completionHandler: @escaping LeaguesFixturesGatewayCompletionHandler)
    func getListStanding(leaguesId:Int?, completionHandler: @escaping LeaguesStandingGatewayCompletionHandler)
    func getListTeam(season_id:Int?, completionHandler:@escaping LeaguesTeamGatewayCompletionHandler)
    func getTopPlayerLeagues(season_id:Int?, completionHandler:@escaping LeaguesTopPlayerGatewayCompletionHandler)
}
