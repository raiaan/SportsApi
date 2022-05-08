//
//  LeaguesDetailsViewModel.swift
//  SportsApp
//
//  Created by Rain Moustfa on 03/05/2022.
//

import Foundation
class LeaguesDetailViewModel {
    var allSportsService: AllSportsService!
    var leagues:Leagus
    var allTeamsData : TeamsResult! {
        didSet {
            self.bindLeaguesTeamsToView()
        }
    }
    var showTeamsError : String! {
        didSet{
            self.bindLeaguesTeamsErrorToView()
        }
    }
    var bindLeaguesTeamsToView : (()->()) = {}
    var bindLeaguesTeamsErrorToView : (()->()) = {}
    
    var allUpcomingData : LeaguesLatestEvent! {
        didSet {
            self.bindLeaguesUpcomingToView()
        }
    }
    var showUpcomingError : String! {
        didSet{
            self.bindLeaguesUpcomingErrorToView()
        }
    }
    var bindLeaguesUpcomingToView : (()->()) = {}
    var bindLeaguesUpcomingErrorToView : (()->()) = {}
    
    var allLatestData : LeaguesLatestResult! {
        didSet {
            self.bindLeaguesLatestToView()
        }
    }
    var showLatestError : String! {
        didSet{
            self.bindLeaguesLatestErrorToView()
        }
    }
    var bindLeaguesLatestToView : (()->()) = {}
    var bindLeaguesLatestErrorToView : (()->()) = {}
    
    init(leagues:Leagus) {
        self.leagues = leagues
        self.allSportsService = AllSportsService()
        self.fetchLeaguesTeamsFromAPI()
        self.fetchLeaguesLatestResultFromAPI()
        self.fetchLeaguesUpcomingEventsFromAPI()
    }
    //working correctly
    func fetchLeaguesTeamsFromAPI (){
        allSportsService.fatchDataItemsFromAPI(url: Constants.getLeaguesTeams(leagues: leagues.strLeague), typeItem: TeamsResult.self) { (allSportsData, error) in
            if let error = error {
                let message = error.localizedDescription
                self.showTeamsError = message
            } else {
                self.allTeamsData = allSportsData
            }
        }
    }
    //the link not working properly
    func fetchLeaguesUpcomingEventsFromAPI (){
        allSportsService.fatchDataItemsFromAPI(url: Constants.getLeaguesUpcomingEvent(leaguesID: Int(leagues.idLeague)!) , typeItem: LeaguesLatestEvent.self) { (allSportsData, error) in
            if let error = error {
                let message = error.localizedDescription
                self.showUpcomingError = message
            } else {
                self.allUpcomingData = allSportsData
                
            }
        }
    }
    func fetchLeaguesLatestResultFromAPI (){
        allSportsService.fatchDataItemsFromAPI(url: Constants.getLeaguesLatestResultEvent(leaguesID: Int(leagues.idLeague)!) , typeItem: LeaguesLatestResult.self) { (allSportsData, error) in
            if let error = error {
                let message = error.localizedDescription
                self.showUpcomingError = message
                print(message)
            } else {
                self.allLatestData = allSportsData
                print(allSportsData)
            }
        }
    }
}
