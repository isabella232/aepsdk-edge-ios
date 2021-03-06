//
// Copyright 2020 Adobe. All rights reserved.
// This file is licensed to you under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License. You may obtain a copy
// of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software distributed under
// the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
// OF ANY KIND, either express or implied. See the License for the specific language
// governing permissions and limitations under the License.
//

import UIKit

protocol CartDelegate: AnyObject {
    func remove(cell: ShoppingItemCell)
}

class ShoppingItemCell: UITableViewCell {

    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLbl: UILabel!
    @IBOutlet var productUnitPriceLbl: UILabel!
    @IBOutlet var productQtyLbl: UILabel!
    @IBOutlet var productPriceLbl: UILabel!
    @IBOutlet var deleteProduct: UIButton!

    weak var delegate: CartDelegate?

    func setProduct(product: Product) {

        productImageView.image = UIImage(named: product.productData.imageLarge)
        productNameLbl.text = product.productData.name
        productUnitPriceLbl.text = String(format: "%.2f", product.productData.price)
        productQtyLbl.text = String(Int(product.quantity))
        productPriceLbl.text = String(format: "%.2f", product.subtotal)
    }

    @IBAction func deleteAProduct(_ sender: UIButton) {
        self.delegate?.remove(cell: self)
    }
}
