//
//  HomeView.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/07/21.
//

import SwiftUI

struct HomeView: View, UIViewRepresentable {
	@ObservedObject var viewModel = HomeViewModel()
	
	func makeUIView(context: Context) -> MTMapView {
		let view = MTMapView(frame: .zero)
		view.currentLocationTrackingMode = .onWithoutHeading
		view.showCurrentLocationMarker = true
		view.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude:  viewModel.location.coordinate.latitude, longitude: viewModel.location.coordinate.longitude)), zoomLevel: 5, animated: true)
		
		return view
	}
	
	func updateUIView(_ uiView: MTMapView, context: Context) {}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
