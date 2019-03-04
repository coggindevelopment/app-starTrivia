//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Nicholas Coggin on 2/27/19.
//  Copyright © 2019 Nicholas Coggin. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufacturerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!
    let api = VehicleApi()
    var vehicles = [String]()
    var currectVehicle = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrls
        nextBtn.isEnabled = vehicles.count > 1
        previousBtn.isEnabled = false
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
        
    }
    
    func getVehicle(url: String) {
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setupView(vehicle: vehicle)
            }
        }
    }
    
    func setupView(vehicle: Vehicle) {
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        manufacturerLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        lengthLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        passengersLbl.text = vehicle.passengers
    }

    @IBAction func previousClicked(_ sender: Any) {
        currectVehicle -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currectVehicle += 1
        setButtonState()
    }
    
    func setButtonState() {
        
        nextBtn.isEnabled = currectVehicle == vehicles.count - 1 ? false : true
        previousBtn.isEnabled = currectVehicle == 0 ? false : true
        
//        if currectVehicle == 0 {
//            previousBtn.isEnabled = false
//        } else {
//            previousBtn.isEnabled = true
//        }
//
//        if currectVehicle == vehicles.count - 1 {
//            nextBtn.isEnabled = false
//        } else {
//            nextBtn.isEnabled = true
//        }
        
        getVehicle(url: vehicles[currectVehicle])
        
    }
}
