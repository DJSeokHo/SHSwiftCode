//
//  AsyncAndAwaitExampleViewController.swift
//  SHSwiftCode
//
//  Created by 浩 SHI on 2022/03/25.
//

import UIKit

class AsyncAndAwaitExampleViewController: UIViewController {

    public static func start(from parentViewController: UIViewController) {
        
        let viewController = StoryboardUtility.findViewControllerFromStoryboard(storyboardName: "AsyncAndAwaitExampleViewController", withClassName: "AsyncAndAwaitExampleViewController") as! AsyncAndAwaitExampleViewController
        
        parentViewController.presentUIViewController(target: viewController, withNavigation: true)
    }
    
    
    var isLightTheme = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        getTest()
//        ThreadTest.test()
        
//        Task {
//            let result = await AsyncAwaitStaticTest.test()
//            Toast.instance.showShortTimeToast(content: "Async Await Test")
//
//            ILog.debug(tag: #file, content: result)
//            ILog.debug(tag: #file, content: "finish \(Thread.current)")
//        }
        
        Task {
            let result = await AsyncAwaitObjectTest().test()
            Toast.instance.showShortTimeToast(content: "Async Await Test")

            ILog.debug(tag: #file, content: result)
            ILog.debug(tag: #file, content: "finish \(Thread.current)")
        }
        
//        Task {
//            let result = await test()
//            Toast.instance.showShortTimeToast(content: "Async Await Test")
//
//            ILog.debug(tag: #file, content: result)
//            ILog.debug(tag: #file, content: "finish \(Thread.current)")
//
//        }
       
    }
    
    func getTest() {
        
        Task {
            ILog.debug(tag: #file, content: "start \(Thread.current)")
            
            let result = await GetTestService.GetTest()
            
            ILog.debug(tag: #file, content: "end \(Thread.current)")
            
            Toast.instance.showShortTimeToast(content: "result \(String(describing: result))")
        }
  
    }
    
    
    @IBAction func onButtonClick(_ sender: Any) {
        
        isLightTheme = !isLightTheme
        
        if isLightTheme {
            view.backgroundColor = UIColor.white
            setStatusBarTheme(isDark: false)
        }
        else {
            view.backgroundColor = UIColor.black
            setStatusBarTheme(isDark: true)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

/*
 MARK: Global functions
 */
func getFileNames() async -> [String] {
    // Use GCD to simulate asnyc background work
    ILog.debug(tag: #file, content: "getFileNames \(Thread.current)")
    sleep(3)
    return ["Doc1.txt", "Doc2.txt", "Doc3.txt"]
}

func getFileContent(for files: [String]) async -> String {
    ILog.debug(tag: #file, content: "getFileContent \(Thread.current)")
    sleep(2)
    return files.joined(separator: "\n")
}

func test() async -> String {
    
    ILog.debug(tag: #file, content: "test \(Thread.current)")
    
    let fileNames = await getFileNames()
    let content = await getFileContent(for: fileNames)
    
    sleep(3)
    
    return content
}
/*
 MARK: Global functions
 */


class AsyncAwaitSingletonTest {
    
    public static let instance = AsyncAwaitSingletonTest()
    
    private init() {}
    
    func getFileNames() async -> [String] {
        // Use GCD to simulate asnyc background work
        ILog.debug(tag: #file, content: "getFileNames \(Thread.current)")
        sleep(3)
        return ["Doc1.txt", "Doc2.txt", "Doc3.txt"]
    }

    func getFileContent(for files: [String]) async -> String {
        ILog.debug(tag: #file, content: "getFileContent \(Thread.current)")
        sleep(2)
        return files.joined(separator: "\n")
    }

    func test() async -> String {
        
        ILog.debug(tag: #file, content: "test \(Thread.current)")
        
        let fileNames = await getFileNames()
        let content = await getFileContent(for: fileNames)
        
        sleep(3)
        
        return content
    }
}

class AsyncAwaitObjectTest {
    // blocking main thread

    func getFileNames() async -> [String] {
        // Use GCD to simulate asnyc background work
        ILog.debug(tag: #file, content: "getFileNames \(Thread.current)")
        sleep(3)
        return ["Doc1.txt", "Doc2.txt", "Doc3.txt"]
    }

    func getFileContent(for files: [String]) async -> String {
        ILog.debug(tag: #file, content: "getFileContent \(Thread.current)")
        sleep(2)
        return files.joined(separator: "\n")
    }

    func test() async -> String {
        
        ILog.debug(tag: #file, content: "test \(Thread.current)")
        
        let fileNames = await getFileNames()
        let content = await getFileContent(for: fileNames)
        
        sleep(3)
        
        return content
    }
}

class AsyncAwaitStaticTest {
    // no blocking main thread
    
    static func getFileNames() async -> [String] {
        // Use GCD to simulate asnyc background work
        ILog.debug(tag: #file, content: "getFileNames \(Thread.current)")
        sleep(3)
        return ["Doc1.txt", "Doc2.txt", "Doc3.txt"]
    }

    static func getFileContent(for files: [String]) async -> String {
        ILog.debug(tag: #file, content: "getFileContent \(Thread.current)")
        sleep(2)
        return files.joined(separator: "\n")
    }

    static func test() async -> String {
        
        ILog.debug(tag: #file, content: "test \(Thread.current)")
        
        let fileNames = await getFileNames()
        let content = await getFileContent(for: fileNames)
        
        sleep(3)
        
        return content
    }
}

class ThreadTest {
    
    public static func test() {
        ThreadTest.instance.test()
    }
    
    public static let instance = ThreadTest()
    
    private init() {}
    
    func getFileNames() -> [String] {
        // Use GCD to simulate asnyc background work
        ILog.debug(tag: #file, content: "getFileNames \(Thread.current)")
        sleep(3)
        return ["Doc1.txt", "Doc2.txt", "Doc3.txt"]
    }

    func getFileContent(for files: [String]) -> String {
        ILog.debug(tag: #file, content: "getFileContent \(Thread.current)")
        sleep(2)
        return files.joined(separator: "\n")
    }

    func test() {
        
        ILog.debug(tag: #file, content: "test \(Thread.current)")
        DispatchQueue.global().async {
            
            let fileNames = self.getFileNames()
            
            let fileContent = self.getFileContent(for: fileNames)
            
            DispatchQueue.main.async {
                ILog.debug(tag: #file, content: fileContent)
                ILog.debug(tag: #file, content: "finish \(Thread.current)")
            }
        }
    }
    
}

class GetTestService {
    
    static func GetTest() async -> String? {
        
        do {
            
            ILog.debug(tag: #file, content: "GetTest \(Thread.current)")
            
            let result1 = try await httpGetTest(delaySeconds: 3)
            ILog.debug(tag: #file, content: "result1 \(String(describing: result1))")
            let result2 = try await httpGetTest(delaySeconds: 5)
            ILog.debug(tag: #file, content: "result2 \(String(describing: result2))")
            
            ILog.debug(tag: #file, content: "GetTest will reture \(Thread.current)")
            
            return "\(String(describing: result1)), \(String(describing: result2))"
            
        } catch {
            ILog.debug(tag: #file, content: error)
            
            return nil
        }
        
    }
    
    static func httpGetTest(delaySeconds: UInt32) async throws -> Data? {
        
        let url = "https://www.onnoffcompany.com/v1/main/keyword"
        
        ILog.debug(tag: #file, content: "httpGetTest start \(Thread.current)")
        
        let data = try await HttpWrapper.requestGet(withUrl: url)
        
        ILog.debug(tag: #file, content: "httpGetTest end \(Thread.current)")
        
        sleep(delaySeconds)
        
        return data
    }
}
