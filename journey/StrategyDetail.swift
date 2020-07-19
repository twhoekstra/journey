//
//  StrategyDetail.swift
//  journey
//
//  Created by Manon Hoekstra on 10/06/2020.
//  Copyright © 2020 Thijn Hoekstra. All rights reserved.
//

import SwiftUI

struct StrategyDetail: View {
    @EnvironmentObject var userData: UserData
    var strategy: Strategy
   
    
    var strategyIndex: Int {
        userData.strategies.firstIndex(where: { $0.id == strategy.id })!
    }
    
    
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
    
    var body: some View {
        VStack {
            MapView(coordinate: strategy.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: strategy.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(strategy.name)
                        .font(.title)
                    
                    Button(action: {
                        
                        
                        if(self.userData.strategies[self.strategyIndex]
                            .isFavorite) {
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                self.unsetFoo()
                            }
                        }
                        else{
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                self.setFoo()
                            }
                        }
                            
                        self.userData.strategies[self.strategyIndex]
                            .isFavorite.toggle()
                        
                        
                    }) {
                        if self.userData.strategies[self.strategyIndex]
                            .isFavorite {
                            Image(systemName: "link.circle.fill")
                              
                                .imageScale(.large)
                            
                            
                            
                        } else {
                            Image(systemName: "link.circle")
                                .foregroundColor(Color.gray)
                                .imageScale(.large)
                        }
                    }
                }
                
                HStack(alignment: .top) {
                    Text(strategy.owner)
                        .font(.subheadline)
                    Spacer()
                    Text(strategy.state)
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}



struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return StrategyDetail(strategy: userData.strategies[0])
            .environmentObject(userData)
    }
}
