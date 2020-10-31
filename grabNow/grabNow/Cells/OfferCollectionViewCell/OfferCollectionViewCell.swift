
import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var percentView: UIView!
    class var CustomCell : OfferCollectionViewCell {
        let cell = Bundle.main.loadNibNamed("OfferCollectionViewCell",
                                            owner: self, options: nil)?.last
        return cell as! OfferCollectionViewCell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addingCornerViews()
    }
    
    func addingCornerViews() {
        outerView.layer.cornerRadius = 12.0
        percentView.layer.cornerRadius = 10.0
        logoView.layer.cornerRadius = 6.0
    }
}
