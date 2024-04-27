
import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

class ApiManager{
    static let shared = ApiManager()
    
    func apiCall(url: String, apiMethod: HTTPMethod , complition: @escaping(_ response: ApiResponseModel) -> Void){
        guard let url = URL(string: url) else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = apiMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            if let error = error{
                print(error)
            }
            else if let data = data{
              print(data)
                do{
                  let result = try JSONDecoder().decode(ApiResponseModel.self, from: data)
                    complition(result)
                }
                catch{
                  print(error)
                }
             
              }
               
            }.resume()
    }
    }



   
       
