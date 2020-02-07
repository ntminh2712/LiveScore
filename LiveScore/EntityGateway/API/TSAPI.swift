//
//  TSAPI.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//


import Foundation

enum TSAPI
{
    case i18nRegions(String?, String?)
    case getListMatchWithdate(String?)
    case getListExplore
    case getLeagues(Int?,Int?)
    case handlerFavorites(Int?,Int?)
    case getLeaguesFavorites
    case getTeamsFavorites
    case getMatchesFavorites
    case getListMatches(String?,String?,Int?,Int?,Int?,String?)
    case getMatchesDetail(Int?)
    case getListStanding(Int?,Int?,Int?)
    case getLeaguesDetail(Int?)
    case getLeaguesFixture(Int?,Int?)
    case getListTeams(Int?)
    case getTopPlayerLeagues(Int?)
    case getTopPlayerTeam(Int?,Int?)
    case getTeamDetail(Int?,Int?)
    case getTeamFixture(Int?,Int?)
    case getTeamStanding(Int?)
    case getTeamLineUp(Int?)
}
 
