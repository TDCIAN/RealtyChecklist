//
//  UIScrollView+.swift
//  ApartmentChecklist
//
//  Created by JeongminKim on 2022/06/21.
//

import UIKit

extension UIScrollView {
    func takeScreenCapture(_ completionHandler:@escaping (_ capturedImage: UIImage?) -> Void) {

        let frameHeight = Float(self.frame.size.height) // 현재 보이는 크기
        let contentHeight = Float(self.contentSize.height) // 전체 컨텐츠 크기
        let contentSize = self.contentSize
        
        DispatchQueue.global(qos: .background).async {
            
            let page = Int(ceil(contentHeight / frameHeight))
            var currentPage = 0

            DispatchQueue.main.async {
                self.setContentOffset(CGPoint.zero, animated: false)
                UIGraphicsBeginImageContextWithOptions(contentSize, false, UIScreen.main.scale)
            }
            
            while currentPage <= page {
                DispatchQueue.main.async {
                    self.contentOffset = CGPoint(x: 0, y: CGFloat(currentPage) * CGFloat(frameHeight))
                }
                
                usleep(300000)
                
                DispatchQueue.main.async {
                    self.drawHierarchy(in: CGRect(x: 0, y: self.contentOffset.y, width: self.bounds.size.width, height: CGFloat(frameHeight)), afterScreenUpdates: true)
                }
                
                currentPage += 1
            }

            DispatchQueue.main.async {
                let image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                self.contentOffset = CGPoint(x: 0, y: 0)
                completionHandler(image)
            }
        }
    }
    
    func endEditingWithTap() {
        UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(sender:)))
    }
    
    @objc func handleTapGesture(sender: UITapGestureRecognizer) {
        self.superview?.endEditing(true)
    }
}
