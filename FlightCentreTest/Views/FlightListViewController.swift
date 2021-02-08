//
//  FlightListViewController.swift
//  FlightCentreTest
//
//  Created by Eloy Bruckhoff on 5/2/21.
//

import UIKit

class FlightListViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var flightService: FlightService?
    
    var result: FlightList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.flightService = FlightService()
        self.updateData()
        
    }
    
    override func viewDidLayoutSubviews() {
        self.title = "Trips"
    }
    
    func updateData(){
        self.result = nil;
        
        self.flightService?.getFlights{ (success, result, errorMessage) in
            if success{
                print("Yes baby")
                self.result = result;
                self.table.reloadData()
            }
        }
    }
    
}

extension FlightListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.result?.flights.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightResultCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let c = cell as? FlightResultCell else {
            return
        }
        
        c.result = self.result?.flights[indexPath.row]
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
}
