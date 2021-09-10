//
//  AllNewsTableViewController.swift
//  Finam News
//
//  Created by mr_aNalogman on 8/21/21.
//  Copyright © 2021 mr_aNalogman. All rights reserved.
//

import UIKit

class AllNewsTableViewController: UITableViewController {
    
    let networkService = NetworkService()
    
    //local employees array
    var employeesArr1: NewsResponse? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.FetchAllEmployees(query: query) {[weak self] (result) in
            switch result {
    
            case .success(let news):
                self?.employeesArr1 = news
                self?.tableView.reloadData()
                employeesArr = news
                self?.navigationItem.title = (self?.employeesArr1?.company.name ?? "") + " employees"
//                print(newsArr)
            case .failure(let error):
                print("Error: ", error)
                let alert = UIAlertController(title: "Error", message: "Unable to load data, check internet connection", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Exit", style: .default, handler: { (_) in
                    exit(0)
                }))
                self?.present(alert, animated: true, completion: nil)
            }
        }
        
        
    }

    
    
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeesArr1?.company.employees.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsItemCell", for: indexPath)
        
        let labelText = "Name: " + (employeesArr1?.company.employees[indexPath.row].name ?? "Unnamed") + ", phone: "
        cell.textLabel?.text = labelText + (employeesArr1?.company.employees[indexPath.row].phone_number ?? "none")
        cell.detailTextLabel?.text = "Skills: " + GetAllSkills(skills: employeesArr1?.company.employees[indexPath.row].skills ?? [])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
