//
//  StrategyRow.swift
//  journey
//
//  Created by Thijn Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//


import SwiftUI

struct StrategyRow: View {
   
    
    let height: CGFloat = 50
    
    @State private var dragAmount = CGSize.zero
    @State private var isDragging = false
    @EnvironmentObject var userData: UserData
    
    func setFoo () {
           
           self.userData.model.distThreshold[0] = self.userData.model.distThreshold[0] * self.userData.strategies[self.strategyIndex].thresMul.upper
           
           self.userData.model.distThreshold[1] = self.userData.model.distThreshold[1] * self.userData.strategies[self.strategyIndex].thresMul.lower
           
           self.userData.model.sigma = self.userData.model.sigma * self.userData.strategies[self.strategyIndex].sigmaMul
           
           self.userData.model.beta[0] = self.userData.model.beta[0] * self.userData.strategies[self.strategyIndex].betaMul.noDist
           
           self.userData.model.beta[1] = self.userData.model.beta[1] * self.userData.strategies[self.strategyIndex].betaMul.dist
           
            self.userData.model.mu = self.userData.model.mu * self.userData.strategies[self.strategyIndex].muMul
           
           self.userData.model.gamma = self.userData.model.gamma * self.userData.strategies[self.strategyIndex].gammaMul
           
       }
       
       func unsetFoo () {
            self.userData.model.distThreshold[0] = self.userData.model.distThreshold[0] / self.userData.strategies[self.strategyIndex].thresMul.upper
                    
                self.userData.model.distThreshold[1] = self.userData.model.distThreshold[1] / self.userData.strategies[self.strategyIndex].thresMul.lower
                
                self.userData.model.sigma = self.userData.model.sigma / self.userData.strategies[self.strategyIndex].sigmaMul
                
                self.userData.model.beta[0] = self.userData.model.beta[0] / self.userData.strategies[self.strategyIndex].betaMul.noDist
                
                self.userData.model.beta[1] = self.userData.model.beta[1] / self.userData.strategies[self.strategyIndex].betaMul.dist
                
                 self.userData.model.mu = self.userData.model.mu / self.userData.strategies[self.strategyIndex].muMul
                
                self.userData.model.gamma = self.userData.model.gamma / self.userData.strategies[self.strategyIndex].gammaMul
       }
    
    var strategy: Strategy
    var index: Int
    
    var strategyIndex: Int {
        userData.strategies.firstIndex(where: { $0.id == strategy.id })!
    }
    
    var body: some View {
        
        
        HStack {
            strategy.image
                .resizable()
                .frame(width: height, height: height)
        
                .shadow(radius: 10)
                .scaleEffect(isDragging ? 1.5 : 1)
                .offset(dragAmount)
                .animation(.spring())
                .zIndex(1)
                .gesture(
                    DragGesture()
                        .onChanged {
                            self.dragAmount = $0.translation
                            self.isDragging = true
                    }
                        //.onEnded { _ in self.dragAmount = .zero }
                        
                            
                            
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                self.isDragging = false
                                
                                if -1 * self.dragAmount.height > 50 + CGFloat(self.index) * (self.height + 13) {
                                    /*
                                    if self.userData.landmarks[self.landmarkIndex]
                                    .isFavorite{
                                        self.dragAmount = CGSize(width: 0, height: 0)
                                        //self.color = self.colors[0]
                                    }
                                    else {
                                        
                                        self.dragAmount = CGSize(width: 0, height: 0)
                                        
                                        
                                        //self.color = self.colors[1]
                                    }
                                    */
                                    if(self.userData.strategies[self.strategyIndex]
                                        .isFavorite) {
                                        
                                        //DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            self.unsetFoo()
                                        //}
                                    }
                                    else{
                                        
                                        //DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            self.setFoo()
                                        //}
                                    }
                                    
                                    self.userData.strategies[self.strategyIndex]
                                    .isFavorite.toggle()
                                }
                                
                                self.dragAmount = CGSize(width: 0, height: 0)
                                
                                
                            }
                    }
            )
            Text(strategy.name)
            //Text("\(self.dragAmount.height)")
            //Text("\(CGFloat(self.index) * self.height)")
            //Text("\(self.index)")
            Spacer()
            
            if strategy.isFavorite {
                Image(systemName: "link")
                    .imageScale(.large)
                
                
            }
        }
    }
}

struct StrategyRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StrategyRow(strategy: strategyData[0], index: 1)
            StrategyRow(strategy: strategyData[1], index: 5)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
