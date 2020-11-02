
import Foundation
struct TopOffersViewModel {
    var offerList = [[Items]]()
    var networkManager = NetworkManager()
    
    mutating func getOffers() {
        guard let offerData = networkManager.getOffersList() else {
            return
        }
        offerList = offerData
    }
}
