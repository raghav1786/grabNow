
import UIKit
import Foundation

class TopOffersViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet private weak var myTableView: UITableView!
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var imageViewIcon: UIImageView!
    
    //MARK: Properties
    private var viewModel: TopOffersViewModel?
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TopOffersViewModel()
        navigationController?.navigationBar.isHidden = true
        addingCornerViews()
        configureTableView()
        registerCell()
        viewModel?.getOffers()
        myTableView?.estimatedRowHeight = UITableView.automaticDimension
        myTableView?.reloadData()
        animateTableView()
    }
    
    private func animateTableView() {
        let animator = UIViewPropertyAnimator(
            duration: 0.3,
            curve: .easeIn) { [self] in
            self.myTableView.center.x += 150
            self.headerView.center.x += 150
        }
        
        animator.startAnimation()
    }
    
    private func configureTableView() {
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    private func registerCell() {
        let cellNib = UINib(nibName: Constants.offerTableViewCell, bundle: nil)
        myTableView.register(cellNib, forCellReuseIdentifier: Constants.offerTableViewCell)
    }
    
    private func addingCornerViews() {
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.offerTableViewCell) as? OffersTableViewCell else {
            return UITableViewCell()
        }
        cell.delegateOfferDetails = self
        
        cell.rowItems = viewModel?.offerList[indexPath.row]
        return cell
    }
}


extension TopOffersViewController: CollectionItemClick {
    internal func openOfferDetailsPage(offer: Offer?) {
        guard let offerItem = offer else { return }
        let storyboard = UIStoryboard(name: Constants.mainStoryboard, bundle: nil)
        guard let offerDetailsViewController = storyboard.instantiateViewController(withIdentifier: Constants.offerDetailsVC) as? OfferDetailsViewController else { return }
        let offerDetailsViewModel = OfferDetailsViewModel(offerItem: offerItem)
        offerDetailsViewController.viewModel = offerDetailsViewModel
        self.navigationController?.pushViewController(offerDetailsViewController, animated: false)
    }
}
