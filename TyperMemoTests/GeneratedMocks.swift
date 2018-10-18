// MARK: - Mocks generated from file: Source/Services/CheckListType.swift at 2018-10-17 05:10:35 +0000

//
//  CheckListType.swift
//  TyperMemo
//
//  Created by tskim on 2018. 10. 9..
//  Copyright © 2018년 tskim. All rights reserved.

import Cuckoo
@testable import TyperMemo

import Foundation
import RealmSwift
import Result
import RxRealm
import RxSwift

class MockCheckListType: CheckListType, Cuckoo.ProtocolMock {
    typealias MocksType = CheckListType
    typealias Stubbing = __StubbingProxy_CheckListType
    typealias Verification = __VerificationProxy_CheckListType
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "insertCheckItem", "returnSignature": " -> Result<Memo, NSError>", "fullyQualifiedName": "insertCheckItem(memo: Memo, checkItem: CheckItem) -> Result<Memo, NSError>", "parameterSignature": "memo: Memo, checkItem: CheckItem", "parameterSignatureWithoutNames": "memo: Memo, checkItem: CheckItem", "inputTypes": "Memo, CheckItem", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "memo, checkItem", "call": "memo: memo, checkItem: checkItem", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("memo"), name: "memo", type: "Memo", range: CountableRange(286..<296), nameRange: CountableRange(286..<290)), CuckooGeneratorFramework.MethodParameter(label: Optional("checkItem"), name: "checkItem", type: "CheckItem", range: CountableRange(298..<318), nameRange: CountableRange(298..<307))], "returnType": "Result<Memo, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func insertCheckItem(memo: Memo, checkItem: CheckItem)  -> Result<Memo, NSError> {
        
            return cuckoo_manager.call("insertCheckItem(memo: Memo, checkItem: CheckItem) -> Result<Memo, NSError>",
                parameters: (memo, checkItem),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_CheckListType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func insertCheckItem<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(memo: M1, checkItem: M2) -> Cuckoo.ProtocolStubFunction<(Memo, CheckItem), Result<Memo, NSError>> where M1.MatchedType == Memo, M2.MatchedType == CheckItem {
	        let matchers: [Cuckoo.ParameterMatcher<(Memo, CheckItem)>] = [wrap(matchable: memo) { $0.0 }, wrap(matchable: checkItem) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCheckListType.self, method: "insertCheckItem(memo: Memo, checkItem: CheckItem) -> Result<Memo, NSError>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_CheckListType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func insertCheckItem<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(memo: M1, checkItem: M2) -> Cuckoo.__DoNotUse<Result<Memo, NSError>> where M1.MatchedType == Memo, M2.MatchedType == CheckItem {
	        let matchers: [Cuckoo.ParameterMatcher<(Memo, CheckItem)>] = [wrap(matchable: memo) { $0.0 }, wrap(matchable: checkItem) { $0.1 }]
	        return cuckoo_manager.verify("insertCheckItem(memo: Memo, checkItem: CheckItem) -> Result<Memo, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class CheckListTypeStub: CheckListType {
    

    

    
     func insertCheckItem(memo: Memo, checkItem: CheckItem)  -> Result<Memo, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<Memo, NSError>.self)
    }
    
}


class MockCheckListService: CheckListService, Cuckoo.ClassMock {
    typealias MocksType = CheckListService
    typealias Stubbing = __StubbingProxy_CheckListService
    typealias Verification = __VerificationProxy_CheckListService
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "insertCheckItem", "returnSignature": " -> Result<Memo, NSError>", "fullyQualifiedName": "insertCheckItem(memo: Memo, checkItem: CheckItem) -> Result<Memo, NSError>", "parameterSignature": "memo: Memo, checkItem: CheckItem", "parameterSignatureWithoutNames": "memo: Memo, checkItem: CheckItem", "inputTypes": "Memo, CheckItem", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "memo, checkItem", "call": "memo: memo, checkItem: checkItem", "parameters": [CuckooGeneratorFramework.MethodParameter(label: Optional("memo"), name: "memo", type: "Memo", range: CountableRange(411..<421), nameRange: CountableRange(411..<415)), CuckooGeneratorFramework.MethodParameter(label: Optional("checkItem"), name: "checkItem", type: "CheckItem", range: CountableRange(423..<443), nameRange: CountableRange(423..<432))], "returnType": "Result<Memo, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func insertCheckItem(memo: Memo, checkItem: CheckItem)  -> Result<Memo, NSError> {
        
            return cuckoo_manager.call("insertCheckItem(memo: Memo, checkItem: CheckItem) -> Result<Memo, NSError>",
                parameters: (memo, checkItem),
                superclassCall:
                    
                    super.insertCheckItem(memo: memo, checkItem: checkItem)
                    )
        
    }
    

	struct __StubbingProxy_CheckListService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func insertCheckItem<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(memo: M1, checkItem: M2) -> Cuckoo.ClassStubFunction<(Memo, CheckItem), Result<Memo, NSError>> where M1.MatchedType == Memo, M2.MatchedType == CheckItem {
	        let matchers: [Cuckoo.ParameterMatcher<(Memo, CheckItem)>] = [wrap(matchable: memo) { $0.0 }, wrap(matchable: checkItem) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCheckListService.self, method: "insertCheckItem(memo: Memo, checkItem: CheckItem) -> Result<Memo, NSError>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_CheckListService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func insertCheckItem<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(memo: M1, checkItem: M2) -> Cuckoo.__DoNotUse<Result<Memo, NSError>> where M1.MatchedType == Memo, M2.MatchedType == CheckItem {
	        let matchers: [Cuckoo.ParameterMatcher<(Memo, CheckItem)>] = [wrap(matchable: memo) { $0.0 }, wrap(matchable: checkItem) { $0.1 }]
	        return cuckoo_manager.verify("insertCheckItem(memo: Memo, checkItem: CheckItem) -> Result<Memo, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class CheckListServiceStub: CheckListService {
    

    

    
     override func insertCheckItem(memo: Memo, checkItem: CheckItem)  -> Result<Memo, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<Memo, NSError>.self)
    }
    
}


// MARK: - Mocks generated from file: Source/Services/ColorThemeType.swift at 2018-10-17 05:10:35 +0000

//
//  ColorThemeType.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 30..
//  Copyright © 2018년 tskim. All rights reserved.

import Cuckoo
@testable import TyperMemo

import Foundation
import RealmSwift
import Result
import RxRealm
import RxSwift

class MockColorThemeType: ColorThemeType, Cuckoo.ProtocolMock {
    typealias MocksType = ColorThemeType
    typealias Stubbing = __StubbingProxy_ColorThemeType
    typealias Verification = __VerificationProxy_ColorThemeType
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "getAllColorTheme", "returnSignature": " -> Result<Observable<[ColorTheme]>, NSError>", "fullyQualifiedName": "getAllColorTheme() -> Result<Observable<[ColorTheme]>, NSError>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Result<Observable<[ColorTheme]>, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getAllColorTheme()  -> Result<Observable<[ColorTheme]>, NSError> {
        
            return cuckoo_manager.call("getAllColorTheme() -> Result<Observable<[ColorTheme]>, NSError>",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_ColorThemeType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getAllColorTheme() -> Cuckoo.ProtocolStubFunction<(), Result<Observable<[ColorTheme]>, NSError>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockColorThemeType.self, method: "getAllColorTheme() -> Result<Observable<[ColorTheme]>, NSError>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_ColorThemeType: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getAllColorTheme() -> Cuckoo.__DoNotUse<Result<Observable<[ColorTheme]>, NSError>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getAllColorTheme() -> Result<Observable<[ColorTheme]>, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class ColorThemeTypeStub: ColorThemeType {
    

    

    
     func getAllColorTheme()  -> Result<Observable<[ColorTheme]>, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<Observable<[ColorTheme]>, NSError>.self)
    }
    
}


class MockColorThemeService: ColorThemeService, Cuckoo.ClassMock {
    typealias MocksType = ColorThemeService
    typealias Stubbing = __StubbingProxy_ColorThemeService
    typealias Verification = __VerificationProxy_ColorThemeService
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "getAllColorTheme", "returnSignature": " -> Result<Observable<[ColorTheme]>, NSError>", "fullyQualifiedName": "getAllColorTheme() -> Result<Observable<[ColorTheme]>, NSError>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Result<Observable<[ColorTheme]>, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func getAllColorTheme()  -> Result<Observable<[ColorTheme]>, NSError> {
        
            return cuckoo_manager.call("getAllColorTheme() -> Result<Observable<[ColorTheme]>, NSError>",
                parameters: (),
                superclassCall:
                    
                    super.getAllColorTheme()
                    )
        
    }
    

	struct __StubbingProxy_ColorThemeService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getAllColorTheme() -> Cuckoo.ClassStubFunction<(), Result<Observable<[ColorTheme]>, NSError>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockColorThemeService.self, method: "getAllColorTheme() -> Result<Observable<[ColorTheme]>, NSError>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_ColorThemeService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getAllColorTheme() -> Cuckoo.__DoNotUse<Result<Observable<[ColorTheme]>, NSError>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getAllColorTheme() -> Result<Observable<[ColorTheme]>, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class ColorThemeServiceStub: ColorThemeService {
    

    

    
     override func getAllColorTheme()  -> Result<Observable<[ColorTheme]>, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<Observable<[ColorTheme]>, NSError>.self)
    }
    
}


// MARK: - Mocks generated from file: Source/Services/LabelServiceType.swift at 2018-10-17 05:10:35 +0000

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

    

    

    

	struct __StubbingProxy_LabelServiceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
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
	
	    
	
	    
	}

}

 class LabelServiceTypeStub: LabelServiceType {
    

    

    
}


class MockLabelService: LabelService, Cuckoo.ClassMock {
    typealias MocksType = LabelService
    typealias Stubbing = __StubbingProxy_LabelService
    typealias Verification = __VerificationProxy_LabelService
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    

	struct __StubbingProxy_LabelService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
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
	
	    
	
	    
	}

}

 class LabelServiceStub: LabelService {
    

    

    
}


// MARK: - Mocks generated from file: Source/Services/MemoServiceType.swift at 2018-10-17 05:10:35 +0000

//
//  MemoServiceType.swift
//  TyperMemo
//
//  Created by tskim on 2018. 9. 23..
//  Copyright © 2018년 tskim. All rights reserved.

import Cuckoo
@testable import TyperMemo

import Foundation
import RealmSwift
import Result
import RxSwift

class MockMemoServiceType: MemoServiceType, Cuckoo.ProtocolMock {
    typealias MocksType = MemoServiceType
    typealias Stubbing = __StubbingProxy_MemoServiceType
    typealias Verification = __VerificationProxy_MemoServiceType
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "getMemoOrDefault", "returnSignature": " -> Result<Observable<Memo>, NSError>", "fullyQualifiedName": "getMemoOrDefault(_: Memo) -> Result<Observable<Memo>, NSError>", "parameterSignature": "_ defaultMemo: Memo", "parameterSignatureWithoutNames": "defaultMemo: Memo", "inputTypes": "Memo", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "defaultMemo", "call": "defaultMemo", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "defaultMemo", type: "Memo", range: CountableRange(276..<295), nameRange: CountableRange(0..<0))], "returnType": "Result<Observable<Memo>, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func getMemoOrDefault(_ defaultMemo: Memo)  -> Result<Observable<Memo>, NSError> {
        
            return cuckoo_manager.call("getMemoOrDefault(_: Memo) -> Result<Observable<Memo>, NSError>",
                parameters: (defaultMemo),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "searchMemos", "returnSignature": " -> Result<Observable<[Memo]>, NSError>", "fullyQualifiedName": "searchMemos(_: String) -> Result<Observable<[Memo]>, NSError>", "parameterSignature": "_ keyword: String", "parameterSignatureWithoutNames": "keyword: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "keyword", "call": "keyword", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "keyword", type: "String", range: CountableRange(353..<370), nameRange: CountableRange(0..<0))], "returnType": "Result<Observable<[Memo]>, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func searchMemos(_ keyword: String)  -> Result<Observable<[Memo]>, NSError> {
        
            return cuckoo_manager.call("searchMemos(_: String) -> Result<Observable<[Memo]>, NSError>",
                parameters: (keyword),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "insertMemo", "returnSignature": " -> Result<String, NSError>", "fullyQualifiedName": "insertMemo(_: Memo) -> Result<String, NSError>", "parameterSignature": "_ memo: Memo", "parameterSignatureWithoutNames": "memo: Memo", "inputTypes": "Memo", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "memo", "call": "memo", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "memo", type: "Memo", range: CountableRange(429..<441), nameRange: CountableRange(0..<0))], "returnType": "Result<String, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func insertMemo(_ memo: Memo)  -> Result<String, NSError> {
        
            return cuckoo_manager.call("insertMemo(_: Memo) -> Result<String, NSError>",
                parameters: (memo),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    
    // ["name": "insertMemos", "returnSignature": " -> Result<[String], NSError>", "fullyQualifiedName": "insertMemos(_: [Memo]) -> Result<[String], NSError>", "parameterSignature": "_ memos: [Memo]", "parameterSignatureWithoutNames": "memos: [Memo]", "inputTypes": "[Memo]", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "memos", "call": "memos", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "memos", type: "[Memo]", range: CountableRange(489..<504), nameRange: CountableRange(0..<0))], "returnType": "Result<[String], NSError>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func insertMemos(_ memos: [Memo])  -> Result<[String], NSError> {
        
            return cuckoo_manager.call("insertMemos(_: [Memo]) -> Result<[String], NSError>",
                parameters: (memos),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_MemoServiceType: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getMemoOrDefault<M1: Cuckoo.Matchable>(_ defaultMemo: M1) -> Cuckoo.ProtocolStubFunction<(Memo), Result<Observable<Memo>, NSError>> where M1.MatchedType == Memo {
	        let matchers: [Cuckoo.ParameterMatcher<(Memo)>] = [wrap(matchable: defaultMemo) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMemoServiceType.self, method: "getMemoOrDefault(_: Memo) -> Result<Observable<Memo>, NSError>", parameterMatchers: matchers))
	    }
	    
	    func searchMemos<M1: Cuckoo.Matchable>(_ keyword: M1) -> Cuckoo.ProtocolStubFunction<(String), Result<Observable<[Memo]>, NSError>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: keyword) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMemoServiceType.self, method: "searchMemos(_: String) -> Result<Observable<[Memo]>, NSError>", parameterMatchers: matchers))
	    }
	    
	    func insertMemo<M1: Cuckoo.Matchable>(_ memo: M1) -> Cuckoo.ProtocolStubFunction<(Memo), Result<String, NSError>> where M1.MatchedType == Memo {
	        let matchers: [Cuckoo.ParameterMatcher<(Memo)>] = [wrap(matchable: memo) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMemoServiceType.self, method: "insertMemo(_: Memo) -> Result<String, NSError>", parameterMatchers: matchers))
	    }
	    
	    func insertMemos<M1: Cuckoo.Matchable>(_ memos: M1) -> Cuckoo.ProtocolStubFunction<([Memo]), Result<[String], NSError>> where M1.MatchedType == [Memo] {
	        let matchers: [Cuckoo.ParameterMatcher<([Memo])>] = [wrap(matchable: memos) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMemoServiceType.self, method: "insertMemos(_: [Memo]) -> Result<[String], NSError>", parameterMatchers: matchers))
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
	
	    
	
	    
	    @discardableResult
	    func getMemoOrDefault<M1: Cuckoo.Matchable>(_ defaultMemo: M1) -> Cuckoo.__DoNotUse<Result<Observable<Memo>, NSError>> where M1.MatchedType == Memo {
	        let matchers: [Cuckoo.ParameterMatcher<(Memo)>] = [wrap(matchable: defaultMemo) { $0 }]
	        return cuckoo_manager.verify("getMemoOrDefault(_: Memo) -> Result<Observable<Memo>, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func searchMemos<M1: Cuckoo.Matchable>(_ keyword: M1) -> Cuckoo.__DoNotUse<Result<Observable<[Memo]>, NSError>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: keyword) { $0 }]
	        return cuckoo_manager.verify("searchMemos(_: String) -> Result<Observable<[Memo]>, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func insertMemo<M1: Cuckoo.Matchable>(_ memo: M1) -> Cuckoo.__DoNotUse<Result<String, NSError>> where M1.MatchedType == Memo {
	        let matchers: [Cuckoo.ParameterMatcher<(Memo)>] = [wrap(matchable: memo) { $0 }]
	        return cuckoo_manager.verify("insertMemo(_: Memo) -> Result<String, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func insertMemos<M1: Cuckoo.Matchable>(_ memos: M1) -> Cuckoo.__DoNotUse<Result<[String], NSError>> where M1.MatchedType == [Memo] {
	        let matchers: [Cuckoo.ParameterMatcher<([Memo])>] = [wrap(matchable: memos) { $0 }]
	        return cuckoo_manager.verify("insertMemos(_: [Memo]) -> Result<[String], NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MemoServiceTypeStub: MemoServiceType {
    

    

    
     func getMemoOrDefault(_ defaultMemo: Memo)  -> Result<Observable<Memo>, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<Observable<Memo>, NSError>.self)
    }
    
     func searchMemos(_ keyword: String)  -> Result<Observable<[Memo]>, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<Observable<[Memo]>, NSError>.self)
    }
    
     func insertMemo(_ memo: Memo)  -> Result<String, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<String, NSError>.self)
    }
    
     func insertMemos(_ memos: [Memo])  -> Result<[String], NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<[String], NSError>.self)
    }
    
}


class MockMemoService: MemoService, Cuckoo.ClassMock {
    typealias MocksType = MemoService
    typealias Stubbing = __StubbingProxy_MemoService
    typealias Verification = __VerificationProxy_MemoService
    let cuckoo_manager = Cuckoo.MockManager(hasParent: true)

    

    

    
    // ["name": "insertMemos", "returnSignature": " -> Result<[String], NSError>", "fullyQualifiedName": "insertMemos(_: [Memo]) -> Result<[String], NSError>", "parameterSignature": "_ memos: [Memo]", "parameterSignatureWithoutNames": "memos: [Memo]", "inputTypes": "[Memo]", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "memos", "call": "memos", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "memos", type: "[Memo]", range: CountableRange(594..<609), nameRange: CountableRange(0..<0))], "returnType": "Result<[String], NSError>", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func insertMemos(_ memos: [Memo])  -> Result<[String], NSError> {
        
            return cuckoo_manager.call("insertMemos(_: [Memo]) -> Result<[String], NSError>",
                parameters: (memos),
                superclassCall:
                    
                    super.insertMemos(memos)
                    )
        
    }
    
    // ["name": "insertMemo", "returnSignature": " -> Result<String, NSError>", "fullyQualifiedName": "insertMemo(_: Memo) -> Result<String, NSError>", "parameterSignature": "_ memo: Memo", "parameterSignatureWithoutNames": "memo: Memo", "inputTypes": "Memo", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "memo", "call": "memo", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "memo", type: "Memo", range: CountableRange(820..<832), nameRange: CountableRange(0..<0))], "returnType": "Result<String, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func insertMemo(_ memo: Memo)  -> Result<String, NSError> {
        
            return cuckoo_manager.call("insertMemo(_: Memo) -> Result<String, NSError>",
                parameters: (memo),
                superclassCall:
                    
                    super.insertMemo(memo)
                    )
        
    }
    
    // ["name": "getMemoOrDefault", "returnSignature": " -> Result<Observable<Memo>, NSError>", "fullyQualifiedName": "getMemoOrDefault(_: Memo) -> Result<Observable<Memo>, NSError>", "parameterSignature": "_ defaultMemo: Memo", "parameterSignatureWithoutNames": "defaultMemo: Memo", "inputTypes": "Memo", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "defaultMemo", "call": "defaultMemo", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "defaultMemo", type: "Memo", range: CountableRange(1033..<1052), nameRange: CountableRange(0..<0))], "returnType": "Result<Observable<Memo>, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func getMemoOrDefault(_ defaultMemo: Memo)  -> Result<Observable<Memo>, NSError> {
        
            return cuckoo_manager.call("getMemoOrDefault(_: Memo) -> Result<Observable<Memo>, NSError>",
                parameters: (defaultMemo),
                superclassCall:
                    
                    super.getMemoOrDefault(defaultMemo)
                    )
        
    }
    
    // ["name": "searchMemos", "returnSignature": " -> Result<Observable<[Memo]>, NSError>", "fullyQualifiedName": "searchMemos(_: String) -> Result<Observable<[Memo]>, NSError>", "parameterSignature": "_ keyword: String", "parameterSignatureWithoutNames": "keyword: String", "inputTypes": "String", "isThrowing": false, "isInit": false, "isOverriding": true, "hasClosureParams": false, "@type": "ClassMethod", "accessibility": "", "parameterNames": "keyword", "call": "keyword", "parameters": [CuckooGeneratorFramework.MethodParameter(label: nil, name: "keyword", type: "String", range: CountableRange(1687..<1704), nameRange: CountableRange(0..<0))], "returnType": "Result<Observable<[Memo]>, NSError>", "isOptional": false, "stubFunction": "Cuckoo.ClassStubFunction"]
     override func searchMemos(_ keyword: String)  -> Result<Observable<[Memo]>, NSError> {
        
            return cuckoo_manager.call("searchMemos(_: String) -> Result<Observable<[Memo]>, NSError>",
                parameters: (keyword),
                superclassCall:
                    
                    super.searchMemos(keyword)
                    )
        
    }
    

	struct __StubbingProxy_MemoService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func insertMemos<M1: Cuckoo.Matchable>(_ memos: M1) -> Cuckoo.ClassStubFunction<([Memo]), Result<[String], NSError>> where M1.MatchedType == [Memo] {
	        let matchers: [Cuckoo.ParameterMatcher<([Memo])>] = [wrap(matchable: memos) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMemoService.self, method: "insertMemos(_: [Memo]) -> Result<[String], NSError>", parameterMatchers: matchers))
	    }
	    
	    func insertMemo<M1: Cuckoo.Matchable>(_ memo: M1) -> Cuckoo.ClassStubFunction<(Memo), Result<String, NSError>> where M1.MatchedType == Memo {
	        let matchers: [Cuckoo.ParameterMatcher<(Memo)>] = [wrap(matchable: memo) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMemoService.self, method: "insertMemo(_: Memo) -> Result<String, NSError>", parameterMatchers: matchers))
	    }
	    
	    func getMemoOrDefault<M1: Cuckoo.Matchable>(_ defaultMemo: M1) -> Cuckoo.ClassStubFunction<(Memo), Result<Observable<Memo>, NSError>> where M1.MatchedType == Memo {
	        let matchers: [Cuckoo.ParameterMatcher<(Memo)>] = [wrap(matchable: defaultMemo) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMemoService.self, method: "getMemoOrDefault(_: Memo) -> Result<Observable<Memo>, NSError>", parameterMatchers: matchers))
	    }
	    
	    func searchMemos<M1: Cuckoo.Matchable>(_ keyword: M1) -> Cuckoo.ClassStubFunction<(String), Result<Observable<[Memo]>, NSError>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: keyword) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMemoService.self, method: "searchMemos(_: String) -> Result<Observable<[Memo]>, NSError>", parameterMatchers: matchers))
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
	
	    
	
	    
	    @discardableResult
	    func insertMemos<M1: Cuckoo.Matchable>(_ memos: M1) -> Cuckoo.__DoNotUse<Result<[String], NSError>> where M1.MatchedType == [Memo] {
	        let matchers: [Cuckoo.ParameterMatcher<([Memo])>] = [wrap(matchable: memos) { $0 }]
	        return cuckoo_manager.verify("insertMemos(_: [Memo]) -> Result<[String], NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func insertMemo<M1: Cuckoo.Matchable>(_ memo: M1) -> Cuckoo.__DoNotUse<Result<String, NSError>> where M1.MatchedType == Memo {
	        let matchers: [Cuckoo.ParameterMatcher<(Memo)>] = [wrap(matchable: memo) { $0 }]
	        return cuckoo_manager.verify("insertMemo(_: Memo) -> Result<String, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getMemoOrDefault<M1: Cuckoo.Matchable>(_ defaultMemo: M1) -> Cuckoo.__DoNotUse<Result<Observable<Memo>, NSError>> where M1.MatchedType == Memo {
	        let matchers: [Cuckoo.ParameterMatcher<(Memo)>] = [wrap(matchable: defaultMemo) { $0 }]
	        return cuckoo_manager.verify("getMemoOrDefault(_: Memo) -> Result<Observable<Memo>, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func searchMemos<M1: Cuckoo.Matchable>(_ keyword: M1) -> Cuckoo.__DoNotUse<Result<Observable<[Memo]>, NSError>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: keyword) { $0 }]
	        return cuckoo_manager.verify("searchMemos(_: String) -> Result<Observable<[Memo]>, NSError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class MemoServiceStub: MemoService {
    

    

    
     override func insertMemos(_ memos: [Memo])  -> Result<[String], NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<[String], NSError>.self)
    }
    
     override func insertMemo(_ memo: Memo)  -> Result<String, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<String, NSError>.self)
    }
    
     override func getMemoOrDefault(_ defaultMemo: Memo)  -> Result<Observable<Memo>, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<Observable<Memo>, NSError>.self)
    }
    
     override func searchMemos(_ keyword: String)  -> Result<Observable<[Memo]>, NSError> {
        return DefaultValueRegistry.defaultValue(for: Result<Observable<[Memo]>, NSError>.self)
    }
    
}


// MARK: - Mocks generated from file: Source/Services/ServiceProvider.swift at 2018-10-17 05:10:35 +0000

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

