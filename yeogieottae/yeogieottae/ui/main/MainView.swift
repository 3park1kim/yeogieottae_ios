//
//  MainView.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/05.
//

import SwiftUI

struct MainView: View {
	var body: some View {
		TabView {
		   Text("Main")
			 .tabItem {
				Image(systemName: "house")
				Text("Main Tab")
			  }
			GroupListView()
			  .tabItem {
				 Image(systemName: "person.2.fill")
				 Text("Group Tab")
			   }
			SettingView()
			  .tabItem {
				 Image(systemName: "person.circle.fill")
				 Text("Setting Tab")
			   }
		}
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
