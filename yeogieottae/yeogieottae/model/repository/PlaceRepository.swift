//
//  PlaceRepository.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/10/14.
//

import Foundation

protocol PlaceRepository {
	func getTagList() async throws -> [Tag]
}


final class PlaceRepositoryImpl: PlaceRepository {
	private let remoteDataSource: RemoteDataSource
	private let localDataSource: LocalDataSource
	
	init(remoteDataSource: RemoteDataSource,
		 localDataSource: LocalDataSource) {
		self.remoteDataSource = remoteDataSource
		self.localDataSource = localDataSource
	}
	
	func getTagList() async throws -> [Tag] {
		return try await remoteDataSource.getTagList()
	}
}
