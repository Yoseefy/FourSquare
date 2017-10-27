//
//  myTVTableViewController.swift
//  RK
//
//  Created by Yosef on 10/25/17.
//  Copyright © 2017 Yosef. All rights reserved.
//

import UIKit

class myTVTableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    
    let characterSet = CharacterSet(charactersIn: "()<>null")
    var a: NSArray? = nil
    var b: NSArray? = nil
    var c: NSArray? = nil
    var d: NSArray? = nil
    var e: NSArray? = nil
    var transfer: String?
    @IBOutlet weak var tvv: UITableView!
    @IBAction func searchButt(_ sender: UIButton)
    {
        area = searchText.text
    }
    @IBOutlet weak var searchText: UITextField!
    
    var area: String?
    {
        didSet
        {
            
            var S = "https://api.foursquare.com/v2/venues/search?client_id=5JOFWYALNRZAZ0G4DT1KUFDYG4544UZ1H13ENCT5M21BTBRX&client_secret=RH5500UQ1RSC3LA4OOPASEX3NYCU4G5ENLUC0MTGO5YH2XQC&v=20171020&near="
            var t = S + area!
            var url = URL(string:t)!
            
            let urlSession = URLSession.shared
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                
               if let jsonData = try? JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary{
                
                
                    self.a = jsonData.value(forKeyPath: "response.venues.categories.icon.prefix") as? NSArray
                    self.b = jsonData.value(forKeyPath: "response.venues.categories.name") as? NSArray
                    self.c = jsonData.value(forKeyPath: "response.venues.categories.icon.suffix") as? NSArray
                    self.d = jsonData.value(forKeyPath: "response.geocode.where") as? NSArray
                    self.e = jsonData.value(forKeyPath: "response.geocode.feature.slug") as? NSArray
        
                    // Parsed data from json
                }
                
                
            }
                task.resume()
                tvv.reloadData()
        }

            }

    
 func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
}

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PL", for: indexPath) as! celltvTableViewCell
        
            self.transfer = ((self.b?[indexPath.row] as AnyObject).description).trimmingCharacters(in: self.characterSet)
                +
                ((self.a?[indexPath.row] as AnyObject).description).trimmingCharacters(in: self.characterSet)
                +
                ((self.c?[indexPath.row] as AnyObject).description).trimmingCharacters(in: self.characterSet)
                +
                ((self.d?[indexPath.row] as AnyObject).description).trimmingCharacters(in: self.characterSet)
                +
                ((self.e?[indexPath.row] as AnyObject).description).trimmingCharacters(in: self.characterSet)

        
        
            cell.Final.text = self.transfer
        
        
        return cell
    }



    
    
}
