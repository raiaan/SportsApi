//
//  latestResult.swift
//  SportsApp
//
//  Created by Rain Moustfa on 03/05/2022.
//

import Foundation
struct LeaguesLatestResult:Decodable {
    var results:[Event]
}
struct EventResult:Decodable{
    let idEvent:String
    let strHomeTeam:String
    let strAwayTeam:String
    let strTime:String
    let dateEvent:String
    let intHomeScore:String
    let intAwayScore:String
}
