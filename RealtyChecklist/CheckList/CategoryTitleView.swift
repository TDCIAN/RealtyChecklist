//
//  CategoryTitleView.swift
//  RealtyChecklist
//
//  Created by JeongminKim on 2022/06/19.
//

import SwiftUI

struct CategoryTitleView: View {
    var title: String
    
    var body: some View {
        HStack {
            Spacer().frame(width: 16)
            
            Text(title)
                .foregroundColor(Color.init(uiColor: UIColor.label))
                .font(.system(size: 18, weight: .bold))
                .minimumScaleFactor(0.7)
                .frame(height: 35)
            
            Spacer()
        }
        .background(Color.init(uiColor: UIColor.systemGray6))
    }
}
