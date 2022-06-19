//
//  ContentView.swift
//  RealtyChecklist
//
//  Created by JeongminKim on 2022/06/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var takePic = false
    var body: some View {
        VStack {
            ScrollView {
                CheckListView.init(takePic: $takePic)
            }
        }
//        NavigationView {
//            ScrollView {
//                CheckListView.init(takePic: $takePic)
//            }.navigationTitle("데모 스크린 샷")
//                .navigationBarItems(
//                    leading:
//                        Button(action: {
//                            takePic.toggle()
//                        }, label: {
//                            Text("Take pic")
//                        })
//                )
//        }
        //        CheckListView()
        
        //        TabView {
        //            CheckListView()
        //                .tabItem {
        //                    Image(systemName: "checklist")
        //                    Text("체크리스트")
        //                }
        //
        //            Text("저장된 체크리스트")
        //                .tabItem {
        //                    Image(systemName: "list.bullet.rectangle.portrait")
        //                    Text("임장 기록")
        //                }
        //
        //            Text("설정 화면")
        //                .tabItem {
        //                    Image(systemName: "gearshape")
        //                    Text("설정")
        //                }
        //        }
    }
}
