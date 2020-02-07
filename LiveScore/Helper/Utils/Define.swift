//
//  Define.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

struct SegueIdentifier {
    //Explore
    static let goPlayLitsController = "goPlayLitsController"
}

struct ControllerIdentifier {
    //Login
    static let navigationLogin = "navigationLogin"
    
}
struct DateFormat {
    static let yyyyssDash = "yyyy-MM-dd'T'HH:mm:ss"
    static let ddmmSlash = "dd/MM/yyyy HH:mm"
    static let ddMMyyyy = "dd/MM/yyyy"
    static let MMyyyy = "MM/yyyy"
    static let yyyyMMdd = "yyyy/MM/dd"
    static let yyyymsDash = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    static let yyyymsZDash = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    static let HHmm = "HH:mm"
    static let slashddmmyy = "HH:mm dd/MM/yyyy"
    static let yyyymdHmsZ = "yyyy-MM-dd HH:mm:ss ZZZ"
    static let yyyyMdHms = "yyyy/MM/dd HH:mm:ss"
    static let ddMMMMyyyy = "dd MMMM','yyyy"
    static let yyyyMMddHHmmss = "yyyyMMddHHmmss"
}

enum notificationName: String {
    //Login
    case ScoresToday = "ScoresToday"
    case getListTeam = "getListTeam"
    
    case getTopPlayerLeagues = "getTopPlayerLeagues"
    case getTopPlayerTeams = "getTopPlayerTeams"
    
    case getTeamFixtures = "getTeamFixtures"
    case getTeamLineup = "getTeamLineup"
    
    case getMatchesHighlight = "getMatchesHighlight"
    case getMatchesLineups = "getMatchesLineups"
    case getDataMatches = "getDataMatches"
    
    case getTeamStanding = "getTeamStanding"
    case getLeaguesFixtures = "getLeaguesFixtures"
    case getLeaguesStanding = "getLeaguesStanding"
    
    case getFavoritesMatches = "getFavoritesMatches"
    case getFavoritesLeagues = "getFavoritesLeagues"
    case getFavoritesTeams = "getFavoritesTeams"
//    case getListTeam = "getListTeam"
    
    var notification: NSNotification.Name{
        return Notification.Name(rawValue: self.rawValue)
    }
}

enum ExploreType: String {
    case popupar = "Popular"
    case national = "National"
    case world = "World"
}

enum CategoryEnum: String {
    case Leagues = "Leagues"
    case Teams = "Teams"
}

enum FavoritesType: Int {
    case Leagues = 1
    case Team = 2
    case Matches = 3
}
enum TopPlayerType: String {
    case goals = "goalscorer"
    case yellowCards = "Yellow Cards"
    case redCards = "Red Cards"
    case assists = "topAssists"
}

struct ViewMenu {
    public static var viewScores:String = "Scores"
    public static var viewFavorites:String = "Favorites"
    public static var viewExplore:String = "Explore"
    public static var viewNews:String = "News"
    public static var viewSettings:String = "Settings"
}

struct ViewLeagues {
    public static var viewFixtures:String = "Fixtures"
    public static var viewTable:String = "Table"
    public static var viewTopPlayer:String = "Top Player"
    public static var viewSeason:String = "Season"
    public static var ViewTeams:String = "Teams"
    public static var ViewLineUps:String = "Line-ups"
    public static var ViewHighlight:String = "Highlight"
    public static var ViewInfo:String = "Info"
}
struct CodeResponse  {
    public static var success: Int = 200
    public static var failure: Int = 400
}

struct DataSingleton {
    public static var country_id: Int = 0
    public static var leagues_id: Int = 0
}
