//
//  HanvestHeaderView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import SwiftUI

struct HanvestHeaderView: View {
    @ObservedObject var viewmodel: HanvestProfileHeaderViewModel
    
    var bookIconTappedAction: () -> ()
    var bellIconTappedAction: () -> ()
    var profileIconTappedAction: () -> ()
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    HanvestHeaderLogo()
                    VStack(alignment: .leading) {
                        Text("Virtual Balance")
                            .font(.nunito(.caption2))
                        Text(
                            HanvestPriceFormatter.formatIntToIDR(viewmodel.user?.userBalance ?? 0)
                        )
                            .font(.nunito(.title2))
                    }
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    Image(systemName: "character.book.closed")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                            bookIconTappedAction()
                        }
                    Image(systemName: "bell")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                            bellIconTappedAction()
                        }
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                            profileIconTappedAction()
                        }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(Color.background)
        .shadow(color: Color.black.opacity(0.1), radius: 0, x: 0, y: 1)
        .onAppear(){
            viewmodel.setup()
        }
    }
}

struct HanvestHeaderLogo: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.seagull500)
            Image(systemName: "medal")
                .foregroundStyle(.sundown50)
        }
        .frame(width: 43, height: 43)
    }
}

#Preview {
    @Previewable @StateObject var viewmodel = HanvestProfileHeaderViewModel()
    
    HanvestHeaderView(
        viewmodel: viewmodel,
        bookIconTappedAction: {
            print("Book Icon Tapped")
        },
        bellIconTappedAction: {
            print("Bell Icon Tapped")
        },
        profileIconTappedAction: {
            print("Profile Icon Tapped")
        })
    .onAppear(){
        viewmodel.setup()
    }
}
