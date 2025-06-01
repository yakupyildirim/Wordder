//
//  Setting.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 17.01.2024.
//

import SwiftUI
import CoreData

struct Setting: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Settings.language, ascending: true)],
      animation: .default)
    private var settings: FetchedResults<Settings>
    
    
    @State var isDarkModeEnabled: Bool = true
    @State var downloadViaWifiEnabled: Bool = false
    @State private var languageIndex =  UserDefaults.standard.integer(forKey: "Language")
    
    
    var body: some View {
        

            
            NavigationView {
      
                Form {
                    
                    /*
                     Group {
                     HStack{
                     Spacer()
                     VStack {
                     // Image(uiImage: UIImage(named: "UserProfile")!)
                     //     .resizable()
                     //     .frame(width:100, height: 100, alignment: .center)
                     Text("Jacob")
                     .font(.title)
                     Text("jacob.tv")
                     .font(.subheadline)
                     .foregroundColor(.gray)
                     Spacer()
                     Button(action: {
                     print("Edit Profile tapped")
                     }) {
                     Text("Edit Profile")
                     .frame(minWidth: 0, maxWidth: .infinity)
                     .font(.system(size: 18))
                     .padding()
                     .foregroundColor(.white)
                     .overlay(
                     RoundedRectangle(cornerRadius: 25)
                     .stroke(Color.white, lineWidth: 2)
                     )
                     }
                     .background(Color.blue)
                     .cornerRadius(25)
                     }
                     Spacer()
                     }
                     }
                     */
                    
                    Section(header: Text("PREFRENCES"), content: {
                        HStack{
                            //Image(uiImage: UIImage(named: "Language")!)
                            Picker(selection: $languageIndex, label: Text("Language")) {
                                /*
                                ForEach(ConstModels.languageOptions.sorted(by: <), id: \.key) { key, value in
                                    Text(value)
                                }
                                */
                                
                                ForEach(0 ..< ConstModels.languageOptions.count) {
                                    Text(ConstModels.languageOptions[$0])
                                }
                                
          
                                
                                
                                
                            }.onSubmit() {
                                UserDefaults.standard.set(languageIndex, forKey: "Language")
                            }
                        }
                        /*
                         HStack{
                         //Image(uiImage: UIImage(named: "DarkMode")!)
                         Toggle(isOn: $isDarkModeEnabled) {
                         Text("Dark Mode")
                         }
                         }
                         */
                    })
                    
                }
                .navigationBarTitle("Settings")
            }
            
            
            
            /*
             NavigationView {
             List {
             ForEach(settings) { item in
             NavigationLink {
             Text("Item at \(item.language!)")
             } label: {
             Text(item.language!)
             }
             }
             .onDelete(perform: deleteItems)
             }
             .toolbar {
             ToolbarItem(placement: .navigationBarTrailing) {
             EditButton()
             }
             ToolbarItem {
             Button(action: addItem) {
             Label("Add Item", systemImage: "plus")
             }
             }
             }
             Text("Select an item")
             }
             */
        
        
    }
    
    
    private func addItem() {
        withAnimation {
            let newSetting = Settings(context: viewContext)
            newSetting.language = "tr"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { settings[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    
}


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
    

    


struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}
