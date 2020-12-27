//
//  ViewController.swift
//  MvvmCoreData
//
//  Created by Shyam Kumar on 9/20/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    @IBOutlet weak var nameTxtF: UITextField!
    
    @IBOutlet weak var ageTxtF: UITextField!
    
    @IBOutlet weak var tblV: UITableView!
    
    let dB = DatabaseHelper()
    
    var users = [User]()
    
    var userrrss = [Users]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    
  }
    
    override func viewWillAppear(_ animated: Bool) {
       
        users = dB.fetch(User.self)
        print(users.map{$0.name})
        
        UsersService.getData {
            self.userrrss = self.dB.fetch(Users.self)
            print("fvnfj", self.userrrss)
            self.tblV.reloadData()
        }
   
    }
    
    @IBAction func saveAct(_ sender: UIButton) {
    
        guard let user = dB.add(User.self) else {return}
        
        if let name = nameTxtF.text {
            user.name = name
        }
        
        if let age = ageTxtF.text {
            user.age = Int16(age) ?? 0
        }
       
        user.createdAt = Date()
        
        users.append(user)
        
        dB.save()
        
        print("saved user", user)
        
        self.tblV.reloadData()
            
        }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userrrss.count
        
        // return users.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //cell.textLabel?.text = users[indexPath.row].name
        cell.textLabel?.text = userrrss[indexPath.row].first_name
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let user = userrrss[indexPath.row]
        self.dB.delete(object: user)
        userrrss.remove(at: indexPath.row)
        tblV.deleteRows(at: [indexPath], with: .automatic)
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // let users = dB.fetch(User.self)
        
        nameTxtF.text = userrrss[indexPath.row].first_name
            //users[indexPath.row].name
        ageTxtF.text = String(userrrss[indexPath.row].id)
            //String(users[indexPath.row].age)
        
//        if users.count != 0 {
//            users[indexPath.row].setValue(nameTxtF.text, forKey: "name")
//        }
        
    }



}
