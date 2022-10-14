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
					.disabled(true)
					.padding(10)
					.background(Color(.systemGray6))
					.cornerRadius(12)
					.onTapGesture {
						// open Search Page
					}
				Button(action: {}) {
					Image("ic_notification")
				}
				Button(action: {}) {
					Image("ic_invite")
				}
			}
			.padding(EdgeInsets(top: 10, leading: 19, bottom: 15, trailing: 19))
			TagView(tags: $viewModel.tagList)
			MapView(location: viewModel.location)
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}



struct TagView: View {
	@Binding var tags : [Tag]
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				ForEach(0..<tags.count, id:\.self) { index in
					item(for: tags[index].title, isSelected: false)
						.padding([.horizontal, .vertical], 4)
				}
			}
		}
	}

	private func item(for text: String, isSelected: Bool) -> some View {
		Text(text)
			.foregroundColor(Color(.systemCyan))
			.padding()
			.lineLimit(1)
			.background(Color.base)
			.frame(height: 36)
			.cornerRadius(18)
			.overlay(Capsule().stroke(Color.accent, lineWidth: 1))
	}
}

//struct TagViewItem: Hashable {
//
//	var title: String
//	var isSelected: Bool
//
//	static func == (lhs: TagViewItem, rhs: TagViewItem) -> Bool {
//		return lhs.isSelected == rhs.isSelected
//	}
//
//	func hash(into hasher: inout Hasher) {
//		hasher.combine(title)
//		hasher.combine(isSelected)
//	}
//}
