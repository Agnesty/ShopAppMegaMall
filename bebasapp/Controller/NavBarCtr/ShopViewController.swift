//
//  ShopViewController.swift
//  bebasapp
//
//  Created by Agnes Triselia Yudia on 06/07/23.
//

import UIKit

class ShopViewController: UIViewController {

    let dummyData = DummyData().productDummy
    
    @IBOutlet weak var shopTableView: UITableView! {
        didSet {
            shopTableView.delegate = self
            shopTableView.dataSource = self
            shopTableView.register(UINib(nibName: "ShopTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }

}

extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = shopTableView.dequeueReusableCell(withIdentifier: "cell") as? ShopTableViewCell else {
            return UITableViewCell()
        }
        
        let model = dummyData[indexPath.row]
//        cell.setImage(url: model.gambar)
        cell.setImageWithPlugin(url: model.gambar)
        cell.shopNameLabel.text = model.namaProduk
        cell.shopPriceLabel.text = String(model.harga)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
}
