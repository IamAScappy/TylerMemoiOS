// MARK: - Mocks generated from file: Source/Services/ServiceProvider.swift at 2018-09-24 13:42:39 +0000

//
//  ServiceProvider.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 23..
//  Copyright © 2018년 tskim. All rights reserved.

import Cuckoo
@testable import TyperMemo

import Foundation

class MockServiceProviderType: ServiceProviderType, Cuckoo.ProtocolMock {
    typealias MocksType = ServiceProviderType
    typealias Stubbing = __StubbingProxy_ServiceProviderType
    typealias Verification = __VerificationProxy_ServiceProviderType
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    
    // ["name": "memoService", "stubType": "ProtocolToBeStubbedReadOnlyProperty", "@type": "InstanceVariable", "type": "MemoServiceType", "isReadOnly": true, "accessibility": ""]
     var memoService: MemoServiceType {
        get {
            
            return cuckoo_manager.getter("memoService", superclassCall: Cuckoo.MockManager.crashOnProtocolSuperclassCall())
            
        }
        
    }
    
    // ["name": "labelService", "stubType": "ProtocolToBeStubbedReadOnlyProperty", "@type": "InstanceVariable", "type": "LabelServiceType", "isReadOnly": true, "accessibility": ""]
     var labelService: LabelServiceType {
        get {
            
            return cuckoo_manager.getter("labelService", superclassCall: Cuckoo.MockManager.crashOnProtocolSuperclassCall())
            
        }
        
    }
    

    

    

	struct __StubbingProxy_ServiceProviderType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var memoService: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockServiceProviderType, MemoServiceType> {
	        return .init(manager: cuckoo_manager, name: "memoService")
	    }
	    
	    var labelService: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockServiceProviderType, LabelServiceType> {
	        return .init(manager: cuckoo_manager, name: "labelService")
	    }
	    
	    
	}

	struct __VerificationProxy_ServiceProviderType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var memoService: Cuckoo.VerifyReadOnlyProperty<MemoServiceType> {
	        return .init(manager: cuckoo_manager, name: "memoService", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var labelService: Cuckoo.VerifyReadOnlyProperty<LabelServiceType> {
	        return .init(manager: cuckoo_manager, name: "labelService", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}

}

 class ServiceProviderTypeStub: ServiceProviderType {
    
     var memoService: MemoServiceType {
        get {
            return DefaultValueRegistry.defaultValue(for: (MemoServiceType).self)
        }
        
    }
    
     var labelService: LabelServiceType {
        get {
            return DefaultValueRegistry.defaultValue(for: (LabelServiceType).self)
        }
        
    }
    

    

    
}


class MockServiceProvider: ServiceProvider, Cuckoo.ClassMock {
    typealias MocksType = ServiceProvider
    typealias Stubbing = __StubbingProxy_ServiceProvider
    typealias Verification = __VerificationProxy_ServiceProvider
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    
    // ["name": "memoService", "stubType": "ClassToBeStubbedProperty", "@type": "InstanceVariable", "type": "MemoServiceType", "isReadOnly": false, "accessibility": ""]
     override var memoService: MemoServiceType {
        get {
            
            return cuckoo_manager.getter("memoService", superclassCall: super.memoService)
            
        }
        
        set {
            
            cuckoo_manager.setter("memoService", value: newValue, superclassCall: super.memoService = newValue)
            
        }
        
    }
    
    // ["name": "labelService", "stubType": "ClassToBeStubbedProperty", "@type": "InstanceVariable", "type": "LabelServiceType", "isReadOnly": false, "accessibility": ""]
     override var labelService: LabelServiceType {
        get {
            
            return cuckoo_manager.getter("labelService", superclassCall: super.labelService)
            
        }
        
        set {
            
            cuckoo_manager.setter("labelService", value: newValue, superclassCall: super.labelService = newValue)
            
        }
        
    }
    

    

    

	struct __StubbingProxy_ServiceProvider: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    var memoService: Cuckoo.ClassToBeStubbedProperty<MockServiceProvider, MemoServiceType> {
	        return .init(manager: cuckoo_manager, name: "memoService")
	    }
	    
	    var labelService: Cuckoo.ClassToBeStubbedProperty<MockServiceProvider, LabelServiceType> {
	        return .init(manager: cuckoo_manager, name: "labelService")
	    }
	    
	    
	}

	struct __VerificationProxy_ServiceProvider: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    var memoService: Cuckoo.VerifyProperty<MemoServiceType> {
	        return .init(manager: cuckoo_manager, name: "memoService", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    var labelService: Cuckoo.VerifyProperty<LabelServiceType> {
	        return .init(manager: cuckoo_manager, name: "labelService", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}

}

 class ServiceProviderStub: ServiceProvider {
    
     override var memoService: MemoServiceType {
        get {
            return DefaultValueRegistry.defaultValue(for: (MemoServiceType).self)
        }
        
        set { }
        
    }
    
     override var labelService: LabelServiceType {
        get {
            return DefaultValueRegistry.defaultValue(for: (LabelServiceType).self)
        }
        
        set { }
        
    }
    

    

    
}

