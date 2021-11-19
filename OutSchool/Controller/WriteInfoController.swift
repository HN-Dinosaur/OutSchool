//
//  WriteInfoController.swift
//  OutSchool
//
//  Created by LongDengYu on 2021/11/19.
//

import UIKit

class WriteInfoController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    var stuInfo: StuInfo?
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var stuClass: UITextField!
    @IBOutlet weak var stuNo: UITextField!
    @IBOutlet weak var beginTime: UITextField!
    @IBOutlet weak var endTime: UITextField!
    @IBOutlet weak var readyDisplayImageView: UIImageView!
    @IBAction func selectPhoto(_ sender: Any) {
        let alert = UIAlertController(title: "提示", message: "选择方式添加图片", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "取消", style: .cancel)
        let photoLibrary = UIAlertAction(title: "相册", style: .default) { _ in self.clickPhotoLibrary() }
        let camera = UIAlertAction(title: "相机", style: .default) { _ in self.clickCamera()}
        alert.addAction(cancel)
        alert.addAction(photoLibrary)
        alert.addAction(camera)
        present(alert, animated: true)
        
    }

    func clickCamera(){
        let picker = UIImagePickerController()
        picker.delegate = self
        //打开相机
        picker.sourceType = .camera
        //让页面出现
        present(picker, animated: true)
    }
    func clickPhotoLibrary(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromMemory()
        config()
 
    }
    //存储
    func storeData(){
        do{
            let data = try JSONEncoder().encode(stuInfo)
            UserDefaults.standard.set(data, forKey: "stuInfo")
        }catch{
            print(error)
        }
    }
    func getDataFromMemory(){
        if let data = UserDefaults.standard.data(forKey: "stuInfo"){
            do{
                stuInfo = try JSONDecoder().decode(StuInfo.self, from: data)
            }catch{
                print(error)
            }
        }
    }
    func config(){
        if let accessoryInputView = Bundle.main.loadNibNamed("KeyBoardInputAccessory", owner: nil, options: nil)?.first as? KeyBoardInputAccessory{
            name.inputAccessoryView = accessoryInputView
            stuNo.inputAccessoryView = accessoryInputView
            beginTime.inputAccessoryView = accessoryInputView
            stuClass.inputAccessoryView = accessoryInputView
            endTime.inputAccessoryView = accessoryInputView
            accessoryInputView.doneBtn.addTarget(self, action: #selector(clickFinish), for: .touchUpInside)
        }
        name.delegate = self
        stuClass.delegate = self
        stuNo.delegate = self
        beginTime.delegate = self
        endTime.delegate = self
        if let stuInfo = self.stuInfo{
            name.text = stuInfo.name
            stuClass.text = stuInfo.stuClass
            stuNo.text = stuInfo.stuNo
            beginTime.text = stuInfo.beginTime
            endTime.text = stuInfo.endTime
        }
    }
    @objc func clickFinish(){
        view.endEditing(true)
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //如果是去InfoViewController
        if let infoVC = segue.destination as? InfoViewController{
            //拿到View1，View2，View3
            if let view1 = infoVC.viewArray[0] as? View1,
                let view2 = infoVC.viewArray[1] as? VIew2{
                
                stuInfo = StuInfo(name: name.text, stuClass: stuClass.text, stuNo: stuNo.text, beginTime: beginTime.text, endTime: endTime.text)
                
                infoVC.selfName = stuInfo?.name
                view1.name.text = stuInfo?.name
                view1.stuClass.text = stuInfo?.stuClass
                view1.stuNo.text = stuInfo?.stuNo
                view2.beginTime.text = stuInfo?.beginTime
                view2.endTime.text = stuInfo?.endTime
//                view2.image.image = stuInfo?.image
                
//                infoVC.selfName = name.text
//                view1.name.text = name.text
//                view1.stuClass.text = stuClass.text
//                view1.stuNo.text = stuNo.text
//                view2.beginTime.text = beginTime.text
//                view2.endTime.text = endTime.text
                view2.image.image = readyDisplayImageView.image
                storeData()
                
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            readyDisplayImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    

}
extension WriteInfoController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
