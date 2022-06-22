//
//  TwoAnswerView.swift
//  ApartmentChecklist
//
//  Created by JeongminKim on 2022/06/21.
//

import UIKit
import SnapKit

final class AnswerView: UIView {
    
    var list: [String]
    var needToHideLine: Bool
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let seg = UISegmentedControl(items: list)
        seg.selectedSegmentIndex = 0
        seg.selectedSegmentTintColor = .themeColor
        seg.setTitleTextAttributes(
            [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 17, weight: .bold)
            ],
            for: .selected
        )
        seg.setTitleTextAttributes(
            [
                .foregroundColor: UIColor.label,
                .font: UIFont.systemFont(ofSize: 15, weight: .medium)
            ],
            for: .normal
        )
        return seg
    }()
    
    lazy var horizontalLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray
        view.isHidden = needToHideLine
        return view
    }()
    
    init(list: [String], needToHideLine: Bool = false) {
        self.list = list
        self.needToHideLine = needToHideLine
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [titleLabel, segmentedControl, horizontalLine]
            .forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(35)
            $0.width.equalTo(segmentedControl.intrinsicContentSize.width)
        }
        
        horizontalLine.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
}
