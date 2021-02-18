//
//  ViewController.swift
//  ToastViewEx
//
//  Created by 김종권 on 2021/02/18.
//

import UIKit
import Toast_Swift

class ViewController: UIViewController {

    @IBOutlet weak var btnToast: UIButton!
    let toastViewHeight: CGFloat = 40
    var toastMessageView: ToastMessageView?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnTap(_ sender: Any) {
        showToastView(message: "토스트 메세지 예시123123123", above: btnToast, offset: 6)
    }

    func showToastView(message: String, above anchorView: UIView, offset: CGFloat) {
        let centerX: CGFloat = view.bounds.width / 2
        let centerY: CGFloat = anchorView.frame.origin.y - (toastViewHeight / 2) - offset
        let point = CGPoint(x: centerX, y: centerY)

        self.showToastView(message: message, point: point)
    }

    func showToastView(message: String, point: CGPoint? = nil) {
        let toastViewWidth = widthSizeToastViewByComparing(string: message)
        let messageView = ToastMessageView(frame: CGRect(x: 0, y: 0, width: toastViewWidth, height: toastViewHeight))

        messageView.layer.cornerRadius = 16
        messageView.toastMessageLabel.text = message
        if let point = point {
            view.showToast(messageView, point: point)
        } else {
            view.showToast(messageView)
        }
        toastMessageView?.isHidden = true
        toastMessageView = messageView
    }

    private func widthSizeToastViewByComparing(string: String) -> CGFloat {
        let temporaryLabel = UILabel()
        temporaryLabel.font = UIFont.systemFont(ofSize: 15)
        temporaryLabel.text = string
        return temporaryLabel.intrinsicContentSize.width + 48.5
    }
}
