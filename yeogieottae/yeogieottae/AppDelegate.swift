//
//  AppDelegate.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/10.
//

import Foundation
import UIKit
import KakaoSDKCommon
import KakaoSDKAuth

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_: UIApplication,
					 didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
		initailize()
		return true
	}
	
	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		print("!! \(url): \(AuthApi.isKakaoTalkLoginUrl(url))")
		if (AuthApi.isKakaoTalkLoginUrl(url)) {
			return AuthController.handleOpenUrl(url: url)
		}
		return false
	}
	
	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		let sceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
		sceneConfiguration.delegateClass = SceneDelegate.self
		return sceneConfiguration
	}
}

extension AppDelegate {
	private func initailize() {
		containerSetting()
		let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_APP_KEY"] ?? ""
		KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
	}
}
