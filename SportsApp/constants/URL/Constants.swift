//
//  Constants.swift
//  SportsApp
//
//  Created by Ali on 30/04/2022.
//

import Foundation

struct Constants {
    static let getAllSportsURL = "https://www.thesportsdb.com/api/v1/json/2/all_sports.php"
    static let getAllLeagues = "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?c=England"
    static func getLeaguesTeams(leagues:String) -> String {
        return "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=\(leagues)"
    }
    static func getLeaguesUpcomingEvent(leaguesID:Int) -> String {
        return "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?id=\(leaguesID)"
    }
    static func getLeaguesLatestResultEvent(leaguesID:Int) -> String {
        return "https://www.thesportsdb.com/api/v1/json/2/eventslast.php?id=\(leaguesID)"
    }
    //static let getLeaguesTeams = "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"
}
