//
//  Color.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/09/28.
//

import SwiftUI
 
extension Color {
  init(hex: String) {
	let scanner = Scanner(string: hex)
	_ = scanner.scanString("#")
	
	var rgb: UInt64 = 0
	scanner.scanHexInt64(&rgb)
	
	let r = Double((rgb >> 16) & 0xFF) / 255.0
	let g = Double((rgb >>  8) & 0xFF) / 255.0
	let b = Double((rgb >>  0) & 0xFF) / 255.0
	self.init(red: r, green: g, blue: b)
  }
}


//원하는 컬러 생성
extension Color {
	static let light = Color(hex: "#FFF7FBFC")
	static let base = Color(hex: "#FFD6E6F2")
	static let normal = Color(hex: "#FFB9D7EA")
	static let accent = Color(hex: "#FF769FCD")
}
