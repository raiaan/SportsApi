//
//  TeamsViewController.swift
//  SportsApp
//
//  Created by Rain Moustfa on 09/05/2022.
//

import UIKit
import SDWebImage

class TeamsViewController: UIViewController {
    var team:Team?
    @IBOutlet weak var teamLogoIMG: UIImageView!
    
    @IBOutlet weak var strStadiumThumbIMG: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let team = team {
            teamLogoIMG.sd_setImage(with: URL(string: team.strTeamBadge))
            strStadiumThumbIMG.sd_setImage(with: URL(string: team.strStadiumThumb ?? ""))
        }
    }
    func setTeam(team:Team){
        self.team  = team
    }
    
}
