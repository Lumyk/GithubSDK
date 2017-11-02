//
//  GHObject.swift
//  GithubSDK
//
//  Created by Evgeny Kalashnikov on 02.11.2017.
//
import Foundation

public class GHObject: NSObject {
    public override var description: String {
        get {
            var result = "\(self.classForCoder)\n"
            Mirror(reflecting: self).children.forEach { (value) in
                if let label = value.label {
                    result += "\(label) - \(value.value)\n"
                }
            }
            return result
        }
    }
    
    public class func date(from string: String?) -> Date? {
        if let string = string {
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
            return dateFormater.date(from: string)
        }
        return nil
    }
}
