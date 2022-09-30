//
//  HomeViewModel.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/07/21.
//

import Combine
import Foundation
import CoreLocation

final class HomeViewModel: ObservableObject {
	private var locationService = LocationService()
	@Published var location: CLLocation
	
	// 검색어
	@Published public var searchValue: String = ""


	init() {
		location = locationService.location ?? CLLocation(latitude: 37.57936166391697, longitude: 126.88987429968581)
	}
}
