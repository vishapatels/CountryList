
import Foundation

struct BeneficiaryListModel {
  
  var destinationId: Int
  init(destinationId: Int) {
       self.destinationId = destinationId
  }
  
  let apiService = APIService()
  func getBeneficiaryList(destinationId: Int, paymentMethod: Int, completionHandler complete: @escaping(BeneficiaryList?, Bool) -> Void)
  {
    apiService.performRequest(router: .getbeneficiaryList(destinationId: destinationId, paymentMethod: paymentMethod), completionHandler: { result in
      switch result {
      case .success(let data):
        if let data = data,  let beneficiaryList: BeneficiaryList =   .from(data: data){
          DispatchQueue.main.async {
            complete(beneficiaryList, true)
          }
        }
      case .failure(let error):
        DispatchQueue.main.async {
          complete(nil, false)
        }
      }
    })
  }
}


