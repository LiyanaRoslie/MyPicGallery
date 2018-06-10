//
//  Service.swift
//  MyPicGallery
//
//  Created by Liyana Roslie on 6/10/18.
//  Copyright © 2018 Liyana Roslie. All rights reserved.
//

import Alamofire
import SwiftyJSON

class Services {
    
    let URL = "http://sd2-hiring.herokuapp.com/api/users"
    var parameters = "?offset=0&limit=5"
    let FORMAT_TYPE:String = "json"
    let JSON_CALLBACK:Int = 1

    
    // MARK:- Service Call
    
    func makeServiceCall(searchText: String) {
        
        Alamofire.request(.GET, URL, parameters:  [String: String])
            .responseJSON { (request, response, data, error) in
                if data != nil {
                    let jsonData:JSON = JSON(data!)
                    let photosDict = jsonData["data"]
                    let photoArray = photosDict["users"]
                    var photos = [Photo]()
                    
                    for item in photoArray  {
                        let userName = item.1["name"].stringValue
                        let userImage = item.1["image"].stringValue
                        //let imageURL = item.1["server"].stringValue
                        let photo = Photo(userName: userName, userImage: userImage)
                        photos.append(photo)
                    }
                } else {
                    println(error)
                }
        }
        
    }
}
