//
//  TeamDetailViewController.swift
//  LiveScore
//
//  Created by MinhNT on 9/3/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class TeamDetailController: BaseViewController, TeamDetailView {
    
    @IBOutlet weak var imgBackGround: UIImageView!
    @IBOutlet weak var imgFavorites: UIImageView!
    @IBOutlet weak var imgTeam: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var viewBackGround: UIView!
    @IBOutlet weak var vcSeason: UIView!
    @IBOutlet weak var vcTeams: UIView!
    @IBOutlet weak var viewActiveSeason: UIView!
    @IBOutlet weak var viewActiveTeams: UIView!
    @IBOutlet weak var lbSeason: UILabel!
    @IBOutlet weak var lbTeams: UILabel!
    var teamId:Int?
    var presenter: TeamDetailPresenter!
    var config: TeamDetailConfigurable = TeamDetailConfigurator()
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(viewController: self)
        presenter.viewDidLoad(teamId: teamId ?? 0)
        setupView()
        
    }
    func setupView(){
        imgBackGround.image = UIImage(named: "icon_mu")?.imageBlackAndWhite()
        showView(view: ViewLeagues.viewSeason)
        viewActiveTeams.layer.cornerRadius = 2
        viewActiveTeams.layer.borderColor = UIColor.clear.cgColor
        viewActiveSeason.layer.cornerRadius = 2
        viewActiveSeason.layer.borderColor = UIColor.clear.cgColor
        
    }
    
    func resetDefault(){
        lbSeason.textColor = #colorLiteral(red: 0.5146641135, green: 0.4720629454, blue: 0.4756274819, alpha: 1)
        lbTeams.textColor = #colorLiteral(red: 0.5146641135, green: 0.4720629454, blue: 0.4756274819, alpha: 1)
        vcTeams.isHidden = true
        vcSeason.isHidden = true
        viewActiveSeason.isHidden = true
        viewActiveTeams.isHidden = true
    }
    func showView(view:String){
        resetDefault()
        switch view {
        case ViewLeagues.viewSeason:
            viewActiveSeason.isHidden = false
            lbSeason.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            vcSeason.isHidden = false
        case ViewLeagues.ViewTeams:
            viewActiveTeams.isHidden = false
            lbTeams.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            vcTeams.isHidden = false
            break
        default:
            break
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func showSeason(_ sender: Any) {
        showView(view: ViewLeagues.viewSeason)
    }
    @IBAction func showTeams(_ sender: Any) {
        showView(view: ViewLeagues.ViewTeams)
    }
    
    func setDataTeamDetail(data:TeamDetailEntity) {
        imgBackGround.setImageBackAndWhiteByUrl(data.logo_path)
        imgTeam.setCustomImage(data.logo_path, defaultAvatar: nil)
        lbName.text = data.name
        if data.favorite {
            imgFavorites.image = #imageLiteral(resourceName: "icon_start_active")
        }else {
            imgFavorites.image = #imageLiteral(resourceName: "icon_favorites_inactive")
        }
    }
    @IBAction func handlerFavorites(_ sender: Any) {
        self.presenter.handlerFavorites(teamId: teamId!)
    }
    
    func handleError(title: String, content: String) {
        
    }
    
}
