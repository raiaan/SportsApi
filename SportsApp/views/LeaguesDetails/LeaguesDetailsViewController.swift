//
//  LeaguesDetailsViewController.swift
//  SportsApp
//
//  Created by Rain Moustfa on 03/05/2022.
//

import Foundation
import UIKit
import SDWebImage
import Alamofire

class LeaguesDetailsViewController: UIViewController {
    var leaguesDetail:LeaguesDetailViewModel?
    var league:Leagus? {
        didSet(newValue){
            print(newValue)
      //      print(oldValue)
//            leaguesDetail = LeaguesDetailViewModel(leagues: oldValue!)
//            leaguesDetail!.bindLeaguesUpcomingToView = {
//                print("Leagues Upcoming Event count is \(self.leaguesDetail!.allUpcomingData.events.count)")
//            }
        }
    }
    override func viewDidLoad() {
        
    }
}
