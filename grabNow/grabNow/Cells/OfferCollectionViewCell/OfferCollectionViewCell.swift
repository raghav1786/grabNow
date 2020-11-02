
import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var percentView: UIView!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var offLabel: UILabel!
    var offer: Items?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addingCornerViews()
    }
    
    override func layoutSubviews() {
        addingCornerViews()
        configureCell()
    }
    
    func addingCornerViews() {
        outerView.layer.cornerRadius = 12.0
        percentView.layer.cornerRadius = 10.0
        logoView.layer.cornerRadius = 6.0
    }
    
    func configureCell() {
        let discountArray = offer?.discount.split(separator: " ")
        discountLabel.text = String(discountArray?.first ?? "")
        offLabel.text = String(discountArray?.last ?? "")
        let seller = offer?.seller ?? ""
        switch seller {
        case SellerType.swiggy.rawValue:
            logoImageView.image = UIImage(named: "swiggyLogo")
        case SellerType.bms.rawValue:
            logoImageView.image = UIImage(named: "bookmyshowLogo")
        default:
            print()
        }
    }
}
