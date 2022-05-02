//
//  FavoriteViewController.swift
//  SportsApp
//
//  Created by Ali on 30/04/2022.
//

import UIKit
import SDWebImage
import Alamofire
class FavoriteViewController: UIViewController , UITableViewDelegate ,UITableViewDataSource {

    @IBOutlet weak var leaguesTable: UITableView!
    let viewModel = LeagueViewModel(appDelegate: (UIApplication.shared.delegate as? AppDelegate)!)
    var leagues = [Leagus]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leagues = viewModel.favLeaguesData.countrys
        leaguesTable.delegate = self
        leaguesTable.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesTableViewCell
        cell.leagueTitle.text = leagues[indexPath.row].strLeague
        cell.leagueSport.text = leagues[indexPath.row].strSport
        cell.leagueBadge.sd_setImage(with: URL(string: leagues[indexPath.row].strBadge) )
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if currentReachabilityStatus == .notReachable {
            showDialoug()
        } else {
           print("reachable")
        }
        print("selected")
    }
    func showDialoug(){
        //make the alert
        let alert = UIAlertController (title: "No Connection!", message: "sorry there's no Internet Connection to Display Leagues details", preferredStyle: UIAlertController.Style.alert )
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
