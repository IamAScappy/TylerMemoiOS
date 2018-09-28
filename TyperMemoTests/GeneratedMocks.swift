// MARK: - Mocks generated from file: Source/Services/LabelServiceType.swift at 2018-09-28 13:53:01 +0000

//
//  LabelServiceType.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 23..
//  Copyright © 2018년 tskim. All rights reserved.

import Cuckoo
@testable import TyperMemo

import Foundation
import RealmSwift
import Result
import RxRealm
import RxSwift
import Then

class MockLabelServiceType: LabelServiceType, Cuckoo.ProtocolMock {
    typealias MocksType = LabelServiceType
    typealias Stubbing = __StubbingProxy_LabelServiceType
    typealias Verification = __VerificationProxy_LabelServiceType
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "searchLabels", "returnSignature": " -> Result<Observable<[Label]>, NSError>", "fullyQualifiedName": "searchLabels(keyword: String) -> Result<Observable<[Label]>, NSError>", "parameterSignature": "keyword: String", "parameterSignatureWithoutNames": "keyword: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "keyword", "call": "keyword: keyword", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("keyword"), name: "keyword", type: "String", range: CountableRange(300..<315), nameRange: CountableRange(300..<307))], "returnType": "Result<Observable<[Label]>, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchLabels(keyword: String)  -> Result<Observable<[Label]>, NSError> {
        
            return cuckoo_manager.call("searchLabels(keyword: String) -> Result<Observable<[Label]>, NSError>",
                parameters: (keyword),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "insertLabel", "returnSignature": " -> Result<String, NSError>", "fullyQualifiedName": "insertLabel(label: Label) -> Result<String, NSError>", "parameterSignature": "label: Label", "parameterSignatureWithoutNames": "label: Label", "inputTypes": "Label", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "label", "call": "label: label", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("label"), name: "label", type: "Label", range: CountableRange(376..<388), nameRange: CountableRange(376..<381))], "returnType": "Result<String, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func insertLabel(label: Label)  -> Result<String, NSError> {
        
            return cuckoo_manager.call("insertLabel(label: Label) -> Result<String, NSError>",
                parameters: (label),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_LabelServiceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchLabels<M1: Cuckoo.Matchable>(keyword: M1) -> Cuckoo.ProtocolStubFunction<(String), Result<Observable<[Label]>, NSError>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: keyword) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLabelServiceType.self, method: "searchLabels(keyword: String) -> Result<Observable<[Label]>, NSError>", parameterMatchers: matchers))
	    }
	    
	    func insertLabel<M1: Cuckoo.Matchable>(label: M1) -> Cuckoo.ProtocolStubFunction<(Label), Result<String, NSError>> where M1.MatchedType == Label {
	        let matchers: [Cuckoo.ParameterMatcher<(Label)>] = [wrap(matchable: label) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLabelServiceType.self, method: "insertLabel(label: Label) -> Result<String, NSError>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_LabelServiceType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func searchLabels<M1: Cuckoo.Matchable>(keyword: M1) -> Cuckoo.__DoNotUse<Result<Observable<[Label]>, NSError>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: keyword) { $0 }]
	        return cuckoo_manager.verify("searchLabels(keyword: String) -> Result<Observable<[Label]>, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func insertLabel<M1: Cuckoo.Matchable>(label: M1) -> Cuckoo.__DoNotUse<Result<String, NSError>> where M1.MatchedType == Label {
	        let matchers: [Cuckoo.ParameterMatcher<(Label)>] = [wrap(matchable: label) { $0 }]
	        return cuckoo_manager.verify("insertLabel(label: Label) -> Result<String, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class LabelServiceTypeStub: LabelServiceType {
    

    

    
     func searchLabels(keyword: String)  -> Result<Observable<[Label]>, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<Observable<[Label]>, NSError>.self)
    }
    
     func insertLabel(label: Label)  -> Result<String, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<String, NSError>.self)
    }
    
}


class MockLabelService: LabelService, Cuckoo.ClassMock {
    typealias MocksType = LabelService
    typealias Stubbing = __StubbingProxy_LabelService
    typealias Verification = __VerificationProxy_LabelService
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "insertLabel", "returnSignature": " -> Result<String, NSError>", "fullyQualifiedName": "insertLabel(label: Label) -> Result<String, NSError>", "parameterSignature": "label: Label", "parameterSignatureWithoutNames": "label: Label", "inputTypes": "Label", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "label", "call": "label: label", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("label"), name: "label", type: "Label", range: CountableRange(478..<490), nameRange: CountableRange(478..<483))], "returnType": "Result<String, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func insertLabel(label: Label)  -> Result<String, NSError> {
        
            return cuckoo_manager.call("insertLabel(label: Label) -> Result<String, NSError>",
                parameters: (label),
                superclassCall:
                    
                    super.insertLabel(label: label)
                    )
        
    }
    
    // ["name": "searchLabels", "returnSignature": " -> Result<Observable<[Label]>, NSError>", "fullyQualifiedName": "searchLabels(keyword: String) -> Result<Observable<[Label]>, NSError>", "parameterSignature": "keyword: String", "parameterSignatureWithoutNames": "keyword: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "keyword", "call": "keyword: keyword", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("keyword"), name: "keyword", type: "String", range: CountableRange(690..<705), nameRange: CountableRange(690..<697))], "returnType": "Result<Observable<[Label]>, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func searchLabels(keyword: String)  -> Result<Observable<[Label]>, NSError> {
        
            return cuckoo_manager.call("searchLabels(keyword: String) -> Result<Observable<[Label]>, NSError>",
                parameters: (keyword),
                superclassCall:
                    
                    super.searchLabels(keyword: keyword)
                    )
        
    }
    

	struct __StubbingProxy_LabelService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func insertLabel<M1: Cuckoo.Matchable>(label: M1) -> Cuckoo.ClassStubFunction<(Label), Result<String, NSError>> where M1.MatchedType == Label {
	        let matchers: [Cuckoo.ParameterMatcher<(Label)>] = [wrap(matchable: label) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLabelService.self, method: "insertLabel(label: Label) -> Result<String, NSError>", parameterMatchers: matchers))
	    }
	    
	    func searchLabels<M1: Cuckoo.Matchable>(keyword: M1) -> Cuckoo.ClassStubFunction<(String), Result<Observable<[Label]>, NSError>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: keyword) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLabelService.self, method: "searchLabels(keyword: String) -> Result<Observable<[Label]>, NSError>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_LabelService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func insertLabel<M1: Cuckoo.Matchable>(label: M1) -> Cuckoo.__DoNotUse<Result<String, NSError>> where M1.MatchedType == Label {
	        let matchers: [Cuckoo.ParameterMatcher<(Label)>] = [wrap(matchable: label) { $0 }]
	        return cuckoo_manager.verify("insertLabel(label: Label) -> Result<String, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func searchLabels<M1: Cuckoo.Matchable>(keyword: M1) -> Cuckoo.__DoNotUse<Result<Observable<[Label]>, NSError>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: keyword) { $0 }]
	        return cuckoo_manager.verify("searchLabels(keyword: String) -> Result<Observable<[Label]>, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class LabelServiceStub: LabelService {
    

    

    
     override func insertLabel(label: Label)  -> Result<String, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<String, NSError>.self)
    }
    
     override func searchLabels(keyword: String)  -> Result<Observable<[Label]>, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<Observable<[Label]>, NSError>.self)
    }
    
}


// MARK: - Mocks generated from file: Source/Services/MemoServiceType.swift at 2018-09-28 13:53:01 +0000

//
//  MemoServiceType.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 23..
//  Copyright © 2018년 tskim. All rights reserved.

import Cuckoo
@testable import TyperMemo

import Foundation

class MockMemoServiceType: MemoServiceType, Cuckoo.ProtocolMock {
    typealias MocksType = MemoServiceType
    typealias Stubbing = __StubbingProxy_MemoServiceType
    typealias Verification = __VerificationProxy_MemoServiceType
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    

	struct __StubbingProxy_MemoServiceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	struct __VerificationProxy_MemoServiceType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	}

}

 class MemoServiceTypeStub: MemoServiceType {
    

    

    
}


class MockMemoService: MemoService, Cuckoo.ClassMock {
    typealias MocksType = MemoService
    typealias Stubbing = __StubbingProxy_MemoService
    typealias Verification = __VerificationProxy_MemoService
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    

	struct __StubbingProxy_MemoService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	struct __VerificationProxy_MemoService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	}

}

 class MemoServiceStub: MemoService {
    

    

    
}


// MARK: - Mocks generated from file: Source/Services/ServiceProvider.swift at 2018-09-28 13:53:01 +0000

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

