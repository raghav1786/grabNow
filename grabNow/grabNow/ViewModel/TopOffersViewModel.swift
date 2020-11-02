
import Foundation
struct TopOffersViewModel {
    var offerList = [[Offer]]()
    
    mutating func getOffers() {
        guard let offerData = NetworkManager.shared.getOffersList() else {
            return
        }
        offerList = offerData
    }
}
