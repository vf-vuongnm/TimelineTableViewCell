//
//  TimelineTableViewController.swift
//  TimelineTableViewCell
//
//  Created by Vuognnm on 2021/12/1.
//  Copyright © 2016年 Zheng-Xiang Ke. All rights reserved.
//

import UIKit
import TimelineTableViewCell

class TimelineTableViewController: UITableViewController {
    let data:[Int: [(String?, String?, String?, String?)]] = [0:[
        (nil, nil, "Info 1", nil),
        ("Person 1 Person 1", "Description 1", "12:21", "Sun"),
        ("Person 2", "Description 2", "12:21", "Moon"),
        ("Person 3", "Description 3", "12:21", "Sun"),
        ("Person 4Person 4Person 4Person 4", "Description 4", "12:21", "Moon"),
        ("Person 5", "Description 5", "12:21", "Sun"),
        ("Person 6", "Description 6", "12:21", "Moon"),
        ("Person 7", "Description 7", "12:21", "Sun"),
        ("Person 8", "Description 8", "12:21", "Moon")
    ], 1:[
        (nil, nil, "Info 2", nil),
        ("Person 1", "Description 1", "12:21", "Sun"),
        ("Person 2", "Description 2", "12:21", "Moon"),
        ("Person 3", "Description 3", "12:21", "Sun"),
        ("Person 4", "Description 4", "12:21", "Moon"),
        ("Person 5", "Description 5", "12:21", "Sun"),
        ("Person 6", "Description 6", "12:21", "Moon"),
        ("Person 7", "Description 7", "12:21", "Sun"),
        ("Person 8", "Description 8", "12:21", "Moon")
    ]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell", bundle: Bundle(for: TimelineTableViewCell.self))
        self.tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionData = data[section] else {
            return 0
        }
        return sectionData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
        guard let sectionData = data[indexPath.section] else {
            return cell
        }
        
        let (title, description, lineInfo, illustration) = sectionData[indexPath.row]

        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        cell.timeDateLabel.text = lineInfo
        cell.illustrationImageView.image = UIImage(named: illustration ?? "")
        cell.descriptionOfTitleLabel.text = illustration == nil ? "" : " did do something"
        
        if let description = description {
            let attachment = NSTextAttachment()
            attachment.image = UIImage(named: "Moon.png")
            let attachmentString = NSAttributedString(attachment: attachment)
            let myString = NSMutableAttributedString(string: description)
            myString.insert(attachmentString, at: 0)
            cell.descriptionLabel.attributedText = myString
        } else {
            cell.descriptionLabel.text = ""
        }
        
        let hasImage = cell.illustrationImageView.image != nil
        cell.timeDateLabel.font = cell.timeDateLabel.font.withSize(hasImage ? 12 : 16)
        cell.timeDateLabel.textColor = hasImage ? UIColor.systemGray : UIColor.darkText
        return cell
    }
}
