//
//  ViewController.swift
//  SampleTableViewInside
//
//  Created by Katana on 8/31/19.
//  Copyright © 2019 Katana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var books: [Book] = []
    var books1: [Book] = []
    var books2: [Book] = []
    var categories: [Category] = []

    @IBAction func initData(_ sender: Any) {
        initData()
        
//        tableView.beginUpdates()
        tableView.reloadData()
//        tableView.endUpdates()
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let categoryNib = UINib(nibName: "CategoryViewCell", bundle: nil)
        tableView.register(categoryNib, forCellReuseIdentifier: "CategoryViewCell")
        tableView.delegate = self
        tableView.dataSource = self

      
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }

    private func initData() {
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books.append(Book(name: "Book1 nhe"))
        books1.append(Book(name: "Book2 nhe"))
        books1.append(Book(name: "Book1 nhe"))
        books1.append(Book(name: "Book2 nhe"))
        books1.append(Book(name: "Book1 nhe"))
        books1.append(Book(name: "Book2 nhe"))
        books1.append(Book(name: "Book1 nhe"))
        books1.append(Book(name: "Book2 nhe"))
        books1.append(Book(name: "Book1 nhe"))
        books1.append(Book(name: "Book2 nhe"))
        books1.append(Book(name: "Book1 nhe"))
        
        books1.append(Book(name: "Book2 nhe"))
        books1.append(Book(name: "Book1 nhe"))
        books1.append(Book(name: "Book2 nhe"))
        books1.append(Book(name: "Book1 nhe"))
        books1.append(Book(name: "Book2 nhe"))
        books1.append(Book(name: "Book1 nhe"))
        books1.append(Book(name: "Book2 nhe"))
        books1.append(Book(name: "Book1 nhe"))
        books1.append(Book(name: "Book2 nhe"))
        books1.append(Book(name: "Book1 nhe"))
        books1.append(Book(name: "Book2 nhe"))
        books1.append(Book(name: "Book1 nhe"))
        books1.append(Book(name: "Book2 nhe"))
        books1.append(Book(name: "Book1 nhe"))
        
        books2.append(Book(name: "Book1 nhe"))
        books2.append(Book(name: "Book1 nhe"))
        books2.append(Book(name: "Book1 nhe"))
        books2.append(Book(name: "Book1 nhe"))

        categories.append(Category(name: "Category 1", books: books))
        categories.append(Category(name: "Category 2", books: books1))
        categories.append(Category(name: "Category 3", books: books2))
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "CategoryViewCell", for: indexPath) as! CategoryViewCell
        categoryCell.category = categories[indexPath.row]
//        DispatchQueue.main.async {
//            categoryCell.tableView.scrollToRow(at: IndexPath(row: 4 - 1, section: 1), at: .bottom, animated: false)
//        }
//        DispatchQueue.main.async {
//            categoryCell.tableView.invalidateIntrinsicContentSize()
//            categoryCell.tableView.layoutIfNeeded()
//            self.updateHeight()
//        }
        return categoryCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }


}

