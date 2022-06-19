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
    @Binding var takePic: Bool
    @State private var contentHeight: CGFloat = 0
    @State private var screenShot: UIImage? = nil
    @State private var showCaptureButton: Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            TitleView()
            
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
                            CategoryTitleView(title: "교육 / 육아")
                            
                            ThreeAnswerView(
                                title: "단지 내 어린이집",
                                firstAnswer: "초품아",
                                secondAnswer: "길 건너",
                                thirdAnswer: "멀리"
                            )
                            
                            TwoAnswerView(
                                title: "놀이터 바닥",
                                firstAnswer: "탄성",
                                secondAnswer: "모래"
                            )
                            
                            TwoAnswerView(
                                title: "놀이터 CCTV",
                                firstAnswer: "있음",
                                secondAnswer: "없음"
                            )
                        }
                        
                        Group {
                            CategoryTitleView(title: "주변")
                            
                            TwoAnswerView(
                                title: "공원",
                                firstAnswer: "가까움",
                                secondAnswer: "없음"
                            )
                            
                            ThreeAnswerView(
                                title: "백화점",
                                firstAnswer: "2개 이상",
                                secondAnswer: "1개",
                                thirdAnswer: "없음"
                            )
                            
                            TwoAnswerView(
                                title: "대형마트",
                                firstAnswer: "1개 이상",
                                secondAnswer: "없음"
                            )
                        }
                        
                        Group {
                            CategoryTitleView(title: "주차")
                            
                            TwoAnswerView(
                                title: "지상 차량 통행",
                                firstAnswer: "통행 가능",
                                secondAnswer: "통행 불가"
                            )
                            
                            TwoAnswerView(
                                title: "지하주차장 유무",
                                firstAnswer: "있음",
                                secondAnswer: "없음"
                            )
                            
                            TwoAnswerView(
                                title: "지하주차장 연결",
                                firstAnswer: "됨",
                                secondAnswer: "안 됨"
                            )
                            
                            ThreeAnswerView(
                                title: "주차 혼잡도",
                                firstAnswer: "여유",
                                secondAnswer: "보통",
                                thirdAnswer: "혼잡"
                            )
                        }
                        
                        Group {
                            CategoryTitleView(title: "구매력(소득수준)")
                            
                            ThreeAnswerView(
                                title: "외제차",
                                firstAnswer: "많음",
                                secondAnswer: "보통",
                                thirdAnswer: "적음"
                            )
                        }
                        
                        Group {
                            CategoryTitleView(title: "환경관리")
                            
                            ThreeAnswerView(
                                title: "건물 외벽 칠",
                                firstAnswer: "깔끔",
                                secondAnswer: "보통",
                                thirdAnswer: "더러움"
                            )
                            
                            ThreeAnswerView(
                                title: "청소 상태",
                                firstAnswer: "깨끗",
                                secondAnswer: "보통",
                                thirdAnswer: "더러움"
                            )
                            
                            ThreeAnswerView(
                                title: "소음",
                                firstAnswer: "조용",
                                secondAnswer: "보통",
                                thirdAnswer: "시끄러움"
                            )
                        }
                        
                        Group {
                            CategoryTitleView(title: "보안안전")
                            
                            TwoAnswerView(
                                title: "출입구 비밀번호 키",
                                firstAnswer: "있음",
                                secondAnswer: "없음"
                            )
                            
                            ThreeAnswerView(
                                title: "야간 조도",
                                firstAnswer: "밝음",
                                secondAnswer: "보통",
                                thirdAnswer: "어두움"
                            )
                        }
                        
                        Group {
                            CategoryTitleView(title: "하드웨어")
                            
                            ThreeAnswerView(
                                title: "경사 정도",
                                firstAnswer: "평지",
                                secondAnswer: "약간 경사",
                                thirdAnswer: "심한 경사"
                            )
                            
                            ThreeAnswerView(
                                title: "동간 거리",
                                firstAnswer: "멂",
                                secondAnswer: "보통",
                                thirdAnswer: "가까움"
                            )
                        }
                    }
                    
                    Spacer().frame(height: 15)
                    
                    if showCaptureButton {
                        Button(action: {
                            print("캡처한당")
                            takePic.toggle()
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
                    }
                    
                    Color.black
                        .frame(width: screenWidth, height: 1)
                    
                    if let screenShot = screenShot {
                        Image(uiImage: screenShot)
                            .scaledToFit()
                    }
                    
                    Spacer().frame(height: 15)
                }
            }
        }
        .background(
            ZStack {
                GeometryReader { proxy in
                    Color.clear.onAppear() {
                        contentHeight = proxy.size.height
                    }.onChange(of: takePic) { (newVal) in
                        showCaptureButton = false
                        if newVal {
                            let image = self.takeScreenshot(origin: proxy.frame(in: .global).origin, size: proxy.size)
                            print(image) //
                            screenShot = image
                            takePic.toggle()
                            showCaptureButton = true
                        }
                    }
                }
            })
        
    }
}

struct TitleView: View {
    var body: some View {
        Spacer().frame(height: screenHeight * 0.03)
        ZStack {
            HStack(alignment: .center) {
                Text("아파트 체크리스트")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(Color.mint)
            }
        }
    }
}

extension UIView {
    var screenShot: UIImage {
        let rect = self.bounds
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        self.layer.render(in: context)
        let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return capturedImage
    }
}

extension View {
    func takeScreenshot(origin: CGPoint, size: CGSize) -> UIImage {
        let window = UIWindow(frame: CGRect(origin: origin, size: size))
        let hosting = UIHostingController(rootView: self)
        hosting.view.frame = window.frame
        window.addSubview(hosting.view)
        window.makeKeyAndVisible()
        return hosting.view.screenShot
    }
}
