//
//  FeedbackController.swift
//  LiveScore
//
//  Created by MinhNT on 8/29/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class FeedbackController: UIViewController {

    @IBOutlet weak var viewSend: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView(){
        viewSend.layer.cornerRadius = 10
        viewSend.layer.borderWidth = 2
        viewSend.layer.borderColor = #colorLiteral(red: 0.883066535, green: 0.3352279961, blue: 0, alpha: 1)
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
