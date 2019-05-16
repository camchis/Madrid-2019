//
//  ArtworkViews.swift
//  Madrid 2019
//
//  Created by Cameron on 15/05/2019.
//  Copyright © 2019 Cameron. All rights reserved.
//

import Foundation
import MapKit

class ArtworkMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            // 1
            guard let artwork = newValue as? Artwork else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
                                                    size: CGSize(width: 30, height: 30)))
            mapsButton.setBackgroundImage(UIImage(named: "Maps-icon"), for: UIControl.State())
            rightCalloutAccessoryView = mapsButton
            // 2
            markerTintColor = artwork.markerTintColor
            
            if let imageName = artwork.imageName {
                glyphImage = UIImage(named: imageName)
                glyphTintColor = .white
            } else {
                glyphImage = nil
            }
            
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(12)
            detailLabel.text = artwork.subtitle
            detailCalloutAccessoryView = detailLabel
            displayPriority = MKFeatureDisplayPriority.required
        }
    }
    

    
}
