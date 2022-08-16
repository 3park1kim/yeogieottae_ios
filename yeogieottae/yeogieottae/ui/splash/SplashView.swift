//
//  SplashView.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/03.
//

import SwiftUI

struct SplashView: View {
	@ObservedObject var viewModel = SplashViewModel()
	
	var body: some View {
		Text("Splash")
	}
}

struct SplashView_Previews: PreviewProvider {
	static var previews: some View {
		SplashView()
	}
}
