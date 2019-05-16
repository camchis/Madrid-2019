//
//  Artwork.swift
//  Madrid 2019
//
//  Created by Cameron on 15/05/2019.
//  Copyright © 2019 Cameron. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    

    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    var category: String? {
        return discipline
    }
    
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
    var markerTintColor: UIColor  {
        switch discipline {
        case "Stadium":
            return .black
        case "UEFA Fan Zone":
            return .lightGray
        case "Liverpool Fan Zone":
            return UIColor(red:0.78, green:0.06, blue:0.18, alpha:1.0)
        case "Tottenham Fan Zone":
            return UIColor(red:0.07, green:0.13, blue:0.34, alpha:1.0)
        case "Irish Bar":
            return UIColor(red:0.07, green:0.61, blue:0.03, alpha:1.0)
        case "Police":
            return UIColor(red:0.21, green:0.27, blue:0.61, alpha:1.0)
        default:
            return .white
        }
    }
    var imageName: String? {
        if discipline == "Stadium" { return "stadium" }
        if discipline == "UEFA Fan Zone" { return "uefa" }
        if discipline == "Liverpool Fan Zone" { return "liverpool" }
        if discipline == "Tottenham Fan Zone" { return "tottenham" }
        if discipline == "Irish Bar" { return "beer" }
        if discipline == "Police" { return "police" }
        return "stadium"
    }
    

}
