
import UIKit

protocol CollectionItemClick {
    func openOfferDetailsPage(offer: Offer?)
}

class OffersTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate  {
    //MARK: Outlets
    @IBOutlet private weak var myCollectionView: UICollectionView!
    
    //MARK: Properties
    var delegateOfferDetails : CollectionItemClick?
    var rowItems: [Offer]?
    
    //MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayoutCollectionView()
        registerCell()
    }
    
    private func setLayoutCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 140, height: 200)
        myCollectionView.collectionViewLayout = flowLayout
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    
    private func registerCell() {
        let cellNib = UINib(nibName: Constants.offerCollectionCell, bundle: nil)
        myCollectionView.register(cellNib, forCellWithReuseIdentifier: Constants.offerCollectionCell)
    }
    
    //MARK: Collection view datasource and Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowItems?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.offerCollectionCell, for: indexPath) as? OfferCollectionViewCell else{ return UICollectionViewCell()}
        cell.offer = rowItems?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegateOfferDetails?.openOfferDetailsPage(offer: rowItems?[indexPath.row])
    }
}
