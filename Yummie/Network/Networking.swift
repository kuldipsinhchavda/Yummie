//
//  NetworkService.swift
//  Food Adda
//
//  Created by MacMini1 on 01/01/01.
//  Copyright © 2001 bacancy. All rights reserved.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchAllCategories(completion: @escaping(Result<AllDishes, Error>) -> Void) {
        request(route: .fetchAllCategories, method: .get, completion: completion)
    }
    
    func myFirstRequest(completion: @escaping(Result<[Dish], Error>) -> Void) {
        request(route: .temp, method: .get, completion: completion)
    }
    
    func placeOrder(dishId: String, name: String, completion: @escaping(Result<order, Error>) -> Void) {
        request(route: .placeOrder(dishId), method: .post, parameters: ["name": name], completion: completion)
    }
    
    func fetchCategoryDishes(categoryId: String, completion: @escaping(Result<[Dish], Error>) -> Void) {
        request(route: .fetchCategoryDishes(categoryId), method: .get, completion: completion)
    }
    
    private func createRequest(route: Route, method: Method, parameters: [String:Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map {
                    URLQueryItem(name: $0, value: "\($1)")
                }
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            
            }
        }
        return urlRequest
    }
    
    private func request<T: Decodable>(route: Route,
                                     method: Method,
                                     parameters: [String:Any]? = nil,
                                     //type: T.Type,
                                     completion: @escaping(Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return }
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            var result: Result<Data,Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
                print("The response is:\(responseString)")
            }
            else if let error = error {
                result = .failure(error)
                //print("The error is: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                //Todo decode data and send
                handleResponse(result: result, completion: completion)
            }
        }.resume()
        
    }
    
    private func handleResponse<T: Decodable>(result: Result<Data,Error>?, completion: (Result<T, Error>) -> Void) {
        
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        switch result {
            
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(ApiResponsec<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            print(response.data as Any)
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
            }
            
            if let decodedData = response.data {
                print(decodedData)
                completion(.success(decodedData))
            }
            else {
                completion(.failure(AppError.unknownError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
