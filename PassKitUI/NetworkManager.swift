//
//  NetworkManager.swift
//  PassKitUI
//
//  Created by Don Shepherd on 10/18/21.
//

import UIKit
import PassKit
import os.log

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    #warning("Set URL to Pass service here")
    private let passUrl = ""
    
    func getPass(completed: @escaping (Result<PKPass, ApiError>) -> Void) {
        
        guard let url = URL(string: passUrl) else {
            completed(.failure(.invalidURL))
            Logger.passApiFailure.error("Pass API URL is invalid. ")
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                Logger.passApiFailure.error("Pass API URL retured error: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                 completed(.failure(.invalidPass))
                Logger.passApiFailure.error("Pass returned from API was invalid.")
                 return
            }
            
            do {
                
                let pass = try PKPass(data: data)
        
                completed(.success(pass))
                
            } catch {
                
                completed(.failure(.invalidPass))
            }
            
        }
        
        task.resume()
        
    }
    
}


