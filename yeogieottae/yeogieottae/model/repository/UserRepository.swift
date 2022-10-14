//
//  UserRepository.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/10.
//

import Foundation

protocol UserRepository {
	
}

final class UserRepositoryImpl: UserRepository {
	private let remoteDataSource: RemoteDataSource
	private let localDataSource: LocalDataSource
	
	init(remoteDataSource: RemoteDataSource,
		 localDataSource: LocalDataSource) {
		self.remoteDataSource = remoteDataSource
		self.localDataSource = localDataSource
	}
}
