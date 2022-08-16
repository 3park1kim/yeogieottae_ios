//
//  SettingView.swift
//  yeogieottae
//
//  Created by 김재경 on 2022/08/05.
//

import SwiftUI

struct SettingView: View {
	@ObservedObject var viewModel = SettingViewModel()
    var body: some View {
        Text("Setting View")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
