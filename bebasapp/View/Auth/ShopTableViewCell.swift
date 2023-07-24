//
//  ShopTableViewCell.swift
//  bebasapp
//
//  Created by Agnes Triselia Yudia on 06/07/23.
//

import UIKit
import SDWebImage

class ShopTableViewCell: UITableViewCell {

    @IBOutlet weak var shopImageView: UIImageView! {
        didSet {
            print("didset shopImageView")
            shopImageView.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var shopNameLabel: UILabel!
    
    @IBOutlet weak var shopPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //
    func setImage(url: String) {
        
        print("set image")
        guard let url = URL(string: url) else {
            print("url not valid")
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
//                print(error)
                return
            }
            
            guard let data = data else {
                print("data is nil")
                return
            }
            
            // Set image on main thread
            DispatchQueue.main.async { [weak self] in
                self?.shopImageView.image = UIImage(data: data)
                print("set image success")
            }
        }
        
        task.resume()
    }
    
    func setImageWithPlugin(url: String) {
        
        let urlImage = URL(string: url)
        shopImageView.sd_setImage(with: urlImage)
    }
    
}
