//
//  RemoteDataSource.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/10.
//

import Foundation

import Foundation

protocol RemoteDataSource {
	func getTagList() async throws -> [Tag]
}

class RemoteDataSourceImpl: RemoteDataSource {
	func getTagList() -> [Tag] {
		return []
	}
}

class MockRemoteDataSourceImpl: RemoteDataSource {
	func getTagList() async throws -> [Tag] {
		do {
			let data = try JSONSerialization.data(
				withJSONObject: JSONFiles.Tag.items,
				options: [])
			let mockDrinks = try JSONDecoder().decode([Tag].self, from: data)
			return mockDrinks
		} catch {
			print(error.localizedDescription)
			return []
		}
	}
}

