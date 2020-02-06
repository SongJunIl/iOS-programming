//
//  NetworkManager.swift
//  NetSwift
//
//  Created by 휴빌론 on 06/02/2020.
//  Copyright © 2020 hubilon. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    func getRequestHTTP(url: String, type: String, parameter: String? = nil, completion: @escaping(Bool,Dictionary<String, Any>?, Error?) -> Void) {
        
         var urlLink = URLComponents()
            if let query = parameter {
                urlLink = URLComponents(string: url + query)!
            }else{
                urlLink = URLComponents(string: url)!
            }

            // 1. 요청 객체 생성
            var request = URLRequest(url: urlLink.url!)
            
            // 2. 요청 방식
            request.httpMethod = type
            // 3. 헤더
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            // 4. Session
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                do {
                    let anyData = try JSONSerialization.jsonObject(with: data!, options: [])
                    guard let dic = anyData as? Dictionary<String,Any> else { return }
                    /* completion 코드 삽입 */
                } catch {
                    /* fail 코드 삽입 */
                }
                
            }
            // 6. 실행
            task.resume()
        }

        func postRequestHTTP(url: String, type: String, body: [String:Any], completion: @escaping(Bool,Dictionary<String, Any>?, Error?) -> Void) {
            guard let url = URL(string: url) else { return }
            
            // 1. 요청 객체 생성
            var request = URLRequest(url: url)
            // 2. 요청 방식
            request.httpMethod = type
            // 3. 헤더
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            // 4.바디에 담아서 보낼 데이터 json 형태로 변환
            let jsonData = try? JSONSerialization.data(withJSONObject: body, options:.prettyPrinted)
            request.httpBody = jsonData
            
            
            // 5. Session
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                do {
                    let anyData = try JSONSerialization.jsonObject(with: data!, options: [])
                    guard let dic = anyData as? Dictionary<String, Any> else { return }
                    /* completion 코드 삽입 */
                } catch {
                    /* fail 코드 삽입 */
                }
            }
            // 6. 실행
            task.resume()
        }
}
