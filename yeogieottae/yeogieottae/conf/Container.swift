//
//  Container.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/10.
//

import Foundation
import Swinject

let appContainer = Container()

/// 주입 세팅
func containerSetting() {
	// MARK: - Data Source
//	appContainer.register(RemoteDataSource.self) { _ in
//		RemoteDataSourceImpl()
//	}.inObjectScope(.container)
	appContainer.register(RemoteDataSource.self) { _ in
		MockRemoteDataSourceImpl()
	}.inObjectScope(.container)
	appContainer.register(LocalDataSource.self) { _ in
		LocalDataSourceImpl()
	}.inObjectScope(.container)
	// MARK: - Repository
	appContainer.register(GroupRepository.self) { resolver in
		GroupRepositoryImpl(remoteDataSource: resolver.resolve(RemoteDataSource.self)!,
						localDataSource: resolver.resolve(LocalDataSource.self)!)
	}.inObjectScope(.container)
	appContainer.register(PlaceRepository.self) { resolver in
		PlaceRepositoryImpl(remoteDataSource: resolver.resolve(RemoteDataSource.self)!,
						localDataSource: resolver.resolve(LocalDataSource.self)!)
	}.inObjectScope(.container)
	appContainer.register(UserRepository.self) { resolver in
		UserRepositoryImpl(remoteDataSource: resolver.resolve(RemoteDataSource.self)!,
						localDataSource: resolver.resolve(LocalDataSource.self)!)
	}.inObjectScope(.container)
	// MARK: - Service
	appContainer.register(KakaoAuthService.self) { resolver in
		KakaoAuthService()
	}.inObjectScope(.container)
}
