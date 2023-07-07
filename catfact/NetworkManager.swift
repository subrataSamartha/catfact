//
//  NetworkManager.swift
//  catfact
//
//  Created by subrata Samartha on 25/04/23.
//

import Foundation

//Step-2 Create a singleton class and cerate a share instance so that it can be called publicly
class NetworkManager {
    static var shared = NetworkManager()
    let baseUrl = "https://catfact.ninja/fact"
    
    private init() {}
    
    //Step-3 create function for api call
    func getCatFact(completion: @escaping ((APIDataModel?, String?) -> Void)){
        
        //Step-4 create a url using the url string
        guard let endPointURL = URL(string: baseUrl) else {
            completion(nil, "Invalid URL")
            return
        }
        
        //step-5 create a url request using the url from previous step
        let urlRequest = URLRequest(url: endPointURL)
        
        //step-6 create a url session
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let _ = error {
                completion(nil, "Invalid url request")
                return
            }
            
            guard let actualResponse = response as? HTTPURLResponse, actualResponse.statusCode == 200 else {
                completion(nil, "invalid HTTP response")
                return
            }
            
            guard let actualData = data else {
                completion(nil, "Invalid data")
                return
            }
            
//            print("data - \(actualData)")
//            print("response - \(actualResponse)")
            
            do {
                let myDecoder = JSONDecoder()
                myDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let factData = try myDecoder.decode(APIDataModel.self, from: actualData)
                completion(factData, nil)
            } catch {
                completion(nil, "Error occured while decoding data")
            }
        }
        
        task.resume()
        
    }
}
