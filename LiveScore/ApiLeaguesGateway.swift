//
//  ApiLeaguesGateway.swift
//  LiveScore
//
//  Created by MinhNT on 10/14/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiLeaguesGateway: LeaguesGateway {
    
}

class ApiLeaguesGatewayImplementation: ApiLeaguesGateway {
    
    func getLeaguesDetail(id: Int, completionHandler: @escaping LeaguesGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getLeaguesDetail(id)).asObservable().mapObject(LeaguesEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func getLeaguesFixtures(leaguesId: Int?, page:Int?, completionHandler: @escaping LeaguesFixturesGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getLeaguesFixture(leaguesId, page)).asObservable().mapObject(LeaguesFixturesEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func getListStanding(leaguesId: Int?, completionHandler: @escaping LeaguesStandingGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getListStanding(leaguesId, 0, 0)).asObservable().mapObject(StandingEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    func getListTeam(season_id: Int?, completionHandler: @escaping LeaguesTeamGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getListTeams(season_id)).asObservable().mapObject(LeaguesTeamEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    func getTopPlayerLeagues(season_id: Int?, completionHandler: @escaping LeaguesTopPlayerGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getTopPlayerLeagues(season_id)).asObservable().mapObject(TopPlayerEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
}
