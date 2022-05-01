//
//  leaguesItem.swift
//  SportsApp
//
//  Created by Rain Moustfa on 30/04/2022.
//

import Foundation
struct LeaguesResult:Decodable {
    var countrys:[Leagus]
}
struct Leagus:Decodable{
    let idLeague:String
    let strLeague:String
    let strSport:String
    let strLeagueAlternate:String
    let strBadge:String
}
