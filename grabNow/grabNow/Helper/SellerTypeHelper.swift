
import Foundation
import UIKit

public func getSellerLogoImages(seller: String) -> (UIImage,UIImage) {
    switch seller {
    case SellerType.swiggy.rawValue:
       return (UIImage(named: "swiggyLogo") ?? UIImage(),
               UIImage(named: "food") ?? UIImage())
    case SellerType.bms.rawValue:
        return (UIImage(named: "bookmyshowLogo") ?? UIImage(),
                UIImage(named: "joker") ?? UIImage())
    default:
        return (UIImage(),UIImage())
    }
}
