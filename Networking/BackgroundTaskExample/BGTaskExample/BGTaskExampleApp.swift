//
//  BGTaskExampleApp.swift
//  BGTaskExample
//
//  Created by Anmol  Jandaur on 2/14/24.
//

import SwiftUI
import BackgroundTasks

@main
struct BGTaskExampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        schedule()
                    })
                }
        }
    }
    
    private func schedule() {
        BGTaskScheduler.shared.getPendingTaskRequests { requests in
            print("\(requests.count) BGTasks pending...")
            
            guard requests.isEmpty else { return }
        }

        // submit a task to be scheduled
        do {
            let newTask = BGAppRefreshTaskRequest(identifier: taskId)
            // earliest time in which the OS will run the task
            newTask.earliestBeginDate = Date().addingTimeInterval(86400 * 3)
            try BGTaskScheduler.shared.submit(newTask)
            print("Task scheduled")
        } catch {
            // ignore
            print("Failed to schedule: \(error)")
        }
    }
}


let taskId = "jandaur.anmol.BGTaskExample.backgroundTask"


 func handleTask(task: BGAppRefreshTask) {
     let count = UserDefaults.standard.integer(forKey: "task_run_count")
     UserDefaults.standard.set(count+1, forKey: "task_run_count")
     
     task.expirationHandler = {
         // if you make an API call here, you should cancel it here
         // Cancel network call
     }
     
     task.setTaskCompleted(success: true)
}



class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // register handler for task
        BGTaskScheduler.shared.register(forTaskWithIdentifier: taskId, using: nil) { task in
            // Handle the task when its run
            guard let task = task as? BGAppRefreshTask else { return }
            handleTask(task: task)
        }
        
        let count = UserDefaults.standard.integer(forKey: "task_run_count")
        print("Task ran \(count) times")

        
        return true
    }
}
