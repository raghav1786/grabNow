
import Foundation

struct OfferList: Decodable {
    var data:  [[Offer]]
    
    enum CodingKeys: String,CodingKey {
        case data
    }
}

struct Offer : Decodable {
    var voucherCode: String
    var voucherDesc: String
    var discountTitle: String
    var discountDesc: String
    var validTill: String
    var isExpiringSoon: Bool
    var discount: String
    var seller: String
    var shareData: String
    
    enum CodingKeys: String, CodingKey {
        case voucherCode
        case voucherDesc
        case discountTitle
        case discountDesc
        case validTill
        case isExpiringSoon
        case discount
        case seller
        case shareData
    }
}
