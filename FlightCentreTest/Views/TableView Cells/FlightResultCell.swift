//
//  FlightResultCell.swift
//  FlightCentreTest
//
//  Created by Eloy Bruckhoff on 5/2/21.
//

/*
 FlightResultCell is setup as a self populating cell. Once the FlightSearchResult gets set, all the elements will be populated with the corresponding values from the model.
 */

import UIKit

class FlightResultCell: UITableViewCell {
    
    // The header of this flight
    @IBOutlet weak var header: UILabel!
    
    // Departure information
    @IBOutlet weak var depAirportCode: UILabel!
    @IBOutlet weak var depTime: UILabel!
    @IBOutlet weak var depAirportName: UILabel!
    
    // Travel Information
    @IBOutlet weak var travelTime: UILabel!
    @IBOutlet weak var travelStops: UILabel!
    
    // Arrival information
    @IBOutlet weak var arrAirportCode: UILabel!
    @IBOutlet weak var arrTime: UILabel!
    @IBOutlet weak var arrAirportName: UILabel!
    
    var result: FlightSearchResult?{
        didSet {
            guard let res = self.result else{
                return
            }
            self.header.text = res.headerText
            
            self.depAirportCode.text = res.departure_airport
            self.depTime.text = res.departureDate
            self.depAirportName.text = res.departureAirportCity
            
            
            // TODO: travel time needs to be formated in the model
            self.travelTime.text = res.scheduled_duration
            // TODO: stops information needs to be delivered from the backend
            self.travelStops.text = "non stop"
            
            self.arrAirportCode.text = res.arrival_airport
            self.arrTime.text = res.arrival_date;
            self.arrAirportName.text = res.arrivalAirportCity
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
