//
//  TimelineTableViewController.swift
//  TimelineTableViewCell
//
//  Created by Zheng-Xiang Ke on 2016/10/20.
//  Copyright © 2016年 Zheng-Xiang Ke. All rights reserved.
//

import UIKit
import TimelineTableViewCell

class TimelineTableViewController: UITableViewController {
    
    // TimelinePoint, Timeline back color, title, description, lineInfo, thumbnails, illustration
    let data:[Int: [(String?, String?, String?, String?)]] = [0:[
        (nil, nil, "Info 1", nil),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon")
    ], 1:[
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon"),
        ("Title 2", "Description 2", "12:21", "icon")
    ]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell", bundle: Bundle(for: TimelineTableViewCell.self))
        self.tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let sectionData = data[section] else {
            return 0
        }
        return sectionData.count
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Day " + String(describing: section + 1)
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
        // Configure the cell...
        guard let sectionData = data[indexPath.section] else {
            return cell
        }
        
        let (title, description, lineInfo, illustration) = sectionData[indexPath.row]

        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        cell.timeDateLabel.text = lineInfo
        cell.illustrationImageView.image = UIImage(named: illustration ?? "")
        
        return cell
    }
}
