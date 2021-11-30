//
//  TimelineTableViewCell.swift
//  TimelineTableViewCell
//
//  Created by Zheng-Xiang Ke on 2016/10/20.
//  Copyright © 2016年 Zheng-Xiang Ke. All rights reserved.
//

import UIKit


open class TimelineTableViewCell: UITableViewCell {
    @IBOutlet weak var imageAndInfoLabelSpaceContraint: NSLayoutConstraint!
    @IBOutlet weak var lineInfoLabelLeftContraint: NSLayoutConstraint!
    @IBOutlet weak var imageWitdthConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageTopContraint: NSLayoutConstraint!
    
    @IBOutlet weak open var titleLabel: UILabel!
    @IBOutlet weak open var descriptionLabel: UILabel!
    @IBOutlet weak open var timeDateLabel: UILabel!
    @IBOutlet weak open var illustrationImageView: UIImageView!
    
    
    open var timelinePoint = TimelinePoint(color: UIColor.systemGray, filled: true) {
        didSet {
            self.setNeedsDisplay()
        }
    }
    open var timeline = Timeline() {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override open func draw(_ rect: CGRect) {
        for layer in self.contentView.layer.sublayers! {
            if layer is CAShapeLayer {
                layer.removeFromSuperlayer()
            }
        }
        
        if let indexPath = (self.superview as? UITableView)?.indexPath(for: self) {
            timeline.frontColor = indexPath.row > 0 ? UIColor.systemGray : UIColor.clear
        }
        
        timeline.leftMargin = imageAndInfoLabelSpaceContraint.constant + lineInfoLabelLeftContraint.constant + imageWitdthConstraint.constant / 2
        timelinePoint.position = CGPoint(x: timeline.leftMargin, y: imageTopContraint.constant + imageWitdthConstraint.constant / 2)
        timeline.start = CGPoint(x: timeline.leftMargin, y: 0)
        timeline.middle = CGPoint(x: timeline.start.x, y: timelinePoint.position.y)
        timeline.end = CGPoint(x: timeline.start.x, y: self.bounds.size.height)
        timeline.draw(view: self.contentView)
        
        let hasImage = illustrationImageView.image != nil
        if !hasImage {
            timelinePoint.draw(view: self.contentView)
        }
        
        timeDateLabel.font = timeDateLabel.font.withSize(hasImage ? 12 : 18)
        timeDateLabel.textColor = hasImage ? UIColor.systemGray : UIColor.darkText
    }
}
