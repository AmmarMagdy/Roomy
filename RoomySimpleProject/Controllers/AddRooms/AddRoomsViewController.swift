//
//  AddRoomsViewController.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 5/2/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import NVActivityIndicatorView

class AddRoomsViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupView()
    }
    @IBAction func done(_ sender: Any) {
        addRoom()
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension AddRoomsViewController {
    private func setupView() {
        addBtn.layer.cornerRadius = addBtn.bounds.height / 2
    }
}
extension AddRoomsViewController {
    private func addRoom() {
        if !titleTextField.text!.isEmpty &&
            !placeTextField.text!.isEmpty &&
            !priceTextField.text!.isEmpty {
            startAnimating()
            Request.requestAPI(router: Router.addRoom(titleTextField.text!, placeTextField.text!, priceTextField.text!, descTextField.text!, "")) { [unowned self](response, statusCode) in
                self.stopAnimating()
                switch response {
                case .success(_):
                    if statusCode == 201 {
                        let alert = UIAlertController(title: "", message: "Room Added Successfully", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                            self.navigationController?.popViewController(animated: true)
                        }))
                        self.present(alert, animated: true)
                    }
                case.failure(let error):
                    Alert.shared.showAlert(title: "Error", message: error.localizedDescription)
                }
            }
        }
    }
}
