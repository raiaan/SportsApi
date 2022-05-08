//
//  LeaguesSportTableViewController.swift
//  SportsApp
//
//  Created by Rain Moustfa on 08/05/2022.
//

import UIKit

class LeaguesSportTableViewController: UITableViewController {
    var leagusViewModels:LeaguesSportViewModel?
    var models = [Leagus]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(LeaguesTableViewCell.self , forCellReuseIdentifier:"cell")
        readLeagues()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesTableViewCell
        cell.leagueTitle.text = models[indexPath.row].strLeague
        cell.leagueSport.text = models[indexPath.row].strSport
        cell.leagueBadge.sd_setImage(with: URL(string: models[indexPath.row].strBadge) )
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func setSport(sport:MySport){
        leagusViewModels  = LeaguesSportViewModel(sport: sport)
    }
    func readLeagues(){
        guard let leagusViewModels = leagusViewModels else {
            return
        }
        leagusViewModels.bindLeaguesToView = {
            self.models = leagusViewModels.league ?? [Leagus]()
            self.tableView.reloadData()
        }
    }
}
