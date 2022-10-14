//
//  Place.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/10/11.
//

import Foundation
import SwiftUI

/// 장소 태그
struct Tag {
	/// 태그 ID
	let id: String
	/// 태그명
	let title: String
	/// 대표 이미지
	let thumnailUri: String?
}

extension Tag: Decodable { }
