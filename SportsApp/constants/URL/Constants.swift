//
//  Constants.swift
//  SportsApp
//
//  Created by Ali on 30/04/2022.
//

import Foundation

struct Constants {
    static let baseURL = "https://www.thesportsdb.com/api/v1/json/2/"
    static let getAllSportsURL = "\(baseURL)all_sports.php"
    static let getAllLeagues = "\(baseURL)search_all_leagues.php?c=England"
    static func getLeaguesTeams(leagues:String) -> String {
        return "\(baseURL)search_all_teams.php?l=\(leagues.replacingOccurrences(of: " ", with: "%20"))"
    }
    static func getLeaguesUpcomingEvent(leaguesID:Int) -> String {
        return "\(baseURL)search_all_teams.php?id=\(leaguesID)"
    }
    static func getLeaguesLatestResultEvent(leaguesID:Int) -> String {
        return "\(baseURL)eventsseason.php?id=\(leaguesID)"
    }
    static func getLeaguesBySportName(sportName:String)->String{
        return "\(baseURL)search_all_leagues.php?s=\(sportName)"
    }
    //static let getLeaguesTeams = "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"
}
