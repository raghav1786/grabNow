
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {
        
    }
    static let urlString : String = ""
    
    func getOffersList() -> [[Offer]]? {
        return getMockOffers()
    }
    
    private func getMockOffers() -> [[Offer]]? {
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: Constants.mockDataFile, withExtension: Constants.jsonType)
        let data = try! Data(contentsOf: fileUrl!)
        do {
            
            let offerList = try JSONDecoder().decode(OfferList.self, from: data)
            return offerList.data
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        return nil
    }
}
