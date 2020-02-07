//  
//  dasdasdServiceProtocol.swift
//  LiveScore
//
//  Created by MinhNT on 9/27/19.
//  Copyright © 2019 MinhNT. All rights reserved.
//

import Foundation

protocol dasdasdServiceProtocol {

    /// SAMPLE FUNCTION -* Please rename this function to your real function
    ///
    /// - Parameters:
    ///   - success: -- success closure response, add your Model on this closure.
    ///                 example: success(_ data: YourModelName) -> ()
    ///   - failure: -- failure closure response, add your Model on this closure.  
    ///                 example: success(_ data: APIError) -> ()
    func removeThisFuncName(success: @escaping(_ data: dasdasdModel) -> (), failure: @escaping() -> ())

}
