//
//  ContentView.swift
//  OhelloGame
//
//  Created by Ming Xia on 3/23/22.
//

import SwiftUI

struct ContentView: View {
    @State var num = 1
    @State var scoreplayer1 = 2
    @State var scoreplayer2 = 2
    @State var Playerturn = 1
    @State var steps = 0
    @State var winner = ""
    @State var nums = [
          // A B C D E F G H
            [0,0,0,0,0,0,0,0], //1
            [0,0,0,0,0,0,0,0], //2
            [0,0,0,0,0,0,0,0], //3
            [0,0,0,2,1,0,0,0], //4
            [0,0,0,1,2,0,0,0], //5
            [0,0,0,0,0,0,0,0], //6
            [0,0,0,0,0,0,0,0], //7
            [0,0,0,0,0,0,0,0], //8
    ]

    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text("Funny Othello")
                    .font(.system(size: 35))
                    .fontWeight(.heavy)
                    .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 3.0))
            }.padding(.bottom, 50)
            Spacer()

            GeometryReader { geometryReader in
                let width = min(geometryReader.size.width-10, geometryReader.size.height-10)
                let height = width
                let space = width/8
                
                Path { path in
                    for i in 0...8{
                        let offset = CGFloat(i) * space + 5
                        path.move(to: CGPoint(x: offset, y: 4))
                        path.addLine(to: CGPoint(x: offset, y: height+6))
                    }
                    for i in 0...8 {
                        let offset = CGFloat(i) * space + 5
                        path.move(to: CGPoint(x: 4, y: offset))
                        path.addLine(to: CGPoint(x: width+6, y: offset))
                    }

                }.stroke(lineWidth: 1)
                .foregroundColor(.black)
                .background(.green)
                
                ForEach(0..<8){i in
                    let offsetx = CGFloat(i) * space + 5
                    ForEach(0..<8){j in
                        let offsety = CGFloat(j) * space + 5
 
                        Button(String(nums[i][j])){
                            if (nums[i][j] == 0){
                                Playerturn = Playerturn + 1
                                nums[i][j] = nums[i][j] + Playerturn%2 + 1
                                print(nums[i][j])
                                steps = steps + 1
                                if(steps == 60){
                                    if (scoreplayer1 > scoreplayer2){
                                        winner = "Winner is Black"
                                    }else if(scoreplayer1 < scoreplayer2){
                                        winner = "Winner is White"
                                    }else{
                                        winner = "Draw Game"
                                    }
                                }
                                switch i{
//**************************************************************************************************
                                case 0...1:
                                    check2Down(row: i, col: j)
                                    if(i==1){
                                        checkUD(row: i, col: j)
                                    }
                                    if(j==0 || j==1){
                                        check2slidedownright(row: i, col: j)
                                        check2Right(row: i, col: j)
                                        if(j==1){
                                            checkRL(row: i, col: j)
                                            if(i==1){
                                                checkSlideup(row: i, col: j)
                                                checkSlidedown(row: i, col: j)
                                            }
                                        }
                                    }
                                    if(j>=2 && j<=5){
                                        check2slidedownright(row: i, col: j)
                                        check2slidedownleft(row: i, col: j)
                                        checkRL(row: i, col: j)
                                        check2Right(row: i, col: j)
                                        check2Left(row: i, col: j)
                                        if(i==1){
                                            checkSlideup(row: i, col: j)
                                            checkSlidedown(row: i, col: j)
                                        }
                                    }
                                    if(j==6 || j==7){
                                        check2slidedownleft(row: i, col: j)
                                        check2Left(row: i, col: j)
                                        if(j==6){
                                            checkRL(row: i, col: j)
                                            if(i==1){
                                                checkSlideup(row: i, col: j)
                                                checkSlidedown(row: i, col: j)
                                            }
                                        }
                                    }
//**************************************************************************************************
                                case 2...5:
                                    check2Up(row: i, col: j)
                                    check2Down(row: i, col: j)
                                    checkUD(row: i, col: j)
                                    if(j==0 || j==1){
                                        check2slidedownright(row: i, col: j)
                                        check2slideupright(row: i, col: j)
                                        check2Right(row: i, col: j)
                                        if(j==1){
                                            checkRL(row: i, col: j)
                                            checkSlideup(row: i, col: j)
                                            checkSlidedown(row: i, col: j)
                                        }
                                    }
                                    if(j>=2 && j<=5){
                                        check2slidedownright(row: i, col: j)
                                        check2slidedownleft(row: i, col: j)
                                        check2slideupright(row: i, col: j)
                                        check2slideupleft(row: i, col: j)
                                        check2Right(row: i, col: j)
                                        check2Left(row: i, col: j)
                                        checkRL(row: i, col: j)
                                        checkSlideup(row: i, col: j)
                                        checkSlidedown(row: i, col: j)
                                    }
                                    if(j==6 || j==7){
                                        check2slidedownleft(row: i, col: j)
                                        check2slideupleft(row: i, col: j)
                                        check2Left(row: i, col: j)
                                        if(j==6){
                                            checkRL(row: i, col: j)
                                            checkSlideup(row: i, col: j)
                                            checkSlidedown(row: i, col: j)
                                        }
                                    }
//**************************************************************************************************
                                case 6...7:
                                    check2Up(row: i, col: j)
                                    if(i==6){
                                        checkUD(row: i, col: j)
                                    }
                                    if(j==0 || j==1){
                                        check2slideupright(row: i, col: j)
                                        check2Right(row: i, col: j)
                                        if(j==1){
                                            checkRL(row: i, col: j)
                                            if(i==6){
                                                checkSlideup(row: i, col: j)
                                                checkSlidedown(row: i, col: j)
                                            }
                                        }
                                    }
                                    if(j>=2 && j<=5){
                                        checkRL(row: i, col: j)
                                        check2Left(row: i, col: j)
                                        check2Right(row: i, col: j)
                                        check2slideupright(row: i, col: j)
                                        check2slideupleft(row: i, col: j)
                                        if(i==6){
                                            checkSlideup(row: i, col: j)
                                            checkSlidedown(row: i, col: j)
                                        }
                                    }
                                    if(j==6 || j==7){
                                        check2slideupleft(row: i, col: j)
                                        check2Left(row: i, col: j)
                                        if(j==6){
                                            checkRL(row: i, col: j)
                                            if(i==6){
                                                checkSlideup(row: i, col: j)
                                                checkSlidedown(row: i, col: j)
                                            }
                                        }
                                    }

                                default:
                                    print("You are out of bound")
                                }
                                (scoreplayer1, scoreplayer2) = sUpdate()
                            }
                        }
                        .frame(width: space-5 , height: space-5)
                        .foregroundColor(.clear)
                        .background(self.colorToShow(item: nums[i][j]))
                        .animation(.linear(duration: 0.5), value: UUID())
                        .clipShape(Circle())
                        .position(x: offsety + space/2, y: offsetx + space/2)
                    }
                }
            }.aspectRatio(contentMode: .fit)
                .padding()
            
            Spacer()
            
            Text(winner)
                .font(.system(size: 35))
                .fontWeight(.heavy)
                .foregroundColor(.red)
                .padding(.bottom, 2)
            
            HStack{
                Spacer()
                
                VStack{
                    Text("Black")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)
                        .padding(.bottom, 2)
                    Text(String(scoreplayer1))
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
                Spacer()
                VStack{
                    Text("White")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)
                        .padding(.bottom, 2)
                    Text(String(scoreplayer2))
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Button("Restart Game"){
                    scoreplayer1 = 2
                    scoreplayer2 = 2
                    Playerturn = 1
                    steps = 0
                    winner = ""
                    nums = [
                            [0,0,0,0,0,0,0,0], //1
                            [0,0,0,0,0,0,0,0], //2
                            [0,0,0,0,0,0,0,0], //3
                            [0,0,0,2,1,0,0,0], //4
                            [0,0,0,1,2,0,0,0], //5
                            [0,0,0,0,0,0,0,0], //6
                            [0,0,0,0,0,0,0,0], //7
                            [0,0,0,0,0,0,0,0], //8
                    ]
                }.foregroundColor(.white)
                    .font(.system(size: 20))
                    .background(.red)
            }.padding([.top, .trailing], 20.0)
            Spacer()
        }.background(.yellow)

    }
    func colorToShow(item: Int) -> Color{
        switch item {
            case 1:
                return .black
            case 2:
                return .white
            default:
                return .clear
            }
        }
    
    func sUpdate() -> (Int, Int){
        var a = 0
        var b = 0
        for i in 0 ... 7{
            for j in 0 ... 7{
                if(nums[i][j] == 1){
                    a = a + 1
                }
                if(nums[i][j] == 2){
                    b = b + 1
                }
            }
        }
        return(a, b)
    }
//***************************************************************
    func check2Down(row: Int, col: Int){
        let i = row
        let j = col
        if(nums[i][j] == nums[i+2][j] && 0 != nums[i+1][j]){
            nums[i+1][j] = nums[i][j]
        }
    }
    func check2Up(row: Int, col: Int){
        let i = row
        let j = col
        if(nums[i][j] == nums[i-2][j] && 0 != nums[i-1][j]){
            nums[i-1][j] = nums[i][j]
        }
    }
    func check2Right(row: Int, col: Int){
        let i = row
        let j = col
        
        if(nums[i][j] == nums[i][j+2] && 0 != nums[i][j+1]){
            nums[i][j+1] = nums[i][j]
        }
    }
    func check2Left(row: Int, col: Int){
        let i = row
        let j = col
        if(nums[i][j] == nums[i][j-2] && 0 != nums[i][j-1]){
            nums[i][j-1] = nums[i][j]
        }
    }
//*********************************************************
    func check2slidedownright(row: Int, col: Int){
        let i = row
        let j = col
        if(nums[i][j] == nums[i+2][j+2] && 0 != nums[i+1][j+1]){
            nums[i+1][j+1] = nums[i][j]
        }
    }
    func check2slidedownleft(row: Int, col: Int){
        let i = row
        let j = col
        if(nums[i][j] == nums[i+2][j-2] && 0 != nums[i+1][j-1]){
            nums[i+1][j-1] = nums[i][j]
        }
    }
    func check2slideupright(row: Int, col: Int){
        let i = row
        let j = col
        if(nums[i][j] == nums[i-2][j+2] && 0 != nums[i-1][j+1]){
            nums[i-1][j+1] = nums[i][j]
        }
    }
    func check2slideupleft(row: Int, col: Int){
        let i = row
        let j = col
        if(nums[i][j] == nums[i-2][j-2] && 0 != nums[i-1][j-1]){
            nums[i-1][j-1] = nums[i][j]
        }
    }
//************************************************************
    func checkRL(row: Int, col: Int){
        let i = row
        let j = col
        if(nums[i][j+1] == nums[i][j-1] && 0 != nums[i][j+1]){
            nums[i][j] = nums[i][j+1]
        }
    }
    func checkUD(row: Int, col: Int){
        let i = row
        let j = col
        if(nums[i-1][j] == nums[i+1][j] && 0 != nums[i-1][j]){
            nums[i][j] = nums[i+1][j]
        }
    }
    func checkSlidedown(row: Int, col: Int){
        let i = row
        let j = col
        if(nums[i+1][j+1] == nums[i-1][j-1] && 0 != nums[i+1][j+1]){
            nums[i][j] = nums[i+1][j+1]
        }
    }
    func checkSlideup(row: Int, col: Int){
        let i = row
        let j = col
        if(nums[i+1][j-1] == nums[i-1][j+1] && 0 != nums[i+1][j-1]){
            nums[i][j] = nums[i+1][j-1]
        }
    }
    //******************************************************************
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
