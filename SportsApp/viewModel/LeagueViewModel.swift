//
//  LeagueViewModel.swift
//  SportsApp
//
//  Created by Rain Moustfa on 30/04/2022.
//

import Foundation
class LeagueViewModel{
    var coreDataService:CoreDataService!
    let appDelegate:AppDelegate
    var bindLeagueViewModelToView : (()->Void) = {}
    
    var favLeaguesData:LeaguesResult! {
        didSet{
            self.bindLeagueViewModelToView()
        }
    }
    
    init(appDelegate:AppDelegate){
        self.coreDataService = CoreDataService()
        self.appDelegate = appDelegate
        self.getFavLeagues()
    }
    func getFavLeagues(){
        coreDataService.readLeagueFromCoreData(appDelegate: appDelegate) { (data) in
            self.favLeaguesData = data
        }
    }
    func saveFavLeagues(items:[Leagus]){
        for item in items{
            coreDataService.saveToRoom(appDelegate: appDelegate, item: item)
        }
    }
}
