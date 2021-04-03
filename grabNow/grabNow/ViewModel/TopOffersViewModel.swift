
import Foundation
class TopOffersViewModel {
    var offerList = [[Offer]]()
    
    func getOffers() {
        guard let offerData = NetworkManager.shared.getOffersList() else {
            return
        }
        offerList = offerData
    }
}
