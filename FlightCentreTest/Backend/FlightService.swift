//
//  FlightService.swift
//  FlightCentreTest
//
//  Created by Eloy Bruckhoff on 5/2/21.
//

/*
    Flight Service will connect to our API and receive a list of flights from our backend at the baseApuUrl + API Endpoint
    
    getFlights: Calls the API endpoint and gets the json file, this will then be parsed as an Array to FlightList and once processed and FlightSearchResult Models have been populated this will be returned in the completion bock to the caller.
    
 */

import Foundation
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON

class FlightService {
    var baseApiUrl:String{
        get {
            return "https://firebasestorage.googleapis.com/v0/b/flight-centre-brand.appspot.com/"
        }
    }
  
    
    func getFlights(_ completion: @escaping (_ success: Bool, _ result: FlightList?, _ errorMessage: String) -> Void) {
       
        print("\(self.baseApiUrl)")
        Alamofire.request(("\(self.baseApiUrl)o/developer-test-flights-list.json?alt=media&token=81d93056-9c7f-451d-94b6-3e88eb6fa9ad"), method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseSwiftyJSON { dataResponse in
            switch dataResponse.result {
            case .success:
                completion(true, FlightList(dataResponse.result.value!.arrayValue), "")

            case .failure(let error):
                print("no success here: \(error)")
            }
            
        }
    }
    
}

class FlightList {
    var flights: [FlightSearchResult]
    
    init(_ json: [JSON]){
        print("opening results: \(json)")
        self.flights = []
        
        for r in json {
            self.flights.append(FlightSearchResult(r))
        }
    }
}

class FlightSearchResult {
    var id: Int
    var departureDate: String
    var airlineCode: String
    var flightNumber: String
    var departure_city: String
    var departure_airport: String
    var arrival_city: String
    var arrival_airport: String
    var scheduled_duration: String
    var arrival_date: String
    var headerText: String
    var departureAirportCity: String
    var arrivalAirportCity: String
    
    init(_ json: JSON) {

        self.id = json["id"].intValue
        self.departureDate = json["departure_date"].stringValue
        self.airlineCode = json["airline_code"].stringValue
        self.flightNumber = json["flight_number"].stringValue
        self.departure_city = json["departure_city"].stringValue
        self.departure_airport = json["departure_airport"].stringValue
        self.arrival_city = json["arrival_city"].stringValue
        self.arrival_airport = json["arrival_airport"].stringValue
        self.scheduled_duration = json["scheduled_duration"].stringValue
        self.arrival_date = json["arrival_date"].stringValue
        
        // Potential issue if formatting changes on the backend. This is a quick workaround to get the task done and format it correctly
        let headerComponents = json["arrival_city"].stringValue.components(separatedBy: ", ")
        self.headerText = "Flight to \(headerComponents[0])"
        
        let departureComponents = json["departure_city"].stringValue.components(separatedBy: ", ")
        self.departureAirportCity = departureComponents[0]
        
        let arrivalComponents = json["arrival_city"].stringValue.components(separatedBy: ", ")
        self.arrivalAirportCity = arrivalComponents[0]
        
        
        
    }
    
    
}
