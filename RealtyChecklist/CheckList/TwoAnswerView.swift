//
//  TwoAnswerView.swift
//  RealtyChecklist
//
//  Created by JeongminKim on 2022/06/19.
//

import SwiftUI

struct TwoAnswerView: View {
    var title: String
    var firstAnswer: String
    var secondAnswer: String
    
    @State var checkedNumber: Int = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 7)
            HStack {
                Spacer().frame(width: 16)
                
                Text(title)
                    .foregroundColor(.init(uiColor: UIColor.secondaryLabel))
                    .font(.system(size: 17, weight: .semibold))
                    .minimumScaleFactor(0.7)
                
                Spacer()
                
                HStack(spacing: 13) {
                    Button(action: {
                        checkedNumber = 0
                    }, label: {
                        Image(systemName: (checkedNumber == 0) ? "checkmark.square.fill" : "checkmark.square")
                            .renderingMode(.template)
                            .foregroundColor((checkedNumber == 0) ? Color.mint : Color.gray)
                            .font(.system(size: 20))
                        
                        Spacer().frame(width: 3)
                        
                        Text(firstAnswer)
                            .foregroundColor(.init(uiColor: UIColor.secondaryLabel))
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor((checkedNumber == 0) ? Color.mint : Color.gray)
                            .minimumScaleFactor(0.7)
                    })
                    
                    Button(action: {
                        checkedNumber = 1
                    }, label: {
                        Image(systemName: (checkedNumber == 1) ? "checkmark.square.fill" : "checkmark.square")
                            .renderingMode(.template)
                            .foregroundColor((checkedNumber == 1) ? Color.mint : Color.gray)
                            .font(.system(size: 20))
                        
                        Spacer().frame(width: 3)
                        
                        Text(secondAnswer)
                            .foregroundColor(.init(uiColor: UIColor.secondaryLabel))
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor((checkedNumber == 1) ? Color.mint : Color.gray)
                            .minimumScaleFactor(0.7)
                    })
                }
                Spacer().frame(width: 16)
            }
            .frame(height: 40)
            
            Color.gray
                .frame(width: screenWidth - 32, height: 0.5)
            
        }
    }
}
