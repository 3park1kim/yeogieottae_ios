//
//  GroupListView.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/05.
//

import SwiftUI

struct GroupListView: View {
	let viewModel = GroupListViewModel()
	
	var body: some View {
		return VStack {
			drawHeader()
			drawBody()
			drawFooter()
		}
	}
}


extension GroupListView {
	private func drawHeader() -> some View {
		return Text("Group")
	}
	private func drawBody() -> some View {
		return List {
			ForEach(viewModel.groupList, id: \.groupName) { group in
				Text(group.groupName)
				
			}
		}
	}
	private func drawFooter() -> some View {
		return EmptyView()
	}
}
