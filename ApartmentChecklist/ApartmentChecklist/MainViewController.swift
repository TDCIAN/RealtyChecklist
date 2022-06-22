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
        imageView.image = UIImage(systemName: "building.2")?.withTintColor(.black, renderingMode: .alwaysTemplate)
        imageView.tintColor = .black
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
        return textField
    }()
    
    // MARK: 교육 / 육아
    private lazy var educationHeaderView: CategoryHeaderView = {
        let category = CategoryHeaderView()
        category.titleLabel.text = "교육 / 육아"
        return category
    }()
    
    private lazy var answer1View: AnswerView = {
        let answerView = AnswerView(list: ["초품아", "길 건너", "멀리"])
        answerView.titleLabel.text = "단지 내 어린이집"
        return answerView
    }()
    
    private lazy var answer2View: AnswerView = {
        let answerView = AnswerView(list: ["탄성", "모래"])
        answerView.titleLabel.text = "놀이터 바닥"
        return answerView
    }()
    
    private lazy var answer3View: AnswerView = {
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
    
    private lazy var answer4View: AnswerView = {
        let answerView = AnswerView(list: ["가까움", "없음"])
        answerView.titleLabel.text = "공원"
        return answerView
    }()
    
    private lazy var answer5View: AnswerView = {
        let answerView = AnswerView(list: ["2개 이상", "1개", "없음"])
        answerView.titleLabel.text = "백화점"
        return answerView
    }()
    
    private lazy var answer6View: AnswerView = {
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
    
    private lazy var answer7View: AnswerView = {
        let answerView = AnswerView(list: ["통행 불가", "통행 가능"])
        answerView.titleLabel.text = "지상 차량 통행"
        return answerView
    }()
    
    private lazy var answer8View: AnswerView = {
        let answerView = AnswerView(list: ["있음", "없음"])
        answerView.titleLabel.text = "지하주차장 유무"
        return answerView
    }()
    
    private lazy var answer9View: AnswerView = {
        let answerView = AnswerView(list: ["됨", "안 됨"])
        answerView.titleLabel.text = "지하주차장 연결"
        return answerView
    }()
    
    private lazy var answer10View: AnswerView = {
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
    
    private lazy var answer11View: AnswerView = {
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
    
    private lazy var answer12View: AnswerView = {
        let answerView = AnswerView(list: ["깔끔", "보통", "더러움"])
        answerView.titleLabel.text = "건물 외벽 칠"
        return answerView
    }()
    
    private lazy var answer13View: AnswerView = {
        let answerView = AnswerView(list: ["깨끗", "보통", "더러움"])
        answerView.titleLabel.text = "청소 상태"
        return answerView
    }()
    
    private lazy var answer14View: AnswerView = {
        let answerView = AnswerView(list: ["조용", "보통", "시끄러움"], needToHideLine: true)
        answerView.titleLabel.text = "소음"
        return answerView
    }()
    
    // MARK: 보안안전
    private lazy var securityHeaderView: CategoryHeaderView = {
        let category = CategoryHeaderView()
        category.titleLabel.text = "보안안전"
        return category
    }()
    
    private lazy var answer15View: AnswerView = {
        let answerView = AnswerView(list: ["있음", "없음"])
        answerView.titleLabel.text = "출입구 비밀번호 키"
        return answerView
    }()
    
    private lazy var answer16View: AnswerView = {
        let answerView = AnswerView(list: ["밝음", "보통", "어두움"], needToHideLine: true)
        answerView.titleLabel.text = "야간 조도"
        return answerView
    }()
    
    // MARK: 하드웨어
    private lazy var hardwareHeaderView: CategoryHeaderView = {
        let category = CategoryHeaderView()
        category.titleLabel.text = "하드웨어"
        return category
    }()
    
    private lazy var answer17View: AnswerView = {
        let answerView = AnswerView(list: ["평지", "약간 경사", "급경사"])
        answerView.titleLabel.text = "경사 정도"
        return answerView
    }()
    
    private lazy var answer18View: AnswerView = {
        let answerView = AnswerView(list: ["멂", "보통", "가까움"], needToHideLine: true)
        answerView.titleLabel.text = "동간 거리"
        return answerView
    }()
    
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
            $0.height.equalTo(1600)
            $0.top.equalTo(baseScrollView.contentLayoutGuide.snp.top)
            $0.bottom.equalTo(baseScrollView.contentLayoutGuide.snp.bottom)
            $0.leading.equalTo(baseScrollView.contentLayoutGuide.snp.leading)
            $0.trailing.equalTo(baseScrollView.contentLayoutGuide.snp.trailing)
        }
        
        [
            titleLabel,
            apartImageView, apartnameTextField,
            educationHeaderView,
            answer1View, answer2View, answer3View,
            aroundHeaderView,
            answer4View, answer5View, answer6View,
            parkingHeaderView,
            answer7View, answer8View, answer9View, answer10View,
            incomeLevelHeaderView,
            answer11View,
            environmentHeaderView,
            answer12View, answer13View, answer14View,
            securityHeaderView,
            answer15View, answer16View,
            hardwareHeaderView,
            answer17View, answer18View,
            captureButton,
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
        
        answer1View.snp.makeConstraints {
            $0.top.equalTo(educationHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        answer2View.snp.makeConstraints {
            $0.top.equalTo(answer1View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        answer3View.snp.makeConstraints {
            $0.top.equalTo(answer2View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        aroundHeaderView.snp.makeConstraints {
            $0.top.equalTo(answer3View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        answer4View.snp.makeConstraints {
            $0.top.equalTo(aroundHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        answer5View.snp.makeConstraints {
            $0.top.equalTo(answer4View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        answer6View.snp.makeConstraints {
            $0.top.equalTo(answer5View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        parkingHeaderView.snp.makeConstraints {
            $0.top.equalTo(answer6View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        answer7View.snp.makeConstraints {
            $0.top.equalTo(parkingHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        answer8View.snp.makeConstraints {
            $0.top.equalTo(answer7View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        answer9View.snp.makeConstraints {
            $0.top.equalTo(answer8View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        answer10View.snp.makeConstraints {
            $0.top.equalTo(answer9View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        incomeLevelHeaderView.snp.makeConstraints {
            $0.top.equalTo(answer10View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        answer11View.snp.makeConstraints {
            $0.top.equalTo(incomeLevelHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        environmentHeaderView.snp.makeConstraints {
            $0.top.equalTo(answer11View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        answer12View.snp.makeConstraints {
            $0.top.equalTo(environmentHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        answer13View.snp.makeConstraints {
            $0.top.equalTo(answer12View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        answer14View.snp.makeConstraints {
            $0.top.equalTo(answer13View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        securityHeaderView.snp.makeConstraints {
            $0.top.equalTo(answer14View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        answer15View.snp.makeConstraints {
            $0.top.equalTo(securityHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        answer16View.snp.makeConstraints {
            $0.top.equalTo(answer15View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        hardwareHeaderView.snp.makeConstraints {
            $0.top.equalTo(answer16View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        answer17View.snp.makeConstraints {
            $0.top.equalTo(hardwareHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        answer18View.snp.makeConstraints {
            $0.top.equalTo(answer17View.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        captureButton.snp.makeConstraints {
            $0.top.equalTo(answer18View.snp.bottom).offset(15)
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
