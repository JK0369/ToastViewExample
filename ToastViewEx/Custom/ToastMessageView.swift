//
//  ToastMessageView.swift
//  ToastViewEx
//
//  Created by 김종권 on 2021/02/18.
//

import UIKit

class ToastMessageView: UIView {

    @IBOutlet weak var toastMessageLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

}

extension UIView {
    func xibSetup() {
        guard let view = loadViewFromNib(nib: type(of: self).className()) else {
            return
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = bounds
        addSubview(view)
    }

    func loadViewFromNib(nib: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nib, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

extension NSObject {

    var className: String {
        return String(describing: type(of: self))
    }

    static func className() -> String {
        return String(describing: self)
    }
}
