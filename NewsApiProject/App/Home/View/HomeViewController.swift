//
//  ViewController.swift
//  NewsApiProject
//
//  Created by Gustavo Yamauchi on 11/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tbView = UITableView(frame: .zero, style: .plain)
        tbView.translatesAutoresizingMaskIntoConstraints = false
        tbView.isScrollEnabled = true
        tbView.dataSource = self
        tbView.delegate = self
        tbView.register(HeadlineCell.self, forCellReuseIdentifier: HeadlineCell.identifier)
        return tbView
    }()
    
    let headLineVM = HeadlineViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        headLineVM.getHeadlines { [self] result in
            DispatchQueue.main.async { [self] in
                tableView.reloadData()                
            }
            
        }
        setupTableView()
    }
    
    private func setupTableView() {
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }


}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headLineVM.headlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeadlineCell.identifier, for: indexPath) as! HeadlineCell
        cell.label.text = headLineVM.headlines[indexPath.row].title
        
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    
}
