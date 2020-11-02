
import UIKit

class OfferDetailsViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet private weak var outerView: UIImageView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var expireView: UIView!
    @IBOutlet private weak var logoView: UIView!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var voucherCode: UILabel!
    @IBOutlet private weak var voucherDesc: UILabel!
    @IBOutlet private weak var discountTitle: UILabel!
    @IBOutlet private weak var discountDesc: UILabel!
    @IBOutlet private weak var validTill: UILabel!
    @IBOutlet private weak var expiringButton: UIView!
    @IBOutlet private weak var sellerType: UILabel!
    
    //MARK: Properties
    var viewModel : OfferDetailsViewModel?
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        addingCornerViews()
        configureData()
    }
    
    @IBAction private func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func copyButtonClicked(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = viewModel?.offer?.voucherCode ?? ""
        self.showToast(message: Constants.toastClipBoard,
                       font: UIFont.systemFont(ofSize: 15.0))
    }
    
    
    @IBAction private func shareButtonClicked(_ sender: Any) {
        let items = [voucherCode.text]
        let ac = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
        present(ac, animated: true)
    }
    
    
    private func configureData() {
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
    
    
    private func addingCornerViews() {
        containerView.layer.cornerRadius = 40.0
        outerView.layer.cornerRadius = 40.0
        expireView.layer.cornerRadius = 10.0
        logoView.layer.cornerRadius = 10.0
    }
}
