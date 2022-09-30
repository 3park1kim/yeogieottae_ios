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
		VStack {
			HStack(alignment: .center, spacing: 9) {
				TextField("검색어", text:$viewModel.searchValue)
					.padding(10)
					.background(Color(.systemGray6))
					.cornerRadius(12)
				Button(action: {}) {
					Image("ic_notification")
				}
				Button(action: {}) {
					Image("ic_invite")
				}
			}
			.padding(EdgeInsets(top: 10, leading: 19, bottom: 15, trailing: 19))
			MapView(location: viewModel.location)
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
