//
//  KakaoAuthService.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/10.
//

import Foundation
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthService {
	/// 카카오 로그인
	func handleKakaoLogin() {
		// 카카오톡 설치 여부 확인
		if (UserApi.isKakaoTalkLoginAvailable()) {
			// 설치가 되어 있다면
			// 카카오 앱을 통해 로그인
			UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
				if let error = error {
					print(error)
				}
				else {
					print("loginWithKakaoTalk() success.")

					//do something
					_ = oauthToken
				}
			}
		} else {
			// 설치가 되어 있지 않다면
			// 카카오 웹뷰로 로그인
			UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
				if let error = error {
					print(error)
				}
				else {
					print("loginWithKakaoAccount() success.")

					//do something
					_ = oauthToken
					self.getUserInfo()
				}
			}
		}
	}
	
	/// 카카오 사용자 정보 가져오기
	private func getUserInfo() {
		UserApi.shared.me() {(user, error) in
			if let error = error {
				print(error)
			}
			else {
				print("me() success.")
				
				//do something
				_ = user
			}
		}
	}
}


