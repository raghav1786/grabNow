
import UIKit
import Foundation

class TopOffersViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var imageViewIcon: UIImageView!
    
    var viewModel: TopOffersViewModel?
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TopOffersViewModel()
        navigationController?.navigationBar.isHidden = true
        myTableView.delegate = self
        myTableView.dataSource = self
        let cellNib = UINib(nibName: "OffersTableViewCell", bundle: nil)
        myTableView.register(cellNib, forCellReuseIdentifier: "OffersTableViewCell")
        addingCornerViews()
        viewModel?.getOffers()
        myTableView?.reloadData()
    }
    
    func addingCornerViews() {
        headerView.layer.cornerRadius = 20.0
        imageViewIcon.layer.cornerRadius = 8.0
    }
}

extension TopOffersViewController: UITableViewDataSource,UITableViewDelegate {
    //MARK:Tableview Delegates and Datasource Methods
    
    func numberOfSections(in tableView: UITableView) ->  Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.offerList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->  CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OffersTableViewCell") as? OffersTableViewCell else {
            return UITableViewCell()
        }
        cell.delegateOfferDetails = self
        
        cell.rowItems = viewModel?.offerList[indexPath.row]
        return cell
    }
}


extension TopOffersViewController: segueHandlingCell {
    func openOfferDetailsPage(offer: Items?) {
        guard let offerItem = offer else { return }
        let storyboardName = "Main"
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let offerDetailsViewController = storyboard.instantiateViewController(withIdentifier: "OfferDetailsViewController") as? OfferDetailsViewController else { return }
        let offerDetailsViewModel = OfferDetailsViewModel(offerItem: offerItem)
        offerDetailsViewController.viewModel = offerDetailsViewModel
        offerDetailsViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.navigationController?.pushViewController(offerDetailsViewController, animated: true)
    }
}
