
import Foundation


class ViewModel{
   static let shared = ViewModel()
    
    func getApi(complition: @escaping(_ response: ApiResponseModel) -> Void){
        let url = "https://api.inopenapp.com/api/v1/dashboardNew"
        ApiManager.shared.apiCall(url: url, apiMethod: .get, complition: { response in
            complition(response)
        })
    }
}
