
import Foundation
import UIKit

public func getSellerLogoImages(seller: String) -> (UIImage,UIImage) {
    switch seller {
    case SellerType.swiggy.rawValue:
        return (UIImage(named: Constants.swiggyImage) ?? UIImage(),
                UIImage(named: Constants.swiggyBackImage) ?? UIImage())
    case SellerType.bms.rawValue:
        return (UIImage(named: Constants.bmsImage) ?? UIImage(),
                UIImage(named: Constants.bmsBackImage) ?? UIImage())
    default:
        return (UIImage(),UIImage())
    }
}
