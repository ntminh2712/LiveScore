//
//  MatchHighlightController.swift
//  LiveScore
//
//  Created by MinhNT on 9/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit

class MatchHighlightController: BaseViewController,MatchHighlightView {
    
    @IBOutlet weak var tbHighlight: UITableView!
    @IBOutlet weak var viewEmptyData: UIView!
    
    var presenter:MatchHighlightPresenter!
    var config:MatchHighlightConfigurable = MatchHighlightConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(viewController: self)
        presenter.viewDidLoad()
        setupTableview()
    }
    
    
    func setupTableview(){
        tbHighlight.delegate = self
        tbHighlight.dataSource = self
        tbHighlight.register(UINib(nibName: "HighLightTableViewCell", bundle: nil), forCellReuseIdentifier: "highLightTableViewCell")
    }
    
    func handleError(title: String, content: String) {
        
    }
    
    func reloadTableview(){
        tbHighlight.reloadData()
        if presenter.numberOfList == 0 {
            viewEmptyData.isHidden = false
        }else {
            viewEmptyData.isHidden = true
        }
    }
    
}
extension MatchHighlightController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "highLightTableViewCell") as! HighLightTableViewCell
        cell.setData(data: presenter.getItemOfList(row: indexPath.row))
        cell.clickHighlight = { [weak self] in
            self?.presenter.openhighlight(url: self?.presenter.getItemOfList(row: indexPath.row).location ?? "")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
