//
//  TSAPI.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import Foundation


import UIKit
import Moya
import RxSwift
import Alamofire

extension TSAPI:TargetType
{
    
    var baseURL: URL {
        return URL(string: Config.rootUrl)!
    }
    
    var path: String {
        switch self {
        case .getListExplore:
            return "/explore"
        case .getLeagues:
            return "/league"
        case .getTeamsFavorites:
            return "/favorite/team"
        case .getLeaguesFavorites:
            return "/favorite/league"
        case .getMatchesFavorites:
            return "/favorite/matches"
        case .handlerFavorites:
            return "/favorite/add"
        case .getListMatches:
            return "/matches"
        case .getListStanding:
            return "/standing"
        case .getMatchesDetail:
            return "/matches/detail"
        case .getLeaguesDetail:
            return "/league/detail"
        case .getLeaguesFixture:
            return "/matches/detail-league"
        case .getListTeams:
            return "/team/list"
        case .getTopPlayerLeagues:
            return "/top-player"
        case .getTopPlayerTeam:
            return "/top-player"
        case .getTeamDetail:
            return "/team/detail"
        case .getTeamFixture:
            return "/matches/detail-team"
        case .getTeamStanding:
            return "/team/standing"
        case .getTeamLineUp:
            return "/team/line-up"
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getLeagues,.getListExplore, .getTeamsFavorites, .getMatchesFavorites, .getLeaguesFavorites, .getListMatches,.getListStanding,.getMatchesDetail,.getLeaguesDetail, .getLeaguesFixture, .getListTeams, .getTopPlayerTeam, .getTopPlayerLeagues, .getTeamDetail, .getTeamFixture, .getTeamStanding,.getTeamLineUp:
            return .get
        case .handlerFavorites:
            return .post
        default:
            return .get
        }
    }
    
    
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .getLeagues,.getListExplore, .getTeamsFavorites, .getMatchesFavorites, .getLeaguesFavorites, .getListMatches,.getListStanding,.getMatchesDetail,.getLeaguesDetail, .getLeaguesFixture, .getListTeams, .getTopPlayerTeam, .getTopPlayerLeagues, .getTeamDetail, .getTeamFixture, .getTeamStanding,.getTeamLineUp:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            guard let url = Bundle.main.url(forResource: "Demo", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            return data
        }
    }
    
    public var parameters: [String : Any]? {
        switch self {
        case .getLeagues(let popular, let country_id):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["popular"] = popular
                parameter["country_id"] = country_id
                return parameter
            }
            return paramester
        case .getMatchesFavorites:
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["device_id"] = UIDevice.current.identifierForVendor!.uuidString
                return parameter
            }
            return paramester
        case .getLeaguesFavorites:
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["device_id"] = UIDevice.current.identifierForVendor!.uuidString
                return parameter
            }
            return paramester
        case .getTeamsFavorites:
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["device_id"] = UIDevice.current.identifierForVendor!.uuidString
                return parameter
            }
            return paramester
        case .getMatchesDetail(let fixture_id):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["fixture_id"] = fixture_id
                parameter["device_id"] = UIDevice.current.identifierForVendor!.uuidString
                return parameter
            }
            return paramester
        case .getListStanding(let leagues_id, let season_id, let round_id):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["league_id"] = leagues_id
                //                parameter["season_id"] = season_id
                //                parameter["round_id"] = round_id
                return parameter
            }
            return paramester
        case .getListMatches(let startDate, let endDate, let team_id, let leagues_id, let season_id, let include):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["startDate"] = startDate
                parameter["endDate"] = endDate
                //                parameter["team_id"] = team_id
                //                parameter["league_id"] = leagues_id
                //                parameter["season_id"] = season_id
                parameter["device_id"] = UIDevice.current.identifierForVendor!.uuidString
                parameter["include"] = include
                return parameter
            }
            return paramester
        case .getLeaguesDetail(let leagues_id):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["league_id"] = leagues_id
                parameter["device_id"] = UIDevice.current.identifierForVendor!.uuidString
                return parameter
            }
            return paramester
        case .getLeaguesFixture(let leagues_id, let page):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["league_id"] = leagues_id
                parameter["10"] = 10
                parameter["page"] = page
                return parameter
            }
            return paramester
        case .getListTeams(let seasonId):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["season_id"] = seasonId
                parameter["device_id"] = UIDevice.current.identifierForVendor!.uuidString
                return parameter
            }
            return paramester
        
        case .getTopPlayerTeam(let teamId, let seasonId):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["teamId"] = teamId
                parameter["season_id"] = seasonId
                return parameter
            }
            return paramester
        case .getTopPlayerLeagues(let seasonId):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["season_id"] = seasonId
                return parameter
            }
            return paramester
        case .getTeamDetail(let teamId, let seasonId):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["team_id"] = teamId
                //                parameter["season_id"] = seasonId
                parameter["device_id"] = UIDevice.current.identifierForVendor!.uuidString
                return parameter
            }
            return paramester
        case .getTeamFixture(let teamId, let page):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["team_id"] = teamId
                parameter["page"] = page
                parameter["limit"] = 10
                //                parameter["season_id"] = seasonId
                parameter["device_id"] = UIDevice.current.identifierForVendor!.uuidString
                return parameter
            }
            return paramester
        case .getTeamStanding(let teamId):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["team_id"] = teamId
                return parameter
            }
            return paramester
        case .getTeamLineUp(let teamId):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["team_id"] = teamId
                return parameter
            }
            return paramester
        case .handlerFavorites(let id, let type):
            var paramester: [String: Any]?{
                var parameter:[String:Any] = [:]
                parameter["device_id"] = UIDevice.current.identifierForVendor!.uuidString
                parameter["id"] = id
                parameter["type"] = type
                return parameter
            }
//            let nameDataProvider = MultipartFormData(provider: .data(UIDevice.current.identifierForVendor!.uuidString.data(using: .utf8)!), name: "name")
//            let emailDataProvider = MultipartFormData(provider: .data(UIDevice.current.identifierForVendor!.uuidString.data(using: .utf8)!), name: "email")
            // image want to upload it or file as a MultipartFormData
            
            return paramester
        default:
            return [:]
        }
    }
    
    var task: Moya.Task {

        return .requestParameters(parameters: self.parameters! , encoding: parameterEncoding)
//        return .uploadMultipart(<#T##[MultipartFormData]#>)
    }
    
    var headers: [String : String]? {
        let token = "h8T0DF9yqGKqEooDaoCkAaBL_WVjhm36"
        switch self {
        case  .getListExplore, .getLeagues, .getMatchesFavorites, .getLeaguesFavorites, .getTeamsFavorites, .getListMatches,.getMatchesDetail, .getListStanding, .getLeaguesDetail, .getLeaguesFixture, .getListTeams, .getTopPlayerTeam, .getTopPlayerLeagues, .getTeamDetail, .getTeamFixture, .getTeamStanding,.getTeamLineUp, .handlerFavorites:
            var header: [String:String]?{
                var header: [String:String] = [:]
                header["Authorization"] = "Bearer \(token)"
                return header
            }
            return header
        default:
            return [:]
        }
        return [:]
    }
    /// Encode parameters for multipart/form-data
    private func multipartQueryComponents(_ key: String, _ value: Any) -> [(String, String)] {
        var components: [(String, String)] = []
        
        if let dictionary = value as? [String: Any] {
            for (nestedKey, value) in dictionary {
                components += multipartQueryComponents("\(key)[\(nestedKey)]", value)
            }
        } else if let array = value as? [Any] {
            for value in array {
                components += multipartQueryComponents("\(key)[]", value)
            }
        } else {
            components.append((key, "\(value)"))
        }
        
        return components
    }

    
    
}

