//
//  MapView.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/09/28.
//

import SwiftUI
import CoreLocation

struct MapView: View, UIViewRepresentable {
	var location: CLLocation
	
	init(location: CLLocation) {
		self.location = location
	}
	
	func makeUIView(context: Context) -> MTMapView {
		let view = MTMapView(frame: .zero)
		view.currentLocationTrackingMode = .onWithoutHeading
		view.showCurrentLocationMarker = true
		view.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude:  location.coordinate.latitude, longitude: location.coordinate.longitude)), zoomLevel: 5, animated: true)
		
		return view
	}
	
	func updateUIView(_ uiView: MTMapView, context: Context) {}
}
