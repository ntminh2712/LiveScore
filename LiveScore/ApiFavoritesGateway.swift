//
//  ApiFavoritesGateway.swift
//  LiveScore
//
//  Created by MinhNT on 9/30/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
protocol ApiFavoritesGateway: FavoritesGateway {
    
}

class ApiFavoritesGatewayImplementation: ApiFavoritesGateway
{
    func handlerFavorites(id: Int, type: Int, completionHandler: @escaping FavoritesGatewayCompletionHandler) {
        apiProvider.request(TSAPI.handlerFavorites(id, type)).asObservable().mapObject(FavoritesEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func getLeaguesFavorites(completionHandler: @escaping FavoritesGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getLeaguesFavorites).asObservable().mapObject(FavoritesEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func getMatchesFavorites(completionHandler: @escaping FavoritesGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getMatchesFavorites).asObservable().mapObject(FavoritesEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    func getTeamsFavorites(completionHandler: @escaping FavoritesGatewayCompletionHandler) {
        apiProvider.request(TSAPI.getTeamsFavorites).asObservable().mapObject(FavoritesEntity.self).subscribe(onNext:{(result) in
            completionHandler(.success(result))
        }, onError:{(error) in
            completionHandler(.failure(error))
        })
    }
    
    
   
}
