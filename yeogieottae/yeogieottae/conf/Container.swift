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
	appContainer.register(RemoteDataSource.self) { resolver in
		RemoteDataSource()
	}.inObjectScope(.container)
	appContainer.register(LocalDataSource.self) { _ in
		LocalDataSource()
	}.inObjectScope(.container)
	// MARK: - Repository
	appContainer.register(GroupRepository.self) { resolver in
		GroupRepository(remoteDataSource: resolver.resolve(RemoteDataSource.self)!,
						localDataSource: resolver.resolve(LocalDataSource.self)!)
	}.inObjectScope(.container)
	appContainer.register(UserRepository.self) { resolver in
		UserRepository(remoteDataSource: resolver.resolve(RemoteDataSource.self)!,
						localDataSource: resolver.resolve(LocalDataSource.self)!)
	}.inObjectScope(.container)
	// MARK: - Service
	appContainer.register(KakaoAuthService.self) { resolver in
		KakaoAuthService()
	}.inObjectScope(.container)
}
