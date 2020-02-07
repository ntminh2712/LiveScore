//  
//  asdasdService.swift
//  LiveScore
//
//  Created by MinhNT on 9/27/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation
import Alamofire

class asdasdService: asdasdServiceProtocol {
    // Call protocol function

    func removeThisFuncName(success: @escaping(_ data: asdasdModel) -> (), failure: @escaping() -> ()) {

        let url = ""

        APIManager.request(
            url,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: [:],
            completion: { data in
                
                // mapping data
                do {
                    let decoded = try JSONDecoder().decode(asdasdModel.self, from: data)
                    success()
                } catch _ {
                    failure()
                }
                
        }) { errorMsg, errorCode in
            failure()
        }

    }

}
