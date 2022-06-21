//
//  TitleView.swift
//  RealtyChecklist
//
//  Created by JeongminKim on 2022/06/21.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Spacer().frame(height: screenHeight * 0.03)
        ZStack {
            HStack(alignment: .center) {
                Text("아파트 체크리스트")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(Color.themeColor)
            }
        }
    }
}
