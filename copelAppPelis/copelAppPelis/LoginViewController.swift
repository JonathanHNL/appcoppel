//
//  LoginViewController.swift
//  copelAppPelis
//
//  Created by Johnne Lemand on 25/02/23.
//

import UIKit


struct UserAuth: Codable {
    let username, password, requestToken: String

    enum CodingKeys: String, CodingKey {
        case username, password
        case requestToken = "request_token"
    }
}



class LoginViewController: UIViewController {

    //indicador de cargando la data
    var activityView: UIActivityIndicatorView?
    
    //campos text
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }
    
    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
    //Alerta de advertencia
    func alertaMensaje(msj:String){
        let alerta = UIAlertController(title: "ERROR", message: msj, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
        present(alerta, animated: true, completion: nil)
    }
    

    @IBAction func loginButton(_ sender: UIButton) {
    
    
        let user = usernameTextField.text!
        let pass = passTextField.text!
    
        if user.count == 0 || pass.count == 0 {
            self.alertaMensaje(msj: "Introduce usuario y contraseña")}
        
        showActivityIndicator()
        
        postMethod(username: "\(usernameTextField.text!)", pass: "\(passTextField.text!)")
    }
    func postMethod(username: String, pass: String){
        let url = URL(string: "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=<<api_key>>")!
        var request = URLRequest(url: url)
        
        request.setValue(
            "762775066f9e29c9c7b8daa10401b028",
            forHTTPHeaderField: "Authorization"
        )
        
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        request.setValue("762775066f9e29c9c7b8daa10401b028", forHTTPHeaderField: "api-key")
        
        var components = URLComponents()
        
        components.queryItems = [
            URLQueryItem(name: "username", value: "\(username)"),
            URLQueryItem(name: "pass", value: "\(pass)")
        ]
        
        let body = ["username": "\(username)",
                    "pass":"\(pass)"]
        
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )
        
        request.httpMethod = "POST"
        request.httpBody = bodyData
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                print("Debug: error \(error) \(error.localizedDescription)")
            } else if let data = data {
                print("Debug: data \(data)")
                
                let str = String(decoding: data, as: UTF8.self)
                print("Debug: str \(str)")
                let decoder = JSONDecoder()
                do {
                    let dataDecodificada = try decoder.decode(UserAuth.self, from: data)
                    print("Debug: dataDecodificada \(dataDecodificada)")
                    print("Debug: username \(dataDecodificada.username)")
                    print("Debug: password \(dataDecodificada.password)")
                    
                    DispatchQueue.main.async {
                        self.mostrarAlerta(titulo: "Inicio de sesión", mensaje: "Exitoso")
                        
                        //self.mostrarAlerta(titulo: "Data", mensaje: "\(dataDecodificada)")
                        
                        self.hideActivityIndicator()
                    }
                    
                } catch {
                    print("Debug: error al decodificar la data \(error.localizedDescription)")
                }
                
            } else {
                // Handle unexpected error
            }
        }
        task.resume()
    }
    
    func mostrarAlerta(titulo: String, mensaje: String) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let accionAceptar = UIAlertAction(title: "OK", style: .default) { _ in
            //Do something
            self.performSegue(withIdentifier: "login", sender: self)
        }
        alerta.addAction(accionAceptar)
        present(alerta, animated: true)
    }

}
