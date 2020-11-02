
import UIKit

class OfferDetailsViewController: UIViewController {
    @IBOutlet weak var outerView: UIImageView!
    @IBOutlet weak var containerView: UIView!
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
        let pasteboard = UIPasteboard.general
        pasteboard.string = viewModel?.offer?.voucherCode ?? ""
        self.showToast(message: "copied to clipboard", font: UIFont.systemFont(ofSize: 15.0))
    }
    
    
    @IBAction func shareButtonClicked(_ sender: Any) {
        let items = [voucherCode.text]
        let ac = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
        present(ac, animated: true)
    }
    
    
    func configureData() {
        voucherCode.text = viewModel?.offer?.voucherCode ?? ""
        voucherDesc.text = viewModel?.offer?.voucherDesc ?? ""
        discountTitle.text = viewModel?.offer?.discountTitle ?? ""
        discountDesc.text = viewModel?.offer?.discountDesc ?? ""
        validTill.text = viewModel?.offer?.validTill ?? ""
        sellerType.text = viewModel?.offer?.seller ?? ""
        expiringButton.isHidden = !(viewModel?.offer?.isExpiringSoon ?? false)
        let images = getSellerLogoImages(seller: viewModel?.offer?.seller ?? "")
        logoImageView.image = images.0
        outerView.image = images.1
    }
    
    
    func addingCornerViews() {
        containerView.layer.cornerRadius = 40.0
        outerView.layer.cornerRadius = 40.0
        expireView.layer.cornerRadius = 10.0
        logoView.layer.cornerRadius = 10.0
    }
}
