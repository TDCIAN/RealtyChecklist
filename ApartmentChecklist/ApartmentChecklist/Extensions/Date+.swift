//
//  Date+.swift
//  ApartmentChecklist
//
//  Created by JeongminKim on 2022/06/22.
//

import Foundation

extension Date {    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        return formatter.string(from: self)
    }
}
