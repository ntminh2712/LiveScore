
//
//  ApiExploreGeteway.swift
//  FoxLive
//
//  Created by HOANPV on 10/5/18.
//  Copyright © 2018 HOANDHTB. All rights reserved.
//

import UIKit
import ObjectMapper
protocol ApiExploreGateway: ExploreGateway {

}

class ApiExploreGatewayImplementation: ApiExploreGateway
{
   
    func getExplore(completionHandler: @escaping ExploreGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getListExplore).asObservable().mapObject(ExploreEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })

    }
    func getLeaguesNation(popular: Int, country_id: Int, completionHandler: @escaping LeaguesNationGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getLeagues(popular,country_id)).asObservable().mapObject(ExploreNationalEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
}
