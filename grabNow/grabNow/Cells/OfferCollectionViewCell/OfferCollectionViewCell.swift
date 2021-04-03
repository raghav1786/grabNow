
import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    //MARK: Outlets
    @IBOutlet private weak var outerView: UIView!
    @IBOutlet private weak var outerImageView: UIImageView!
    @IBOutlet private weak var logoView: UIView!
    @IBOutlet private weak var percentView: UIView!
    @IBOutlet private weak var discountLabel: UILabel!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var offLabel: UILabel!
    
    //MARK: Properties
    var offer: Offer?
    
    
    //MARK: Methods
    
    override func layoutSubviews() {
        addingCornerViews()
        configureCell()
    }
    
    private func addingCornerViews() {
        outerView.layer.cornerRadius = 12.0
        percentView.layer.cornerRadius = 10.0
        logoView.layer.cornerRadius = 6.0
    }
    
    private func configureCell() {
        let discountArray = offer?.discount.split(separator: " ")
        discountLabel.text = String(discountArray?.first ?? "")
        offLabel.text = String(discountArray?.last ?? "")
        let images = getSellerLogoImages(seller: offer?.seller ?? "")
        logoImageView.image = images.0
        outerImageView.image = images.1
    }
}
