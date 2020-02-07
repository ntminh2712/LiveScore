//
//  ApiMatchesGateway.swift
//  LiveScore
//
//  Created by MinhNT on 10/2/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiMatchesGateway: MatchesGateway {
    
}

class ApiMatchesGatewayImplementation: ApiMatchesGateway {
    
    func getListMatches(startDate: String, endDate: String, team_id: Int, leagues_id: Int, season_id: Int, include: String, completionHandler: @escaping MathchesGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getListMatches(startDate, endDate, team_id, leagues_id, season_id, include)).asObservable().mapObject(MatchesEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    func getMatchesDetail(fixture_id: Int? , completionHandler: @escaping MathchesGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getMatchesDetail(fixture_id)).asObservable().mapObject(MatchesEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    func getTopPlayerTeam(seasonId: Int, teamId: Int, completionHandler: @escaping MathchesTopPlayerGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getTopPlayerTeam(seasonId, teamId)).asObservable().mapObject(TopPlayerEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
}
