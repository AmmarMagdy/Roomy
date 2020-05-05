//
//  HomeViewController.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 3/11/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import NVActivityIndicatorView

class HomeViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var tableView: UITableView!
    
    let homeCellIdentifier = "homeCellIdentifier"
    var roomsModel: [RoomsAPI]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRoom))
        navigationItem.title = "Home"
        tableView.register(UINib(nibName: "HomeTableCell", bundle: nil), forCellReuseIdentifier: homeCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
        getRooms()
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height * 0.2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 5))
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(RoomDetailsViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! HomeTableCell
        cell.loadCellData(roomsModel[indexPath.section])
    }
    
}
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return roomsModel != nil ? roomsModel.count : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: homeCellIdentifier, for: indexPath)
        return cell
    }
}
extension HomeViewController {
    @objc private func addRoom() {
        self.navigationController?.pushViewController(AddRoomsViewController(), animated: true)
    }
}
extension HomeViewController {
    func getRooms() {
        startAnimating()
        Request.requestAPI(router: Router.getAllRooms) { [unowned self](response, _) in
            self.stopAnimating()
            switch response {
            case .success(let result):
                do {
                    self.roomsModel = try JSONDecoder().decode([RoomsAPI].self, from: result)
                    self.tableView.reloadData()
                } catch let error {
                    // Can't parse posts
                    print(error)
                }
            case.failure(let error):
                self.showAlert(title: "Error", message: error.localizedDescription)
                
            }
        }
    }
}
