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
    }
}
