//
//  ViewController.swift
//  ApartmentChecklist
//
//  Created by JeongminKim on 2022/06/21.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private lazy var baseScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.endEditingWithTap()
        scrollView.delegate = self
        return scrollView
    }()
    
    private let baseSettingView = UIView()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "아파트 체크리스트"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .themeColor
        return label
    }()
    
    private lazy var apartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "building.2")?.withTintColor(.label, renderingMode: .alwaysTemplate)
        imageView.tintColor = .label
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var apartnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아파트 이름을 입력하세요"
        textField.font = .systemFont(ofSize: 18, weight: .medium)
        textField.addLeftPadding()
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 6
        textField.addDoneButtonOnKeyboard()
        textField.clearButtonMode = .always
        return textField
    }()
    
    // MARK: 교육 / 육아
    private lazy var educationHeaderView: CategoryHeaderView = {
        let category = CategoryHeaderView()
        category.titleLabel.text = "교육 / 육아"
        return category
    }()
    
    private lazy var education1View: AnswerView = {
        let answerView = AnswerView(list: ["단지 내", "길 건너", "멀리"])
        answerView.titleLabel.text = "단지 내 어린이집"
        return answerView
    }()
    
    private lazy var education2View: AnswerView = {
        let answerView = AnswerView(list: ["초품아", "근처", "멀리"])
        answerView.titleLabel.text = "초등학교"
        return answerView
    }()
    
    private lazy var education3View: AnswerView = {
        let answerView = AnswerView(list: ["탄성", "모래"])
        answerView.titleLabel.text = "놀이터 바닥"
        return answerView
    }()
    
    private lazy var education4View: AnswerView = {
        let answerView = AnswerView(list: ["있음", "없음"], needToHideLine: true)
        answerView.titleLabel.text = "놀이터 CCTV"
        return answerView
    }()
    
    // MARK: 주변
    private lazy var aroundHeaderView: CategoryHeaderView = {
        let category = CategoryHeaderView()
        category.titleLabel.text = "주변"
        return category
    }()
    
    private lazy var around1View: AnswerView = {
        let answerView = AnswerView(list: ["가까움", "없음"])
        answerView.titleLabel.text = "공원"
        return answerView
    }()
    
    private lazy var around2View: AnswerView = {
        let answerView = AnswerView(list: ["2개 이상", "1개", "없음"])
        answerView.titleLabel.text = "백화점"
        return answerView
    }()
    
    private lazy var around3View: AnswerView = {
        let answerView = AnswerView(list: ["1개 이상", "없음"], needToHideLine: true)
        answerView.titleLabel.text = "대형마트"
        return answerView
    }()
    
    // MARK: 주차
    private lazy var parkingHeaderView: CategoryHeaderView = {
        let category = CategoryHeaderView()
        category.titleLabel.text = "주차"
        return category
    }()
    
    private lazy var parking1View: AnswerView = {
        let answerView = AnswerView(list: ["통행 불가", "통행 가능"])
        answerView.titleLabel.text = "지상 차량 통행"
        return answerView
    }()
    
    private lazy var parking2View: AnswerView = {
        let answerView = AnswerView(list: ["있음", "없음"])
        answerView.titleLabel.text = "지하주차장 유무"
        return answerView
    }()
    
    private lazy var parking3View: AnswerView = {
        let answerView = AnswerView(list: ["됨", "안 됨"])
        answerView.titleLabel.text = "지하주차장 연결"
        return answerView
    }()
    
    private lazy var parking4View: AnswerView = {
        let answerView = AnswerView(list: ["여유", "보통", "혼잡"], needToHideLine: true)
        answerView.titleLabel.text = "주차 혼잡도"
        return answerView
    }()
    
    // MARK: 구매력(소득수준)
    private lazy var incomeLevelHeaderView: CategoryHeaderView = {
        let category = CategoryHeaderView()
        category.titleLabel.text = "구매력(소득수준)"
        return category
    }()
    
    private lazy var incomeLevel1View: AnswerView = {
        let answerView = AnswerView(list: ["많음", "보통", "적음"], needToHideLine: true)
        answerView.titleLabel.text = "외제차"
        return answerView
    }()
    
    // MARK: 환경관리
    private lazy var environmentHeaderView: CategoryHeaderView = {
        let category = CategoryHeaderView()
        category.titleLabel.text = "환경관리"
        return category
    }()
    
    private lazy var environment1View: AnswerView = {
        let answerView = AnswerView(list: ["깔끔", "보통", "더러움"])
        answerView.titleLabel.text = "건물 외벽 칠"
        return answerView
    }()
    
    private lazy var environment2View: AnswerView = {
        let answerView = AnswerView(list: ["깨끗", "보통", "더러움"])
        answerView.titleLabel.text = "청소 상태"
        return answerView
    }()
    
    private lazy var environment3View: AnswerView = {
        let answerView = AnswerView(list: ["조용", "보통", "시끄러움"], needToHideLine: true)
        answerView.titleLabel.text = "소음"
        return answerView
    }()
    
    // MARK: 보안안전
    private lazy var securityHeaderView: CategoryHeaderView = {
        let category = CategoryHeaderView()
        category.titleLabel.text = "보안 / 안전"
        return category
    }()
    
    private lazy var security1View: AnswerView = {
        let answerView = AnswerView(list: ["있음", "없음"])
        answerView.titleLabel.text = "출입구 비밀번호 키"
        return answerView
    }()
    
    private lazy var security2View: AnswerView = {
        let answerView = AnswerView(list: ["밝음", "보통", "어두움"])
        answerView.titleLabel.text = "야간 조도"
        return answerView
    }()
    
    private lazy var security3View: AnswerView = {
        let answerView = AnswerView(list: ["경비 철저", "자유로움"])
        answerView.titleLabel.text = "외부인 출입 자유도"
        return answerView
    }()
    
    private lazy var security4View: AnswerView = {
        let answerView = AnswerView(list: ["있음", "없음"], needToHideLine: true)
        answerView.titleLabel.text = "차량 진입 차단기"
        return answerView
    }()
    
    // MARK: 하드웨어
    private lazy var hardwareHeaderView: CategoryHeaderView = {
        let category = CategoryHeaderView()
        category.titleLabel.text = "하드웨어"
        return category
    }()
    
    private lazy var hardware1View: AnswerView = {
        let answerView = AnswerView(list: ["평지", "약간 경사", "급경사"])
        answerView.titleLabel.text = "경사 정도"
        return answerView
    }()
    
    private lazy var hardware2View: AnswerView = {
        let answerView = AnswerView(list: ["멂", "보통", "가까움"], needToHideLine: true)
        answerView.titleLabel.text = "동간 거리"
        return answerView
    }()
    
    // MARK: 메모
    private lazy var memoHeaderView: CategoryHeaderView = {
        let category = CategoryHeaderView()
        category.titleLabel.text = "메모"
        return category
    }()
    
    private lazy var memoTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16, weight: .medium)
        textView.delegate = self
        textView.isScrollEnabled = false
        textView.layer.borderColor = UIColor.systemGray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 6
        textView.autocorrectionType = .no
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.addDoneButtonOnKeyboard()
        return textView
    }()
    
    private var isMemoTextViewEditing: Bool = false
    
    private lazy var captureButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.borderWidth = 1
        button.setTitle("체크리스트 캡처", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(didTapCaptureButton), for: .touchUpInside)
        return button
    }()

    private var captureImage = UIImage()
    private let viewForScrollViewContents = UIView()
    
    private let overlayDarkView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.9)
        view.isHidden = true
        return view
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.startAnimating()
        indicatorView.frame = CGRect(x: 0.0, y: 0.0, width: 150, height: 150)
        indicatorView.isHidden = true
        indicatorView.style = UIActivityIndicatorView.Style.large
        indicatorView.color = UIColor.white
        return indicatorView
    }()
    
    private lazy var loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "화면을 캡처하고 있습니다.\n잠시만 기다려주세요."
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }

        if isMemoTextViewEditing && self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }
    
    @objc private func keyboardWillHide() {
        if isMemoTextViewEditing {
            self.view.frame.origin.y = 0
        }
    }
    
    private func setLayout() {
        baseScrollView.addSubview(baseSettingView)
        view.addSubview(baseScrollView)
        
        baseScrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        baseSettingView.snp.makeConstraints {
            $0.width.equalTo(baseScrollView.frameLayoutGuide.snp.width)
//            $0.height.equalTo(1750)
//            $0.height.equalTo(1810)
            $0.height.equalTo(1870)
            $0.top.equalTo(baseScrollView.contentLayoutGuide.snp.top)
            $0.bottom.equalTo(baseScrollView.contentLayoutGuide.snp.bottom)
            $0.leading.equalTo(baseScrollView.contentLayoutGuide.snp.leading)
            $0.trailing.equalTo(baseScrollView.contentLayoutGuide.snp.trailing)
        }
        
        [
            titleLabel,
            apartImageView, apartnameTextField,
            educationHeaderView,
            education1View, education2View, education3View, education4View,
            aroundHeaderView,
            around1View, around2View, around3View,
            parkingHeaderView,
            parking1View, parking2View, parking3View, parking4View,
            incomeLevelHeaderView,
            incomeLevel1View,
            environmentHeaderView,
            environment1View, environment2View, environment3View,
            securityHeaderView,
            security1View, security2View, security3View, security4View,
            hardwareHeaderView,
            hardware1View, hardware2View,
            captureButton,
            memoHeaderView,
            memoTextView
        ].forEach { baseSettingView.addSubview($0) }
        
        [viewForScrollViewContents, overlayDarkView, activityIndicator, loadingLabel]
            .forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(baseSettingView.safeAreaLayoutGuide.snp.top).offset(15)
            $0.centerX.equalToSuperview()
        }
        apartImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(30)
        }
        
        apartnameTextField.snp.makeConstraints {
            $0.centerY.equalTo(apartImageView)
            $0.leading.equalTo(apartImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        
        educationHeaderView.snp.makeConstraints {
            $0.top.equalTo(apartnameTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        education1View.snp.makeConstraints {
            $0.top.equalTo(educationHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        education2View.snp.makeConstraints {
            $0.top.equalTo(education1View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        education3View.snp.makeConstraints {
            $0.top.equalTo(education2View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        education4View.snp.makeConstraints {
            $0.top.equalTo(education3View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        aroundHeaderView.snp.makeConstraints {
            $0.top.equalTo(education4View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        around1View.snp.makeConstraints {
            $0.top.equalTo(aroundHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        around2View.snp.makeConstraints {
            $0.top.equalTo(around1View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        around3View.snp.makeConstraints {
            $0.top.equalTo(around2View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        parkingHeaderView.snp.makeConstraints {
            $0.top.equalTo(around3View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        parking1View.snp.makeConstraints {
            $0.top.equalTo(parkingHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        parking2View.snp.makeConstraints {
            $0.top.equalTo(parking1View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        parking3View.snp.makeConstraints {
            $0.top.equalTo(parking2View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        parking4View.snp.makeConstraints {
            $0.top.equalTo(parking3View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        incomeLevelHeaderView.snp.makeConstraints {
            $0.top.equalTo(parking4View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        incomeLevel1View.snp.makeConstraints {
            $0.top.equalTo(incomeLevelHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        environmentHeaderView.snp.makeConstraints {
            $0.top.equalTo(incomeLevel1View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        environment1View.snp.makeConstraints {
            $0.top.equalTo(environmentHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        environment2View.snp.makeConstraints {
            $0.top.equalTo(environment1View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        environment3View.snp.makeConstraints {
            $0.top.equalTo(environment2View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        securityHeaderView.snp.makeConstraints {
            $0.top.equalTo(environment3View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        security1View.snp.makeConstraints {
            $0.top.equalTo(securityHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        security2View.snp.makeConstraints {
            $0.top.equalTo(security1View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        security3View.snp.makeConstraints {
            $0.top.equalTo(security2View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        security4View.snp.makeConstraints {
            $0.top.equalTo(security3View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        hardwareHeaderView.snp.makeConstraints {
            $0.top.equalTo(security4View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        hardware1View.snp.makeConstraints {
            $0.top.equalTo(hardwareHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        hardware2View.snp.makeConstraints {
            $0.top.equalTo(hardware1View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        memoHeaderView.snp.makeConstraints {
            $0.top.equalTo(hardware2View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        memoTextView.snp.makeConstraints {
            $0.top.equalTo(memoHeaderView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        
        captureButton.snp.makeConstraints {
//            $0.top.equalTo(answer18View.snp.bottom).offset(15)
            $0.top.equalTo(memoTextView.snp.bottom).offset(20)
            $0.height.equalTo(55)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        overlayDarkView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        loadingLabel.snp.makeConstraints {
            $0.top.equalTo(activityIndicator.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        viewForScrollViewContents.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(-40)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(0)
        }
    }
    
    @objc private func didTapCaptureButton() {
        captureAndShareCoworkShift { capturedImage in
            let shareCowkrShift:[Any] = [capturedImage]
            let activityViewController = UIActivityViewController(activityItems: shareCowkrShift, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    func captureAndShareCoworkShift(_ completionHandler:@escaping (_ capturedImage: UIImage?) -> Void) {

        overlayDarkView.isHidden = false
        activityIndicator.isHidden = false
        loadingLabel.isHidden = false
        captureButton.setTitle(Date().dateString, for: .normal)

        // MARK: (1) 사진 찍고 그 이미지 넣음
        baseScrollView.takeScreenCapture({ captureImage -> Void in
            self.captureImage = captureImage!
            self.activityIndicator.isHidden = true
            
            // 캡처 전 화면 설정
            // MARK: (2) 캡처된 이미지를 상단부 아래 붙인다
            lazy var capturedImageView: UIImageView = {
                let imageView = UIImageView()
                imageView.image = self.captureImage
                return imageView
            }()
            self.viewForScrollViewContents.addSubview(capturedImageView)
            self.viewForScrollViewContents.snp.updateConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
                $0.height.equalTo(100 + self.captureImage.size.height)
            }
            capturedImageView.snp.makeConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(50)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(self.captureImage.size.height)
            }
            // MARK: (3) 사진 높이 + 상단부 높이를 더한 만큼 이미지 생성
            UIGraphicsBeginImageContextWithOptions(
                CGSize(
                    width: self.viewForScrollViewContents.frame.width,
                    height: self.captureImage.size.height + 100
                ), false, 0
            )
            
            self.viewForScrollViewContents.layer.render(in: UIGraphicsGetCurrentContext()!)
            let wholeScreenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
            wholeScreenShotImage.pngData()
            UIGraphicsEndImageContext()
            
            // MARK: (4) 캡처 이후 원상복귀
            self.overlayDarkView.isHidden = true
            self.activityIndicator.isHidden = true
            self.loadingLabel.isHidden = true
            self.captureButton.setTitle("체크리스트 캡처", for: .normal)

            self.viewForScrollViewContents.snp.updateConstraints {
                $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
                $0.height.equalTo(0)
            }
            capturedImageView.removeFromSuperview()
            
            completionHandler(wholeScreenShotImage)
        })
    }
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}

extension MainViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
//        let baseSettingViewSize: CGFloat = 1710 + estimatedSize.height
//        let baseSettingViewSize: CGFloat = 1770 + estimatedSize.height
        let baseSettingViewSize: CGFloat = 1830 + estimatedSize.height
        baseSettingView.snp.updateConstraints {
            $0.height.equalTo(baseSettingViewSize)
        }
        
        textView.constraints.forEach { (constraint) in
            constraint.constant = estimatedSize.height
//            if estimatedSize.height <= 40 {
//
//            } else {
//                if constraint.firstAttribute == .height {
//                    constraint.constant = estimatedSize.height
//                }
//            }
        }
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        self.isMemoTextViewEditing = true
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.isMemoTextViewEditing = false
    }
}
