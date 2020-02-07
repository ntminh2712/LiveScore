//
//  HomeController.swift
//  LiveScore
//
//  Created by MinhNT on 8/27/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var iconScores: UIImageView!
    @IBOutlet weak var lbScores: UILabel!
    
    
    @IBOutlet weak var iconFavorites: UIImageView!
    @IBOutlet weak var lbFavorites: UILabel!
    
    @IBOutlet weak var iconExplore: UIImageView!
    @IBOutlet weak var lbExplore: UILabel!
    
    @IBOutlet weak var iconNews: UIImageView!
    @IBOutlet weak var lbNews: UILabel!
    
    @IBOutlet weak var iconSettings: UIImageView!
    @IBOutlet weak var lbSettings: UILabel!
    
    @IBOutlet weak var vcScores: UIView!
    @IBOutlet weak var vcFavorites: UIView!
    @IBOutlet weak var vcExplore: UIView!
    @IBOutlet weak var vcSettings: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showView(view: ViewMenu.viewScores)
    }
    
    func showView(view:String){
        resetMenu()
        resetView()
        switch view {
        case ViewMenu.viewScores:
            vcScores.isHidden = false
            lbTitle.text = view
            iconScores.image = UIImage(named: "icon_scores_active")
            lbScores.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
        case ViewMenu.viewFavorites:
            vcFavorites.isHidden = false
            lbTitle.text = view
            iconFavorites.image = UIImage(named: "icon_favorites_active")
            lbFavorites.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
        case ViewMenu.viewExplore:
            vcExplore.isHidden = false
            lbTitle.text = view
            iconExplore.image = UIImage(named: "icon_explore_active")
            lbExplore.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
        case ViewMenu.viewNews:
            lbTitle.text = view
            iconNews.image = UIImage(named: "icon_news_active")
            lbNews.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
        case ViewMenu.viewSettings:
            vcSettings.isHidden = false
            lbTitle.text = view
            iconSettings.image = UIImage(named: "icon_settings_active")
            lbSettings.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
        default:
            break
        }
    }
    
    func resetMenu(){
        iconScores.image = UIImage(named: "icon_scores_inactive")
        lbScores.textColor = .white
        iconFavorites.image = UIImage(named: "icon_favorites_inactive")
        lbFavorites.textColor = .white
        iconExplore.image = UIImage(named: "icon_explore_inactive")
        lbExplore.textColor = .white
        iconNews.image = UIImage(named: "icon_news_inactive")
        lbNews.textColor = .white
        iconSettings.image = UIImage(named: "icon_settings_inactive")
        lbSettings.textColor = .white
    }
    
    func resetView(){
        vcScores.isHidden = true
        vcFavorites.isHidden = true
        vcExplore.isHidden = true
        vcSettings.isHidden = true
    }
    
    
    
    @IBAction func showViewScores(_ sender: Any) {
        showView(view: ViewMenu.viewScores)
    }
    @IBAction func showViewFavorites(_ sender: Any) {
        NotificationCenter.default.post(name: notificationName.getFavoritesMatches.notification, object: nil)
        NotificationCenter.default.post(name: notificationName.getFavoritesLeagues.notification, object: nil)
        NotificationCenter.default.post(name: notificationName.getFavoritesTeams.notification, object: nil)
        showView(view: ViewMenu.viewFavorites)
    }
    @IBAction func showViewExplore(_ sender: Any) {
        showView(view: ViewMenu.viewExplore)
    }
    @IBAction func showViewNews(_ sender: Any) {
        showView(view: ViewMenu.viewNews)
    }
    @IBAction func showViewSettings(_ sender: Any) {
        showView(view: ViewMenu.viewSettings)
    }
    

    
}
