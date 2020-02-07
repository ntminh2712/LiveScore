//
//  MatchInfoController.swift
//  LiveScore
//
//  Created by MinhNT on 9/4/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import UIKit


class MatchInfoController: BaseViewController {
    
    @IBOutlet weak var tbInfo: UITableView!
    
    var listEvents: [MatchesEventsEntity] = []
    var referee:MatchesRefereeEntity?
    override func viewDidLoad() {
        setupTableview()
    }
    func setupTableview(){
        tbInfo.delegate = self
        tbInfo.dataSource = self
        tbInfo.register(UINib(nibName: "MatchInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "matchInfoTableViewCell")
        tbInfo.register(UINib(nibName: "GoalEventTableViewCell", bundle: nil), forCellReuseIdentifier: "goalEventTableViewCell")
        tbInfo.register(UINib(nibName: "EndEventsTableViewCell", bundle: nil), forCellReuseIdentifier: "endEventsTableViewCell")
        NotificationCenter.default.addObserver(self, selector: #selector(setData(_:)), name: notificationName.getDataMatches.notification, object: nil)
    }
    func handleError(title: String, content: String) {
        
    }
    @objc func setData(_ notification:NSNotification) {
        if let matches = notification.userInfo?["matches"] as? MatchesDetailEntity {
            listEvents = matches.events
            referee = matches.referee
        }
        tbInfo.reloadData()
        
    }
}
extension MatchInfoController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listEvents.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (listEvents.count == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "matchInfoTableViewCell") as! MatchInfoTableViewCell
            if referee != nil {
            cell.setData(data: referee!)
            }
            return cell
        }
        if indexPath.row == (listEvents.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "matchInfoTableViewCell") as! MatchInfoTableViewCell
            return cell
        }else {
            if listEvents[indexPath.row].type == "HT" || listEvents[indexPath.row].type == "FT"{
                let cell = tableView.dequeueReusableCell(withIdentifier: "endEventsTableViewCell") as! EndEventsTableViewCell
                cell.viewBound.roundCorners(corners: .allCorners, radius: 0)
                if indexPath.row == 0 {
                    cell.setViewRadiusTop()
                }else if indexPath.row == listEvents.count - 1{
                    cell.setViewRadiusBottom()
                }
                cell.setData(data: listEvents[indexPath.row])
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "goalEventTableViewCell") as! GoalEventTableViewCell
                cell.viewBound.roundCorners(corners: .allCorners, radius: 0)
                if indexPath.row == 0 {
                    cell.setViewRadiusTop()
                }else if indexPath.row == listEvents.count - 1{
                    cell.setViewRadiusBottom()
                }
                cell.setData(data: listEvents[indexPath.row])
                return cell
            }
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
