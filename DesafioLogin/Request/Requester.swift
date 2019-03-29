//
//  Requester.swift
//  DesafioLogin
//
//  Created by Ranieri Aguiar on 29/03/19.
//  Copyright © 2019 Ranieri. All rights reserved.
//

import UIKit

class Requester {
    
    private static var activityIndicator = UIActivityIndicatorView()
    private static var strLabel = UILabel()
    private static let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    private static let url = ""
    
    static func login(_ view: UIViewController, user: RequestLogin, sucess: @escaping () -> Void, fail: @escaping (_ msg: String) -> Void) {
        var request = URLRequest(url: URL(string: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encodeData = try! JSONEncoder().encode(user)
        let stringData = String(data: encodeData, encoding: .utf8)!
        request.httpBody = "{\"udacity\": \(stringData)}".data(using: .utf8)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                if error == nil {
                    let range = (5..<data!.count)
                    let newData = data?.subdata(in: range)
                    let udacitySession = try! JSONDecoder().decode(UdacitySession.self, from: newData!)
                    if udacitySession.error == nil {
                        UserSession.udacitySession = udacitySession
                        sucess()
                    } else {
                        fail(udacitySession.error!)
                    }
                } else {
                    fail(error?.localizedDescription ?? "Erro durante o login!")
                }
                removeActivityIndicator()
            }
        }
        task.resume()
        addActivityIndicator(view)
    }
}
