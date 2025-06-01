import SwiftUI

struct NewMenuView: View {
    @State private var wordLength = 4

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.85), Color.purple.opacity(0.8)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                // Top Icons
                HStack {
                    Button {
                        // Show Info
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.system(size: 26, weight: .medium))
                            .foregroundColor(.white)
                            .padding()
                    }

                    Spacer()

                    HStack(spacing: 8) {
                        Text("0")
                            .font(.system(size: 32, weight: .light))
                            .foregroundColor(.white)
                        Capsule()
                            .fill(Color.red)
                            .frame(width: 10, height: 28)
                    }
                    .padding()
                }

                Spacer()

                // Logo
                Image("logo") // Or custom shapes
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)

                // Start Text
                Text("TAP TO START")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.top, 12)
                    .onTapGesture {
                        // Start Game
                    }

                Spacer()

                // Bottom Control
                VStack(spacing: 16) {
                    Text("Word Length")
                        .font(.title2)
                        .foregroundColor(.white)

                    HStack(spacing: 20) {
                        Button(action: {
                            if wordLength > 3 { wordLength -= 1 }
                        }) {
                            Image(systemName: "minus.circle")
                                .font(.title)
                                .foregroundColor(.white)
            
                            
                        }

                        Text("\(wordLength)")
                            .font(.title)
                            .frame(width: 40)

                        Button(action: {
                            if wordLength < 10 { wordLength += 1 }
                        }) {
                            Image(systemName: "plus.circle")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }

                  
                }

                Spacer(minLength: 30)
            }
            .padding()
        }
    }
}

struct NewMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NewMenuView()
    }
}
