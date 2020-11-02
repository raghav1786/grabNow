
import Foundation

class NetworkManager {
    static let urlString : String = ""
    
    func getOffersList() -> [[Items]]? {
        return getMockOffers()
        // Needed for API Call
        //        guard let url = URL(string: NetworkManager.urlString) else {return }
        //        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        //            guard let data = data else { return }
        //            print(String(data: data, encoding: .utf8)!)
        //        }
        //
        //        task.resume()
    }
    
    private func getMockOffers() -> [[Items]]? {
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: "MockOffers", withExtension: "json")
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
