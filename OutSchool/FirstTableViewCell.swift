//
//  FirstTableViewCell.swift
//  OutSchool
//
//  Created by LongDengYu on 2021/11/14.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    let myImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        imageView.backgroundColor = .red
        return imageView
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(myImageView)
        myImageView.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview().offset(5)
        }
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
