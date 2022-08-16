//
//  GroupListViewModel.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/05.
//

import Combine
import Foundation

final class GroupListViewModel: ObservableObject {
	private let groupRepository: GroupRepository
	@Published private(set) var groupList: [GroupInfo] = []
	
	init(groupRepository: GroupRepository? = nil) {
		self.groupRepository = groupRepository ?? appContainer.resolve(GroupRepository.self)!
		self.bind()
	}
	
	private func bind() {
		//
	}
}
