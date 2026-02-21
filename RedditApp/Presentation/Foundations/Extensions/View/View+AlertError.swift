//
//  View+AlertError.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 21/2/26.
//

import SwiftUI

extension View {
    func appAlert(
        _ alert: Binding<AlertError?>,
        onRetry: (() -> Void)? = nil
    ) -> some View {
        let isPresented = Binding<Bool>(
            get: { alert.wrappedValue != nil },
            set: { newValue in
                if !newValue { alert.wrappedValue = nil }
            }
        )

        return self.alert(
            alert.wrappedValue?.title ?? "Error",
            isPresented: isPresented,
            presenting: alert.wrappedValue
        ) { info in
            if let onRetry = info.retryAction {
                Button("Reintentar") { onRetry() }
            }
            Button("OK", role: .cancel) { }
        } message: { info in
            Text(info.message)
        }
    }
}

protocol AlertError: Error {
    var title: String { get }
    var message: String { get }
    var retryAction: (() -> Void)? { get set }
}

struct NoInternetError: AlertError {
    let title: String = "Sin conexión"
    let message: String = "Parece que no tienes internet. Revisa tu conexión e inténtalo de nuevo."
    var retryAction: (() -> Void)? = nil
}

struct MapError: AlertError {
    let title: String = "Error"
    let message: String = "No se pudo cargar la información. Inténtalo de nuevo."
    var retryAction: (() -> Void)? = nil
}

struct SomethingWentWrongError: AlertError {
    let title: String = "Error"
    let message: String = "Algo salió mal. Inténtalo de nuevo."
    var retryAction: (() -> Void)? = nil
}
