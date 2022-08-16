//
//  LoginViewModel.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/05.
//

import Combine
import Foundation

final class LoginViewModel: ObservableObject {
	private let kakaoAuthService: KakaoAuthService
	
	init(kakaoAuthService: KakaoAuthService? = nil) {
		self.kakaoAuthService = kakaoAuthService ?? appContainer.resolve(KakaoAuthService.self)!
	}
	
	deinit {
		Log.debug("\(self) deinitialize")
	}
	
	/// 카카오 로그인
	func kakaoLogin() {
		self.kakaoAuthService.handleKakaoLogin()
	}
}
