//
//  phoneScheduleTableViewCell.swift
//  fifaworldarya
//
//  Created by Arya S  Asok on 2019-07-02.
//  Copyright © 2019 Parrot. All rights reserved.
//

import Foundation
import UIKit

protocol PhoneScheduleTableViewCellDelegate: class {
    func didToggleSubscribe(_ subscribed: Bool, in cell: PhoneScheduleTableViewCell)
}

class PhoneScheduleTableViewCell: UITableViewCell {
    
    
  
    @IBOutlet weak var vsLabel: UILabel!
    
    
    @IBOutlet weak var teamALabel: UILabel!
    
    @IBOutlet weak var teamBLabel: UILabel!
    @IBOutlet weak var stadiumLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var subscribe: UIButton!
    
    @IBOutlet weak var cityLabel: UILabel!
    weak var delegate: PhoneScheduleTableViewCellDelegate?
    
    static var dateFormatter = DateFormatter()
    
    var subscribed = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(_ game: Game) {
        
        teamALabel.text = game.teamA
        teamBLabel.text = game.teamB

        
        stadiumLabel.text = game.location
        cityLabel.text = game.venue
        
        PhoneScheduleTableViewCell.dateFormatter.dateFormat = "dd MMM yyyy"
        dateLabel.text = PhoneScheduleTableViewCell.dateFormatter.string(from: game.date!)
        
        PhoneScheduleTableViewCell.dateFormatter.dateFormat = "HH:mm"
        
        timeLabel.text = PhoneScheduleTableViewCell.dateFormatter.string(from: game.date!)
        
        subscribed = game.subscibed
        configureSubscribeButton(subscribed)
    }
    
    private func configureSubscribeButton(_ subscribed: Bool) {
        if subscribed {
            subscribe.setTitle("Unsubscribe", for: .normal)
        } else {
            subscribe.setTitle("Subscribe", for: .normal)
        }
    }
    
    @IBAction func didPressSubscribe(_ sender: Any) {
        let toggledSubscribed = !subscribed
        configureSubscribeButton(toggledSubscribed)
        delegate?.didToggleSubscribe(toggledSubscribed, in: self)
        subscribed = toggledSubscribed
    }
    
    
    private func getTeamFlag(for team: String) -> String {
        
        switch team {
        case "Norway":
            return " "
        case "Netherlands":
            return " "
        case "England":
            return " "
        case "France":
            return " "
        case "USA":
            return " "
        case "Italy":
            return " "
        case "Germany":
            return " "
        case "Sweden":
            return " "
        case "TBA":
            return "\u{2700}"
        default:
            return "\u{2700}"
        }
    }
    
}
