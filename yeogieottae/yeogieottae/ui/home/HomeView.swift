//
//  HomeView.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/07/21.
//

import SwiftUI

struct HomeView: View {
	@ObservedObject var viewModel = HomeViewModel()
	
	var body: some View {
		Text("Home")
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
