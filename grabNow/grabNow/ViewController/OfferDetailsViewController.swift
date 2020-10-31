
import UIKit

class OfferDetailsViewController: UIViewController {
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var expireView: UIView!
    @IBOutlet weak var logoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        addingCornerViews()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func copyButtonClicked(_ sender: Any) {
    }
    
    
    @IBAction func shareButtonClicked(_ sender: Any) {
    }
    
    
    func addingCornerViews() {
        outerView.layer.cornerRadius = 30.0
        expireView.layer.cornerRadius = 10.0
        logoView.layer.cornerRadius = 10.0
    }
}
