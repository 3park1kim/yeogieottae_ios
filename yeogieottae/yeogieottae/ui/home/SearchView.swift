//
//  SearchView.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/10/18.
//

import SwiftUI

struct SearchView: View {
	@ObservedObject var viewModel = SearchViewModel()
	
	var body: some View {
		Color.accent
			.edgesIgnoringSafeArea(.all)
			.overlay(GeometryReader { geometry in
				ZStack(alignment: .top) {
					VStack {
						Spacer()
						Rectangle()
							.frame(height: geometry.size.height - 40)
							.foregroundColor(.white)
							.cornerRadius(radius: 48, corners: [.topLeft])
					}
					VStack {
						TextField("검색어", text:$viewModel.searchValue)
							.padding(15)
							.background(Color(.systemGray6))
							.cornerRadius(12)
							.padding(EdgeInsets(top: 25, leading: 15, bottom: 10, trailing: 15))
							.shadow(radius: 10)
						SearchResultList(searchResult: $viewModel.searchResult)
					}
				}
			})
			.navigationTitle("Search")
			.navigationBarTitleDisplayMode(.inline)
	}
}

// MARK: - 검색어 리스트
struct SearchResultList: View {
	@Binding var searchResult : [String]
	
	var body: some View {
		if searchResult.isEmpty {
			Text("최근 검색어가 없습니다.")
				.frame(maxHeight: .infinity)
		} else {
			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .center) {
					ForEach(0..<searchResult.count, id:\.self) { index in
						VStack {
							item(for: searchResult[index], isSelected: false)
								.padding([.horizontal, .vertical], 4)
								.onTapGesture {
									// 검색어 클릭
								}
							Divider()
								.overlay(Color(hex: "#FFC7C7CC"))
								.frame(height: 0.5)
						}
					}
				}
			}
			.frame(maxWidth: .infinity)
		}
	}
	
	private func item(for text: String, isSelected: Bool) -> some View {
		Text(text)
			.frame(maxWidth: .infinity)
			.padding()
			.lineLimit(2)
	}
}

// MARK: - 특정 모서리 둥근 View
// 특정 모서리 둥근 사각형
struct CornerRadiusShape: Shape {
	var radius = CGFloat.infinity
	var corners = UIRectCorner.allCorners
	
	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}

struct CornerRadiusStyle: ViewModifier {
	var radius: CGFloat
	var corners: UIRectCorner
	
	func body(content: Content) -> some View {
		content
			.clipShape(CornerRadiusShape(radius: radius, corners: corners))
	}
}

extension View {
	func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
		ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
	}
}

struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
		SearchView()
	}
}
