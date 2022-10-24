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

/// 장소
struct Place {
	/// 장소 ID
	let id: String
	/// 장소명, 업체명
	let placeName: String
	/// 카테고리 이름
	let categoryName: String
	/// 중요 카테고리만 그룹핑한 카테고리 그룹 코드
	let categoryGroupCode: String
	/// 중요 카테고리만 그룹핑한 카테고리 그룹명
	let categoryGroupName: String
	/// 전화번호
	let phone: String
	/// 전체 지번 주소
	let addressName: String
	/// 전체 도로명 주소
	let roadAddressName: String
	/// x 좌표 or 경도
	let x: String
	/// y 좌표 or 위도
	let y: String
	/// 장소 상세페이지 url
	let placeUrl: String
	/// 중심 좌표 까지의 거리(단위 m)
	let distance: String?
}
