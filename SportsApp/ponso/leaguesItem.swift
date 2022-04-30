//
//  leaguesItem.swift
//  SportsApp
//
//  Created by Rain Moustfa on 30/04/2022.
//

import Foundation
struct LeaguesResult:Decodable {
    var leagues:[Leagus]
}
struct Leagus:Decodable{
    let idLeague:Int
    let strLeague:String
    let strSport:String
    let strLeagueAlternate:String
}
