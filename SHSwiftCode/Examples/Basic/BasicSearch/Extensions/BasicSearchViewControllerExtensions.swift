//
//  BasicSearchViewControllerExtensions.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/04/24.
//  Copyright © 2020 SWein. All rights reserved.
//

import Foundation
import UIKit

extension BasicSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 是否搜寻状态,即 搜索框是否活跃
        if searchController.isActive {
            return searchArrry.count
        }
        else {
            return cities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // 是否搜寻状态,即 搜索框是否活跃
        if searchController.isActive {
            cell.textLabel?.text = searchArrry[indexPath.row]
        }
        else {
            cell.textLabel?.text = cities[indexPath.row]
        }
        
        return cell
    }
}

extension BasicSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 是否搜寻状态,即 搜索框是否活跃
        if searchController.isActive {
            print("your select is search \(searchArrry[indexPath.row])")
        }
        else {
            print("your select is cities \(cities[indexPath.row])")
        }
    }
}

extension BasicSearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchText = searchController.searchBar.text else {
            return
        }
        
        searchArrry = cities.filter { (city) -> Bool in
            return city.contains(searchText)
        }
    }
}
