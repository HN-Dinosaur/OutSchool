//
//  InfoViewController.swift
//  OutSchool
//
//  Created by LongDengYu on 2021/11/14.
//

import UIKit
import SnapKit
class InfoViewController: UIViewController {
    var isExpanding: [Bool] = [false, false, false]
    var strArray: [String] = ["基本信息","申请信息","审核信息"]
    var viewArray: [UIView] = [
            Bundle.loadNibView(name: "View1", class: UIView.self),
            Bundle.loadNibView(name: "View2", class: UIView.self),
            Bundle.loadNibView(name: "View3", class: UIView.self)
    ]
    let infoTabelView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.backgroundColor = .red
        return imageView
    }()
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var bottomLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTabelView.delegate = self
        infoTabelView.dataSource = self
        mainView.addSubview(infoTabelView)
        infoTabelView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(topView.snp.bottom)
            make.bottom.equalTo(bottomLabel.snp.top)
        }
        infoTabelView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
}
extension InfoViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        tableView.footerView(forSection: indexPath.section)?.bounds.size.height = 0
        isExpanding[indexPath.section] = !isExpanding[indexPath.section]
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
extension InfoViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0.0001
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return viewArray[section].bounds.height
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return viewArray[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = strArray[indexPath.section]
//        cell.accessoryView = UIImageView(image: UIImage(named: "chevronUp"))
//        ce
//        cell.accessoryType = .detailDisclosureButton
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}
extension Bundle{
    static func loadNibView<T>(name: String, class: T.Type) -> T{
        if let view = main.loadNibNamed(name, owner: nil, options: nil)?.first as? T{
            return view
        }
        fatalError("获取BundleView出现问题")
    }
}

