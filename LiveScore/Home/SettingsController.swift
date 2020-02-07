//
//  SettingsController.swift
//  LiveScore
//
//  Created by MinhNT on 8/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    @IBOutlet weak var viewNotification: UIView!
    @IBOutlet weak var viewBoundGeneral: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    func setupView(){
        viewNotification.setViewRadius()
        viewBoundGeneral.setViewRadius()
        
    }
    
    @IBAction func showSendFeedBack(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "feedbackController") as? FeedbackController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}
