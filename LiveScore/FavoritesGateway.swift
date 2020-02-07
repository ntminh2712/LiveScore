//
//  FavoritesGateway.swift
//  LiveScore
//
//  Created by MinhNT on 9/30/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation

typealias FavoritesGatewayCompletionHandler = (_ explore: Result<FavoritesEntity>) -> Void
typealias AddFavoritesGatewayCompletionHandler = (_ item: Result<FavoritesEntity>) -> Void
protocol FavoritesGateway {
    func handlerFavorites(id:Int, type: Int,completionHandler: @escaping FavoritesGatewayCompletionHandler)
    func getLeaguesFavorites(completionHandler: @escaping FavoritesGatewayCompletionHandler)
    func getMatchesFavorites(completionHandler: @escaping FavoritesGatewayCompletionHandler)
    func getTeamsFavorites(completionHandler: @escaping FavoritesGatewayCompletionHandler)
}
