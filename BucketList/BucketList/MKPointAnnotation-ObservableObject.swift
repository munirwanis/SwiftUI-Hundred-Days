//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Munir Wanis on 2020-04-19.
//  Copyright © 2020 Munir Wanis. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        } set {
            self.title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        } set {
            self.subtitle = newValue
        }
    }
}
