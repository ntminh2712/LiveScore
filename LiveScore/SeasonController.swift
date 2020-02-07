//
//  SeasonController.swift
//  LiveScore
//
//  Created by MinhNT on 8/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class LeaguesSeasonController: UIViewController {

    @IBOutlet weak var viewFixtures: UIView!
    @IBOutlet weak var viewTable: UIView!
    @IBOutlet weak var viewTopPlayer: UIView!
    @IBOutlet weak var lbFixtures: UILabel!
    @IBOutlet weak var lbTable: UILabel!
    @IBOutlet weak var lbTopPlayer: UILabel!
    @IBOutlet weak var vcFixtures: UIView!
    @IBOutlet weak var vcTable: UIView!
    @IBOutlet weak var vcTopPlayer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        showView(view:ViewLeagues.viewFixtures)
    }
    func setupView() {
        viewFixtures.setViewRadius()
        viewFixtures.layer.borderColor = #colorLiteral(red: 0.1384610534, green: 0.1385996342, blue: 0.1384825408, alpha: 1)
        viewTable.setViewRadius()
        viewTable.layer.borderColor = #colorLiteral(red: 0.1384610534, green: 0.1385996342, blue: 0.1384825408, alpha: 1)
        viewTopPlayer.setViewRadius()
        viewTopPlayer.layer.borderColor = #colorLiteral(red: 0.1384610534, green: 0.1385996342, blue: 0.1384825408, alpha: 1)
    }
    
    func resetDefault(){
        viewFixtures.backgroundColor = .black
        viewTable.backgroundColor = .black
        viewTopPlayer.backgroundColor = .black
        lbFixtures.textColor = #colorLiteral(red: 0.4034992158, green: 0.4038276076, blue: 0.4035500586, alpha: 1)
        lbTable.textColor = #colorLiteral(red: 0.4034992158, green: 0.4038276076, blue: 0.4035500586, alpha: 1)
        lbTopPlayer.textColor = #colorLiteral(red: 0.4034992158, green: 0.4038276076, blue: 0.4035500586, alpha: 1)
        vcFixtures.isHidden = true
        vcTable.isHidden = true
        vcTopPlayer.isHidden = true
    }
    
    
    func showView(view:String){
        resetDefault()
        switch view {
        case ViewLeagues.viewFixtures:
            vcFixtures.isHidden = false
            viewFixtures.backgroundColor = #colorLiteral(red: 0.1082720235, green: 0.1083889827, blue: 0.1082901582, alpha: 1)
            lbFixtures.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            break
        case ViewLeagues.viewTable:
            viewTable.backgroundColor = #colorLiteral(red: 0.1082720235, green: 0.1083889827, blue: 0.1082901582, alpha: 1)
            lbTable.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            break
        case ViewLeagues.viewTopPlayer:
            viewTopPlayer.backgroundColor = #colorLiteral(red: 0.1082720235, green: 0.1083889827, blue: 0.1082901582, alpha: 1)
            lbTopPlayer.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            break
        default:
            break
        }
    }
    
    @IBAction func showFixtures(_ sender: Any) {
        showView(view: ViewLeagues.viewFixtures)
    }
    @IBAction func showTable(_ sender: Any) {
        showView(view: ViewLeagues.viewTable)
    }
    @IBAction func showTopPlayer(_ sender: Any) {
        showView(view: ViewLeagues.viewTopPlayer)
    }
    
}
