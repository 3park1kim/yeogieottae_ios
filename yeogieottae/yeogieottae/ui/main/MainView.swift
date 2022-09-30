//
//  MainView.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/05.
//

import SwiftUI

struct MainView: View {
	@State private var selection = 0
	
	var body: some View {
		TabView(selection: $selection) {
			HomeView()
				.tabItem {
					TabItemView(data: TabType.home.tabItem, isSelected: selection == 0)
				}.tag(0)
			GroupListView()
				.tabItem {
					TabItemView(data: TabType.group.tabItem, isSelected: selection == 1)
				}.tag(1)
			SettingView()
				.tabItem {
					TabItemView(data: TabType.setting.tabItem, isSelected: selection == 2)
				}.tag(2)
		}
		.accentColor(.accent)
		.onAppear() {
			UITabBar.appearance().backgroundColor = UIColor(Color.base)
		}
	}
	
}

struct TabItemData {
	let image: String
	let selectedImage: String
	let title: String?
	
	init(image: String, selectedImage: String, title: String? = nil) {
		self.image = image
		self.selectedImage = selectedImage
		self.title = nil
	}
}

struct TabItemView: View {
	let data: TabItemData
	let isSelected: Bool
	
	var body: some View {
		VStack {
			Image(isSelected ? data.selectedImage : data.image)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 32, height: 32)
			
			if data.title != nil {
				Spacer().frame(height: 4)
				
				Text(data.title!)
					.foregroundColor(isSelected ? .black : .gray)
					.font(.system(size: 14))
			}
		}
	}
}

enum TabType: Int, CaseIterable {
	case home
	case group
	case setting
	
	var tabItem: TabItemData {
		switch self {
		case .home:
			return TabItemData(image: "ic_home", selectedImage: "ic_home_selected")
		case .group:
			return TabItemData(image: "ic_group", selectedImage: "ic_group_selected")
		case .setting:
			return TabItemData(image: "ic_setting", selectedImage: "ic_setting_selected", title: "Setting")
		}
	}
}
