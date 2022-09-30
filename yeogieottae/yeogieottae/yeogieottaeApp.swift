//
//  yeogieottaeApp.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/16.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct yeogieottaeApp: App {
	@UIApplicationDelegateAdaptor var appDelegate: AppDelegate
	
	var body: some Scene {
		WindowGroup {
			MainView()
		}
	}
}
