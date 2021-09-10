//
//  Model.swift
//  Finam News
//
//  Created by mr_aNalogman on 8/21/21.
//  Copyright © 2021 mr_aNalogman. All rights reserved.
//

import Foundation

//MARK: structs

//
// Full JSON from Api
//
struct NewsResponse: Decodable {
    var company: CompanyStruct
    
    init(company: CompanyStruct) {
        self.company = company
    }
}


struct CompanyStruct: Decodable {
    var name: String?
    var employees: [EmployeesStruct]
    
    init(name: String, employees: [EmployeesStruct]) {
        self.name = name
        self.employees = employees
    }
}

struct EmployeesStruct: Decodable {
    var name: String?
    var phone_number: String?
    var skills: [String?]
    
    init(name: String, phone_number: String, skills: [String]) {
        self.name = name
        self.phone_number = phone_number
        self.skills = skills
    }
}


// MARK: const & vars
let query = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c")!

//Global Employees Array
var employeesArr: NewsResponse? = nil

//Implode skills array in string
func GetAllSkills(skills: [String?]) -> String {
    var skillsStr = ""
    for skill in skills {
        if (skillsStr != "") {
            skillsStr += ", "
        }
        skillsStr += skill ?? ""
    }
    
    if (skillsStr == "") {
        skillsStr = "none"
    }
    
    return skillsStr
}
