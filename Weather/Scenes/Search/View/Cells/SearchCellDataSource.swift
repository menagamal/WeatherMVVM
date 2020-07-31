//
//  SearchCellDataSource.swift
//  Weather
//
//  Created by Mena Gamal on 7/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

class SearchCellDataSource:  NSObject, UITableViewDataSource,UITableViewDelegate {
    
    weak var delegate: SearchCellDataSourceDelegate!
    
    var tableView: UITableView!
    var countries = [CountryModel]()
    init(delegate:SearchCellDataSourceDelegate,tableView:UITableView,countries:[CountryModel]) {
        super.init()
        self.countries = countries
        self.delegate = delegate
        self.tableView = tableView
        self.tableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.reloadData()
        
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        cell.selectionStyle = .none
        cell.setDetails(country: countries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelected(country: countries[indexPath.row])
    }
}

protocol SearchCellDataSourceDelegate: class {
    func didSelected(country:CountryModel)
}

