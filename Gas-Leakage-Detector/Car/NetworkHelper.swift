//
//  NetworkHelper.swift
//  Car
//
//  Created by Student on 3/26/20.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation
import UIKit
struct NetworkHelper {
    
    private static var _shared:NetworkHelper!
    
    static var shared:NetworkHelper {         // To access this anywhere, in the app just write Restaurants.shared
        if _shared == nil {
            _shared = NetworkHelper()
        }
        return _shared
    }
    
    
    func loginRequestBuilder(RequestURL:String,BodyData:String,Method:String) -> Bool{
        var result:Bool=false
        let url = URL(string: RequestURL)
        let sem = DispatchSemaphore(value: 0)
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = Method
        let postString = BodyData;
        request.httpBody = postString.data(using: String.Encoding.utf8);
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            defer { sem.signal() }
            if let error = error {
                print("Error took place \(error)")
                result = false
                
            }
            // Convert HTTP Response Data to a String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
                result = self.handleData(responeData:dataString)
            }
        }
        task.resume()
        
        sem.wait(timeout: .distantFuture)
        return result
    }
    
    
    
    
    private func handleData(responeData : String )-> Bool{
        var result:Bool = false
        let data = Data(responeData.utf8)
        
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                // try to read out a string array
                if let access_token = json["access_token"] as? String {
                    UserDefaults.standard.set(access_token,forKey: "AccessToken")
                    result = true
                }
                if let error_description = json["error_description"] as? String {
                    UserDefaults.standard.set(error_description,forKey: "error_description")
                    result = false
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
            result = false
        }
        return result
    }
    
}
