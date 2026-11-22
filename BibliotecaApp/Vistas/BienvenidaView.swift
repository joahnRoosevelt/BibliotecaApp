import SwiftUI

struct BienvenidaView: View {
    // @Binding: el valor pertenece a ContentView; al cambiarlo aquí,
    // ContentView reemplaza esta pantalla por Mis libros.
    @Binding var mostrarLibros: Bool

    var body: some View {
        ZStack {
            // El fondo ignora el área segura para cubrir toda la pantalla.
            Color.blue
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "books.vertical.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)

                Text("Biblioteca App")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)

                Button("Ingresar") {
                    mostrarLibros = true
                }
                .font(.headline)
                .foregroundStyle(.blue)
                .padding(.horizontal, 40)
                .padding(.vertical, 12)
                .background(.white)
                .clipShape(Capsule())
                .padding(.top, 24)
            }
        }
    }
}

#Preview {
    BienvenidaView(mostrarLibros: .constant(false))
}
