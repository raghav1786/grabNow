
import UIKit

class OffersTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate  {
    @IBOutlet weak var myCollectionView: UICollectionView!
    var delegateOfferDetails : segueHandlingCell?
    var rowItems: [Items]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 140, height: 200)
        myCollectionView.collectionViewLayout = flowLayout
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        let cellNib = UINib(nibName: "OfferCollectionViewCell", bundle: nil)
        myCollectionView.register(cellNib, forCellWithReuseIdentifier: "OfferCollectionViewCell")
    }
    
    //MARK: Collection view datasource and Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCollectionViewCell", for: indexPath) as? OfferCollectionViewCell else{ return UICollectionViewCell()}
        cell.offer = rowItems?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegateOfferDetails?.openOfferDetailsPage(offer: rowItems?[indexPath.row])
    }
}

protocol segueHandlingCell {
    func openOfferDetailsPage(offer: Items?)
}
