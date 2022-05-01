//
//  LeaguesViewController.swift
//  SportsApp
//
//  Created by Rain Moustfa on 30/04/2022.
//

import Foundation
import UIKit
import Alamofire
import SDWebImage

class LeaguesViewController: UITableViewController{
    let viewModel = LeagueViewModel(appDelegate: (UIApplication.shared.delegate as? AppDelegate)!)
    var leagues = [Leagus]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leagues = viewModel.favLeaguesData.countrys
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesTableViewCell
        cell.leagueSTR.text = leagues[indexPath.row].strLeague
        cell.leaguesSport.text = leagues[indexPath.row].strSport
        cell.leaguesIMG.sd_setImage(with: URL(string: leagues[indexPath.row].strBadge) )
        return cell
    }
}
