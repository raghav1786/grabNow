
import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    class var CustomCell : OfferCollectionViewCell {
        let cell = Bundle.main.loadNibNamed("OfferCollectionViewCell",
                                            owner: self, options: nil)?.last
        return cell as! OfferCollectionViewCell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.red
    }
}
