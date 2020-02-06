//
//  ViewController.swift
//  NetSwift
//
//  Created by 휴빌론 on 06/02/2020.
//  Copyright © 2020 hubilon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
let network: NetworkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
       network.getRequestHTTP(url:"URL" , type:"GET" , completion:{ (success ,response, error) in
            if success {
               /* 네트워크 통신 성공시 코드 */
            }else{
               /* 네트워크 통신 실패시 코드 */
            }
        })
        
        var body : [String:Any] = [String:Any]()
        network.postRequestHTTP(url: "URL", type: "POST", body: body , completion: { (success ,response, error) in
                if success {
                   /* 네트워크 통신 성공시 코드 */
                }else{
                   /* 네트워크 통신 실패시 코드 */
                }
            })
        }

}

