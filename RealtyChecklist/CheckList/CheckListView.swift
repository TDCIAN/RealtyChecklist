//
//  CheckListView.swift
//  RealtyChecklist
//
//  Created by JeongminKim on 2022/06/18.
//

import SwiftUI
// checkmark.square
// checkmark.square.fill

let screenWidth: CGFloat = UIScreen.main.bounds.width
let screenHeight: CGFloat = UIScreen.main.bounds.height

struct CheckListView: View {
    @State private var apartName: String = ""
    @State private var check1: Int = 0
    @State private var check2: Int = 0
    @State private var check3: Int = 0
    @State private var check4: Int = 0
    @State private var check5: Int = 0
    @State private var check6: Int = 0
    @State private var check7: Int = 0
    @State private var check8: Int = 0
    @State private var check9: Int = 0
    @State private var check10: Int = 0
    @State private var check11: Int = 0
    @State private var check12: Int = 0
    @State private var check13: Int = 0
    @State private var check14: Int = 0
    @State private var check15: Int = 0
    @State private var check16: Int = 0
    @State private var check17: Int = 0
    @State private var check18: Int = 0
    @State private var check19: Int = 0
    @State private var check20: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: screenHeight * 0.03)
            ZStack {
                HStack(alignment: .center) {
                    Text("아파트 체크리스트")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(Color.mint)
                }
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        print("초기화 버튼 눌렀다")
                    }, label: {
                        Text("초기화")
                            .foregroundColor(.init(UIColor.systemBlue))
                            .font(.system(size: 15, weight: .bold))
                            .padding(.trailing, 16)
                    })
                }
            }
            
            Spacer().frame(height: 10)
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "building.2")
                            .font(.system(size: 20))
                            .padding(.leading, 16)
                        
                        Spacer().frame(width: 15)
                        
                        HStack {
                            Spacer().frame(width: 15)
                            
                            TextField("아파트 이름을 입력하세요.", text: $apartName)
                                .frame(height: 40)
                                .minimumScaleFactor(0.7)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.trailing, 16)
                        .frame(height: 40)
                    }
                    
                    Spacer().frame(height: 10)
                    
                    Group {
                        Group {
                            HStack {
                                Spacer().frame(width: 16)
                                
                                Text("교육 / 육아")
                                    .foregroundColor(Color.init(uiColor: UIColor.label))
                                    .font(.system(size: 18, weight: .bold))
                                    .minimumScaleFactor(0.7)
                                    .frame(height: 35)
                                
                                Spacer()
                            }
                            .background(Color.init(uiColor: UIColor.systemGray6))
                            
                            ThreeAnswerView(
                                title: "단지 내 어린이집",
                                checkedNumber: $check1,
                                firstAnswer: "초품아",
                                secondAnswer: "길 건너",
                                thirdAnswer: "멀리"
                            )
                            
                            TwoAnswerView(
                                title: "놀이터 바닥",
                                checkedNumber: $check4,
                                firstAnswer: "탄성",
                                secondAnswer: "모래"
                            )
                            
                            TwoAnswerView(
                                title: "놀이터 CCTV",
                                checkedNumber: $check5,
                                firstAnswer: "있음",
                                secondAnswer: "없음"
                            )
                            
                        }
                        
                        Group {
                            HStack {
                                Spacer().frame(width: 16)
                                
                                Text("주변")
                                    .foregroundColor(Color.init(uiColor: UIColor.label))
                                    .font(.system(size: 18, weight: .bold))
                                    .minimumScaleFactor(0.7)
                                    .frame(height: 35)
                                
                                Spacer()
                            }
                            .background(Color.init(uiColor: UIColor.systemGray6))
                            
                            TwoAnswerView(
                                title: "공원",
                                checkedNumber: $check3,
                                firstAnswer: "가까움",
                                secondAnswer: "없음"
                            )
                            
                            ThreeAnswerView(
                                title: "백화점",
                                checkedNumber: $check9,
                                firstAnswer: "2개 이상",
                                secondAnswer: "1개",
                                thirdAnswer: "없음"
                            )
                            
                            TwoAnswerView(
                                title: "대형마트",
                                checkedNumber: $check7,
                                firstAnswer: "1개 이상",
                                secondAnswer: "없음"
                            )
                        }
                        
                        Group {
                            HStack {
                                Spacer().frame(width: 16)
                                
                                Text("주차")
                                    .foregroundColor(Color.init(uiColor: UIColor.label))
                                    .font(.system(size: 18, weight: .bold))
                                    .minimumScaleFactor(0.7)
                                    .frame(height: 35)
                                
                                Spacer()
                            }
                            .background(Color.init(uiColor: UIColor.systemGray6))
                            
                            TwoAnswerView(
                                title: "지상 차량 통행",
                                checkedNumber: $check14,
                                firstAnswer: "통행 가능",
                                secondAnswer: "통행 불가"
                            )
                            
                            TwoAnswerView(
                                title: "지하주차장 유무",
                                checkedNumber: $check16,
                                firstAnswer: "있음",
                                secondAnswer: "없음"
                            )
                            
                            TwoAnswerView(
                                title: "지하주차장 연결",
                                checkedNumber: $check15,
                                firstAnswer: "됨",
                                secondAnswer: "안 됨"
                            )
                            
                            ThreeAnswerView(
                                title: "주차 혼잡도",
                                checkedNumber: $check13,
                                firstAnswer: "여유",
                                secondAnswer: "보통",
                                thirdAnswer: "혼잡"
                            )
                        }
                        
                        Group {
                            HStack {
                                Spacer().frame(width: 16)
                                
                                Text("구매력(소득수준)")
                                    .foregroundColor(Color.init(uiColor: UIColor.label))
                                    .font(.system(size: 18, weight: .bold))
                                    .minimumScaleFactor(0.7)
                                    .frame(height: 35)
                                
                                Spacer()
                            }
                            .background(Color.init(uiColor: UIColor.systemGray6))
                            
                            ThreeAnswerView(
                                title: "외제차",
                                checkedNumber: $check12,
                                firstAnswer: "많음",
                                secondAnswer: "보통",
                                thirdAnswer: "적음"
                            )
                        }
                        
                        Group {
                            HStack {
                                Spacer().frame(width: 16)
                                
                                Text("환경관리")
                                    .foregroundColor(Color.init(uiColor: UIColor.label))
                                    .font(.system(size: 18, weight: .bold))
                                    .minimumScaleFactor(0.7)
                                    .frame(height: 35)
                                
                                Spacer()
                            }
                            .background(Color.init(uiColor: UIColor.systemGray6))
                            
                            ThreeAnswerView(
                                title: "건물 외벽 칠",
                                checkedNumber: $check1,
                                firstAnswer: "깔끔",
                                secondAnswer: "보통",
                                thirdAnswer: "더러움"
                            )
                            
                            ThreeAnswerView(
                                title: "청소 상태",
                                checkedNumber: $check18,
                                firstAnswer: "깨끗",
                                secondAnswer: "보통",
                                thirdAnswer: "더러움"
                            )
                            
                            ThreeAnswerView(
                                title: "소음",
                                checkedNumber: $check10,
                                firstAnswer: "조용",
                                secondAnswer: "보통",
                                thirdAnswer: "시끄러움"
                            )
                        }
                        
                        Group {
                            HStack {
                                Spacer().frame(width: 16)
                                
                                Text("보안안전")
                                    .foregroundColor(Color.init(uiColor: UIColor.label))
                                    .font(.system(size: 18, weight: .bold))
                                    .minimumScaleFactor(0.7)
                                    .frame(height: 35)
                                
                                Spacer()
                            }
                            .background(Color.init(uiColor: UIColor.systemGray6))
                            
                            TwoAnswerView(
                                title: "출입구 비밀번호 키",
                                checkedNumber: $check20,
                                firstAnswer: "있음",
                                secondAnswer: "없음"
                            )
                            
                            ThreeAnswerView(
                                title: "야간 조도",
                                checkedNumber: $check11,
                                firstAnswer: "밝음",
                                secondAnswer: "보통",
                                thirdAnswer: "어두움"
                            )
                        }
                        
                        Group {
                            HStack {
                                Spacer().frame(width: 16)
                                
                                Text("하드웨어")
                                    .foregroundColor(Color.init(uiColor: UIColor.label))
                                    .font(.system(size: 18, weight: .bold))
                                    .minimumScaleFactor(0.7)
                                    .frame(height: 35)
                                
                                Spacer()
                            }
                            .background(Color.init(uiColor: UIColor.systemGray6))
                            
                            ThreeAnswerView(
                                title: "경사 정도",
                                checkedNumber: $check2,
                                firstAnswer: "평지",
                                secondAnswer: "약간 경사",
                                thirdAnswer: "심한 경사"
                            )
                            
                            ThreeAnswerView(
                                title: "동간 거리",
                                checkedNumber: $check8,
                                firstAnswer: "멂",
                                secondAnswer: "보통",
                                thirdAnswer: "가까움"
                            )
                            
                        }
                    }
                    
                    Spacer().frame(height: 15)
                    
                    Button(action: {
                        print("캡처한당")
                    }, label: {
                        HStack(alignment: .center) {
                            Text("체크리스트 캡처")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 20, weight: .bold))
                        }
                        .frame(width: screenWidth - 40, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        
                    })
                    
                    Spacer().frame(height: 15)
                }
            }
        }
    }
}

struct TwoAnswerView: View {
    var title: String
    @Binding var checkedNumber: Int
    var firstAnswer: String
    var secondAnswer: String
    
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

struct ThreeAnswerView: View {
    var title: String
    @Binding var checkedNumber: Int
    var firstAnswer: String
    var secondAnswer: String
    var thirdAnswer: String
    
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
                    
                    Button(action: {
                        checkedNumber = 2
                    }, label: {
                        Image(systemName: (checkedNumber == 2) ? "checkmark.square.fill" : "checkmark.square")
                            .renderingMode(.template)
                            .foregroundColor((checkedNumber == 2) ? Color.mint : Color.gray)
                            .font(.system(size: 20))
                        
                        Spacer().frame(width: 3)
                        
                        Text(thirdAnswer)
                            .foregroundColor(.init(uiColor: UIColor.secondaryLabel))
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor((checkedNumber == 2) ? Color.mint : Color.gray)
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
