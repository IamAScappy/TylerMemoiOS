// MARK: - Mocks generated from file: Source/DataBase/Memo.swift at 2018-09-17 10:22:47 +0000

//
//  Memo.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 15..
//

import Cuckoo
@testable import TyperMemo

import Foundation
import RealmSwift

class MockMemo: Memo, Cuckoo.ClassMock {
    typealias MocksType = Memo
    typealias Stubbing = __StubbingProxy_Memo
    typealias Verification = __VerificationProxy_Memo
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    
    // ["name": "memo_id", "stubType": "ClassToBeStubbedProperty", "@type": "InstanceVariable", "type": "String", "isReadOnly": false, "accessibility": ""]
     override var memo_id: String {
        get {
            
            return cuckoo_manager.getter("memo_id", superclassCall: super.memo_id)
            
        }
        
        set {
            
            cuckoo_manager.setter("memo_id", value: newValue, superclassCall: super.memo_id = newValue)
            
        }
        
    }
    
    // ["name": "text", "stubType": "ClassToBeStubbedProperty", "@type": "InstanceVariable", "type": "String", "isReadOnly": false, "accessibility": ""]
     override var text: String {
        get {
            
            return cuckoo_manager.getter("text", superclassCall: super.text)
            
        }
        
        set {
            
            cuckoo_manager.setter("text", value: newValue, superclassCall: super.text = newValue)
            
        }
        
    }
    
    // ["name": "attr", "stubType": "ClassToBeStubbedProperty", "@type": "InstanceVariable", "type": "MemoAttribute?", "isReadOnly": false, "accessibility": ""]
     override var attr: MemoAttribute? {
        get {
            
            return cuckoo_manager.getter("attr", superclassCall: super.attr)
            
        }
        
        set {
            
            cuckoo_manager.setter("attr", value: newValue, superclassCall: super.attr = newValue)
            
        }
        
    }
    
    // ["name": "colorTheme", "stubType": "ClassToBeStubbedProperty", "@type": "InstanceVariable", "type": "ColorTheme?", "isReadOnly": false, "accessibility": ""]
     override var colorTheme: ColorTheme? {
        get {
            
            return cuckoo_manager.getter("colorTheme", superclassCall: super.colorTheme)
            
        }
        
        set {
            
            cuckoo_manager.setter("colorTheme", value: newValue, superclassCall: super.colorTheme = newValue)
            
        }
        
    }
    
    // ["name": "createAt", "stubType": "ClassToBeStubbedProperty", "@type": "InstanceVariable", "type": "__UnknownType", "isReadOnly": false, "accessibility": ""]
     override var createAt: __UnknownType {
        get {
            
            return cuckoo_manager.getter("createAt", superclassCall: super.createAt)
            
        }
        
        set {
            
            cuckoo_manager.setter("createAt", value: newValue, superclassCall: super.createAt = newValue)
            
        }
        
    }
    

    

    

	struct __StubbingProxy_Memo: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var memo_id: Cuckoo.ClassToBeStubbedProperty<MockMemo, String> {
	        return .init(manager: cuckoo_manager, name: "memo_id")
	    }
	    
	    var text: Cuckoo.ClassToBeStubbedProperty<MockMemo, String> {
	        return .init(manager: cuckoo_manager, name: "text")
	    }
	    
	    var attr: Cuckoo.ClassToBeStubbedProperty<MockMemo, MemoAttribute?> {
	        return .init(manager: cuckoo_manager, name: "attr")
	    }
	    
	    var colorTheme: Cuckoo.ClassToBeStubbedProperty<MockMemo, ColorTheme?> {
	        return .init(manager: cuckoo_manager, name: "colorTheme")
	    }
	    
	    var createAt: Cuckoo.ClassToBeStubbedProperty<MockMemo, __UnknownType> {
	        return .init(manager: cuckoo_manager, name: "createAt")
	    }
	    
	    
	}

	struct __VerificationProxy_Memo: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var memo_id: Cuckoo.VerifyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "memo_id", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var text: Cuckoo.VerifyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "text", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var attr: Cuckoo.VerifyProperty<MemoAttribute?> {
	        return .init(manager: cuckoo_manager, name: "attr", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var colorTheme: Cuckoo.VerifyProperty<ColorTheme?> {
	        return .init(manager: cuckoo_manager, name: "colorTheme", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var createAt: Cuckoo.VerifyProperty<__UnknownType> {
	        return .init(manager: cuckoo_manager, name: "createAt", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}

}

 class MemoStub: Memo {
    
     override var memo_id: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
        set { }
        
    }
    
     override var text: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
        set { }
        
    }
    
     override var attr: MemoAttribute? {
        get {
            return DefaultValueRegistry.defaultValue(for: (MemoAttribute?).self)
        }
        
        set { }
        
    }
    
     override var colorTheme: ColorTheme? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ColorTheme?).self)
        }
        
        set { }
        
    }
    
     override var createAt: __UnknownType {
        get {
            return DefaultValueRegistry.defaultValue(for: (__UnknownType).self)
        }
        
        set { }
        
    }
    

    

    
}


class MockMemoAttribute: MemoAttribute, Cuckoo.ClassMock {
    typealias MocksType = MemoAttribute
    typealias Stubbing = __StubbingProxy_MemoAttribute
    typealias Verification = __VerificationProxy_MemoAttribute
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    
    // ["name": "isPin", "stubType": "ClassToBeStubbedProperty", "@type": "InstanceVariable", "type": "__UnknownType", "isReadOnly": false, "accessibility": ""]
     override var isPin: __UnknownType {
        get {
            
            return cuckoo_manager.getter("isPin", superclassCall: super.isPin)
            
        }
        
        set {
            
            cuckoo_manager.setter("isPin", value: newValue, superclassCall: super.isPin = newValue)
            
        }
        
    }
    

    

    

	struct __StubbingProxy_MemoAttribute: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var isPin: Cuckoo.ClassToBeStubbedProperty<MockMemoAttribute, __UnknownType> {
	        return .init(manager: cuckoo_manager, name: "isPin")
	    }
	    
	    
	}

	struct __VerificationProxy_MemoAttribute: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var isPin: Cuckoo.VerifyProperty<__UnknownType> {
	        return .init(manager: cuckoo_manager, name: "isPin", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}

}

 class MemoAttributeStub: MemoAttribute {
    
     override var isPin: __UnknownType {
        get {
            return DefaultValueRegistry.defaultValue(for: (__UnknownType).self)
        }
        
        set { }
        
    }
    

    

    
}

