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
    var league:Leagus?
    var shouldUpdateView:Bool?{
        didSet{
            leaguesDetail = LeaguesDetailViewModel(leagues: league!)
        }
    }
    private let table :UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(EventsResultCell.self, forCellReuseIdentifier: EventsResultCell.identifier)
        table.register(LatestEventCellTable.self, forCellReuseIdentifier: LatestEventCellTable.identifier)
        return table
    }()
    var models:[CellModel] = [.list(models: [EventResult]()),.collectionViewItem(models: [Team](), rows: 1)]
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModelCallingBack()
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    func initViewModelCallingBack(){
        leaguesDetail?.bindLeaguesUpcomingToView = {
            print(self.leaguesDetail?.allUpcomingData.events.count)
        }
        leaguesDetail?.bindLeaguesTeamsToView = {
            self.models[1]=(.collectionViewItem(models: (self.leaguesDetail?.allTeamsData.teams)!, rows: 1)
            )
            self.table.reloadData()
        }
        leaguesDetail?.bindLeaguesLatestToView = {
            self.models[0] = (.list(models: (self.leaguesDetail?.allLatestData.events)!))
            self.table.reloadData()
        }
    }
}
