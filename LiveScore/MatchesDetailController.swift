//
//  MatchDetailController.swift
//  LiveScore
//
//  Created by MinhNT on 9/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class MatchesDetailController: BaseViewController, MatchesDetailView {
    
    @IBOutlet weak var imgLocalTeam: UIImageView!
    @IBOutlet weak var lbNameLocalTeam: UILabel!
    
    @IBOutlet weak var imgVisitTeam: UIImageView!
    @IBOutlet weak var lbNameVisitTeam: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    
    @IBOutlet weak var viewActiveInfo: UIView!
    @IBOutlet weak var viewActiveHighlight: UIView!
    @IBOutlet weak var viewActiveLineUps: UIView!
    @IBOutlet weak var viewStatus: UIView!
    @IBOutlet weak var vcInfo: UIView!
    @IBOutlet weak var vcHighlight: UIView!
    @IBOutlet weak var vcLineUps: UIView!
    @IBOutlet weak var lbInfo: UILabel!
    @IBOutlet weak var lbHighlight: UILabel!
    @IBOutlet weak var lbLineUps: UILabel!
    
    var presenter:MatchesDetailPresenter!
    var config:MatchesDetailConfiguration = MatchesDetailConfigurationImplementation()
    
    var matchesId:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(matchesDetailControler: self)
        presenter.viewDidLoad(matchesId: matchesId ?? 0)
        setupView()
        showView(view: ViewLeagues.ViewInfo)
    }
    
    func setupView(){
        viewStatus.layer.masksToBounds = false
        viewStatus.layer.cornerRadius = viewStatus.frame.height / 2
        viewStatus.layer.borderColor = #colorLiteral(red: 0.3435328603, green: 0.4938462973, blue: 0.952463448, alpha: 1)
        viewStatus.layer.borderWidth = 1.5
        viewStatus.backgroundColor = #colorLiteral(red: 0.2063092291, green: 0.2894838452, blue: 0.5495705009, alpha: 1)
        viewActiveInfo.layer.cornerRadius = 2
        viewActiveInfo.layer.borderColor = UIColor.clear.cgColor
        viewActiveHighlight.layer.cornerRadius = 2
        viewActiveHighlight.layer.borderColor = UIColor.clear.cgColor
        viewActiveLineUps.layer.cornerRadius = 2
        viewActiveLineUps.layer.borderColor = UIColor.clear.cgColor
    }
    
    func resetDefault(){
        lbInfo.textColor = #colorLiteral(red: 0.6397605538, green: 0.6402581334, blue: 0.639837563, alpha: 1)
        lbHighlight.textColor = #colorLiteral(red: 0.6397605538, green: 0.6402581334, blue: 0.639837563, alpha: 1)
        lbLineUps.textColor = #colorLiteral(red: 0.6397605538, green: 0.6402581334, blue: 0.639837563, alpha: 1)
        vcInfo.isHidden = true
        vcHighlight.isHidden = true
        vcLineUps.isHidden = true
        viewActiveInfo.isHidden = true
        viewActiveHighlight.isHidden = true
        viewActiveLineUps.isHidden = true
    }
    func showView(view:String){
        resetDefault()
        switch view {
        case ViewLeagues.ViewInfo:
            viewActiveInfo.isHidden = false
            lbInfo.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            vcInfo.isHidden = false
        case ViewLeagues.ViewHighlight:
            viewActiveHighlight.isHidden = false
            lbHighlight.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            vcHighlight.isHidden = false
            break
        case ViewLeagues.ViewLineUps:
            viewActiveLineUps.isHidden = false
            lbLineUps.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            vcLineUps.isHidden = false
            break
        default:
            break
        }
    }
    func handleError(title: String, content: String) {
        
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showViewInfo(_ sender: Any) {
        showView(view: ViewLeagues.ViewInfo)
    }
    @IBAction func showViewHighlight(_ sender: Any) {
        showView(view: ViewLeagues.ViewHighlight)
    }
    @IBAction func showViewLineUps(_ sender: Any) {
        showView(view: ViewLeagues.ViewLineUps)
    }
    func setDataMatches(data: MatchesDetailEntity) {
        imgLocalTeam.setCustomImage(data.localteam_flag, defaultAvatar: nil)
        imgVisitTeam.setCustomImage(data.visitorteam_flag, defaultAvatar: nil)
        lbNameLocalTeam.text = data.localteam_name
        lbNameVisitTeam.text = data.visitorteam_name
        if data.status == "FT" || data.status == "LIVE" {
            lbDate.text =  getDateFromTimeStamp(timeStamp: data.kick_of_date ?? 0, type: "dd/MM")
            lbTime.text = "\(String(describing: (data.localteam_score)!)) - \(String(describing: (data.visitorteam_score)!))"
            lbStatus.text = data.status
        }else {
            lbDate.text =  getDateFromTimeStamp(timeStamp: data.kick_of_date ?? 0, type: "dd/MM")
            lbTime.text = getDateFromTimeStamp(timeStamp: data.kick_of_date ?? 0, type: "hh:mm")
            lbStatus.text = data.status
        }
    }
    
}
