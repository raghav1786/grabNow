
import Foundation
struct TopOffersViewModel {
    var offerList: [[Items]]?
    var networkManager = NetworkManager()
    
    mutating func getOffersList() {
        guard let offerData = networkManager.getMockOffers() else {
            return
        }
        offerList = offerData
    }
}
