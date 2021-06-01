//
//  LoginViewController.swift
//  lesson1g3
//
//  Created by Сергей Беляков on 31.05.2021.
//

import UIKit
import Alamofire
import WebKit

class LoginViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var loginPage: WKWebView! {
        didSet{
            loginPage.navigationDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        login()
    }
    
    func login() {
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "oauth.vk.com"
                urlComponents.path = "/authorize"
                urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: "7867643"),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "friends"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "v", value: "5.68")
                ]
                
                let request = URLRequest(url: urlComponents.url!)
                
        loginPage.load(request)
    }

}

extension LoginViewController {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        print("TOKEN")
        print(token as Any)
        
        if let token = token, !token.isEmpty {
            UserDefaults.standard.setValue(token, forKey: "vkToken")
            Session.shared.token = token
            
            performSegue(withIdentifier: "fromLoginPageToMainMenuSegue", sender: self)
        }
        decisionHandler(.cancel)
        
        getData(by: "friends.get")
        getPhoto()
        getData(by: "groups.get")
        getGroup(byName: "MDK")
        
        
        
        

    }
    
     func getData(by method: String){
       let baseUrl = "https://api.vk.com/method/"
       let token = Session.shared.token
       let parameters: Parameters = [
         "access_token": token,
         "v": "5.131"]
       let path = method
       let url = baseUrl + path
       AF.request(url, parameters: parameters).responseJSON {
         response in
        print("\n\n________________")
        print(method + ": ")
        print(response.value as Any)
       }
     }
    
    func getPhoto() {
      let baseUrl = "https://api.vk.com/method/"
      let token = Session.shared.token
      let parameters: Parameters = [
        "access_token": token,
        "v": "5.77"]
      let path = "photos.getAll"
      let url = baseUrl + path
      AF.request(url, parameters: parameters).responseJSON {
        response in
        print("\n\n________________")
        print("getPhoto: ")
        print(response.value as Any)
      }
    }
    
    func getGroup(byName name: String) {
      let baseUrl = "https://api.vk.com/method/"
      let token = Session.shared.token
      let parameters: Parameters = [
        "q": name,
        "count": 10,
        "access_token": token,
        "v": "5.54"]
      let path = "groups.search"
      let url = baseUrl + path
      AF.request(url, parameters: parameters).responseJSON {
        response in
        print("\n\n________________")
        print(name + ": ")
        print(response.value as Any)
      }
    }
}
