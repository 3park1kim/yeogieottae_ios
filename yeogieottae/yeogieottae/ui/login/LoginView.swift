//
//  LoginView.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/05.
//

import SwiftUI

struct LoginView: View {
	@ObservedObject var viewModel = LoginViewModel()
	
	var body: some View {
		Text("Login")
		Button(action: {
			viewModel.kakaoLogin()
		}, label: {
			Text("Login")
		})
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
