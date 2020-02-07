//
//  ApiTeamGateway.swift
//  LiveScore
//
//  Created by MinhNT on 10/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiTeamGateway: TeamsGateway {
    
}

class ApiTeamGatewayImplementation: ApiTeamGateway {
    
    func getTeamDetail(teamId: Int, seasonId: Int, completionHandler: @escaping TeamDetailGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getTeamDetail(teamId, seasonId)).asObservable().mapObject(TeamsEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    func getTopPlayerTeam(teamId: Int, seasonId: Int, completionHandler: @escaping TeamTopPlayerGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getTopPlayerTeam(teamId, seasonId)).asObservable().mapObject(TopPlayerEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func getTeamFixture(teamId: Int,page:Int, completionHandler: @escaping TeamFixturesGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getTeamFixture(teamId, page)).asObservable().mapObject(TeamFixturesEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func getTeamStanding(teamId: Int, completionHandler: @escaping TeamStandingGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getTeamStanding(teamId)).asObservable().mapObject(StandingEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func getTeamLineup(teamId: Int, completionHandler: @escaping TeamLineupGatewayCompletionHandeler) {
        apiProvider.request(TSAPI.getTeamLineUp(teamId)).asObservable().mapObject(LineupEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
}
