//
//  NewsTableViewCell.swift
//  MVVMDemo
//
//  Created by 周文杰 on 2017/2/9.
//  Copyright © 2017年 zwj. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: CellViewModel?
    func viewModel(_ newViewModel :CellViewModel) -> Void {
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
