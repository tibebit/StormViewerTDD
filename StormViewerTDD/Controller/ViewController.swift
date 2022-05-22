//
//  ViewController.swift
//  StormViewerTDD
//
//  Created by Fabio Tiberio on 22/05/22.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    var pictureSelectAction: ((String)->Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let manager = FileManager.default
        
        let items = try! manager.contentsOfDirectory(atPath: Bundle.main.resourcePath!)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Storm Viewer"
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pictureSelectAction?(pictures[indexPath.row])
    }
}


