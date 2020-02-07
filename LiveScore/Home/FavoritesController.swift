//
//  FavoritesController.swift
//  LiveScore
//
//  Created by MinhNT on 8/28/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class FavoritesController: UIViewController {
    
    @IBOutlet weak var lbMatches: UILabel!
    @IBOutlet weak var lbLeagues: UILabel!
    @IBOutlet weak var lbTeams: UILabel!
    @IBOutlet weak var imgArrow: UIImageView!
    @IBOutlet weak var vcMatches: UIView!
    @IBOutlet weak var vcLeagues: UIView!
    @IBOutlet weak var vcTeams: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        moveArrow(index: 2)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showMatches(_ sender: Any) {
        moveArrow(index: 2)
        
    }
    @IBAction func showLeaues(_ sender: Any) {
        moveArrow(index: 6)
    }
    
    @IBAction func showTeams(_ sender: Any) {
        moveArrow(index: 10)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: notificationName.getFavoritesMatches.notification, object: nil)
        NotificationCenter.default.post(name: notificationName.getFavoritesLeagues.notification, object: nil)
        NotificationCenter.default.post(name: notificationName.getFavoritesTeams.notification, object: nil)
    }
    
    func setTodayActive(index:Int){
        resetDefault()
        resetView()
        switch index {
        case 2:
            vcMatches.isHidden = false
            lbMatches.font = .boldSystemFont(ofSize: 15)
            lbMatches.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
        case 6:
            vcLeagues.isHidden = false
            lbLeagues.font = .boldSystemFont(ofSize: 15)
            lbLeagues.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
        case 10:
            vcTeams.isHidden = false
            lbTeams.font = .boldSystemFont(ofSize: 15)
            lbTeams.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
            
        default:
            break
        }
    }
    
    func resetView(){
        vcMatches.isHidden = true
        vcLeagues.isHidden = true
        vcTeams.isHidden = true
    }
    func moveArrow(index:Int){
        setTodayActive(index: index)
        let x = self.view.bounds.size.width
        let y = self.view.frame.origin.y + 1
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.imgArrow.center = CGPoint(x: (x / 12) * CGFloat(index), y: y)
        })
        
    }
    func resetDefault(){
        lbMatches.setLabelDefault()
        lbLeagues.setLabelDefault()
        lbTeams.setLabelDefault()
        
    }
    
}
