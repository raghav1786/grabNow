
import UIKit
import Foundation

class TopOffersViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        let cellNib = UINib(nibName: "OffersTableViewCell", bundle: nil)
        myTableView.register(cellNib, forCellReuseIdentifier: "OffersTableViewCell")
    }
}

extension TopOffersViewController: UITableViewDataSource,UITableViewDelegate {
    //MARK:Tableview Delegates and Datasource Methods
    
    func numberOfSections(in tableView: UITableView) ->  Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->  CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OffersTableViewCell") as? OffersTableViewCell else {
            return UITableViewCell()
        }
        cell.delegateOfferDetails = self
        return cell
    }
}


extension TopOffersViewController: segueHandlingCell {
    func openOfferDetailsPage() {
        let storyboardName = "Main"
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let offerDetailsViewController = storyboard.instantiateViewController(withIdentifier: "OfferDetailsViewController")
        offerDetailsViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(offerDetailsViewController, animated: true, completion: nil)
    }
}
