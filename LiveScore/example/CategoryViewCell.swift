//
//  CategoryViewCell.swift
//  SampleTableViewInside
//
//  Created by Katana on 8/31/19.
//  Copyright © 2019 Katana. All rights reserved.
//

import UIKit

class CategoryViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var category: Category? = nil {
        didSet {
            tableView.reloadData()
        }
    }
    var dataExplore: ExploreResultEntity? = nil{
        didSet {
            self.tableView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpTableView()
    }

    private func setUpTableView() {
        tableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "leaguesTableViewCell")
        

        tableView.delegate = self
        tableView.dataSource = self

        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.books.count ?? 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesTableViewCell") as! LeaguesTableViewCell
        cell.layoutIfNeeded()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
