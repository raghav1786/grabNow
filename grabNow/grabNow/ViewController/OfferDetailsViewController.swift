
import UIKit

class OfferDetailsViewController: UIViewController {
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var expireView: UIView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var voucherCode: UILabel!
    @IBOutlet weak var voucherDesc: UILabel!
    @IBOutlet weak var discountTitle: UILabel!
    @IBOutlet weak var discountDesc: UILabel!
    @IBOutlet weak var validTill: UILabel!
    @IBOutlet weak var expiringButton: UIView!
    @IBOutlet weak var sellerType: UILabel!
    
    var viewModel : OfferDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        addingCornerViews()
        configureData()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func copyButtonClicked(_ sender: Any) {
    }
    
    
    @IBAction func shareButtonClicked(_ sender: Any) {
    }
    
    
    func configureData() {
        voucherCode.text = viewModel?.offer?.seller ?? ""
        voucherDesc.text = viewModel?.offer?.voucherDesc ?? ""
        discountTitle.text = viewModel?.offer?.discountTitle ?? ""
        discountDesc.text = viewModel?.offer?.discountDesc ?? ""
        validTill.text = viewModel?.offer?.validTill ?? ""
        sellerType.text = viewModel?.offer?.voucherCode ?? ""
        expiringButton.isHidden = !(viewModel?.offer?.isExpiringSoon ?? false)
        let seller = viewModel?.offer?.seller ?? ""
        switch seller {
        case SellerType.swiggy.rawValue:
            logoImageView.image = UIImage(named: "swiggyLogo")
        case SellerType.bms.rawValue:
            logoImageView.image = UIImage(named: "bookmyshowLogo")
        default:
            print()
        }
    }
    
    
    func addingCornerViews() {
        outerView.layer.cornerRadius = 30.0
        expireView.layer.cornerRadius = 10.0
        logoView.layer.cornerRadius = 10.0
    }
}
