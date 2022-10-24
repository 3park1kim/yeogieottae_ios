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
	private let placeRepository: PlaceRepository
	
	@Published var location: CLLocation
	@Published var tagList: [Tag] = []
	
	// 검색어
	@Published public var searchValue: String = ""


	init(placeRepository: PlaceRepository = appContainer.resolve(PlaceRepository.self)!) {
		self.placeRepository = placeRepository
		location = locationService.location ?? CLLocation(latitude: 37.57936166391697, longitude: 126.88987429968581)
		
		self.loadData()
	}
	
	private func loadData() {
		Task.detached(priority: .background) {
			let tagList = await self.getTagList()
			DispatchQueue.main.async {
				self.tagList = tagList
			}
		}
	}
	
	private func getTagList() async -> [Tag] {
		do {
			return try await placeRepository.getTagList()
		} catch {
			// TODO: 에러 발생
			return []
		}
	}
}
