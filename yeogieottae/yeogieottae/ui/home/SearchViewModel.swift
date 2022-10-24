//
//  SearchViewModel.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/10/18.
//

import Foundation

final class SearchViewModel: ObservableObject {
	private let placeRepository: PlaceRepository

	// 검색어
	@Published public var searchValue: String = ""
	// 검색 결과
	@Published var searchResult: [String] = []

	init(placeRepository: PlaceRepository = appContainer.resolve(PlaceRepository.self)!) {
		self.placeRepository = placeRepository
		self.searchResult = []
	}
}
