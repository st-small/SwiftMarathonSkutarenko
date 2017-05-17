import UIKit

/*
 1. Создать энум с шахматными фигурами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
 
 2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
 
 3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
 
 4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.
 
 5. Следите чтобы ваш код был красивым!
 */

// Enums block

enum Piece {
    case King (color: Color, positionColumn: String, positionRow: Int, image: PiecesImg)
    case Queen (color: Color, positionColumn: String, positionRow: Int, image: PiecesImg)
    case Rook (color: Color, positionColumn: String, positionRow: Int, image: PiecesImg)
    case Bishop (color: Color, positionColumn: String, positionRow: Int, image: PiecesImg)
    case Knight (color: Color, positionColumn: String, positionRow: Int, image: PiecesImg)
    case Pawn (color: Color, positionColumn: String, positionRow: Int, image: PiecesImg)
    
    enum Color {
        case White
        case Black
    }
    
    enum PiecesImg: String {
        case KingWhite = "\u{2654}"
        case KingBlack = "\u{265a}"
        case QueenWhite = "\u{2655}"
        case QueenBlack = "\u{265b}"
        case RookWhite = "\u{2656}"
        case RookBlack = "\u{265c}"
        case BishopWhite = "\u{2657}"
        case BishopBlack = "\u{265d}"
        case KnightWhite = "\u{2658}"
        case KnightBlack = "\u{265e}"
        case PawnWhite = "\u{2659}"
        case PawnBlack = "\u{265f}"
    }
}

extension Piece.Color {
    var value: UIColor {
        get {
            switch self {
            case .White:
                return UIColor.white
            case .Black:
                return UIColor.black
            }
        }
    }
}

// Pieces configuration

var kingWhite = Piece.King(color: .White, positionColumn: "e", positionRow: 1, image: Piece.PiecesImg.KingWhite)
var kingBlack = Piece.King(color: .Black, positionColumn: "e", positionRow: 8, image: Piece.PiecesImg.KingBlack)

var queenWhite = Piece.Queen(color: .White, positionColumn: "d", positionRow: 1, image: Piece.PiecesImg.QueenWhite)
var queenBlack = Piece.Queen(color: .Black, positionColumn: "d", positionRow: 8, image: Piece.PiecesImg.QueenBlack)

var rookWhite = Piece.Rook(color: .White, positionColumn: "h", positionRow: 1, image: Piece.PiecesImg.RookWhite)
var rookWhite2 = Piece.Rook(color: .White, positionColumn: "a", positionRow: 1, image: Piece.PiecesImg.RookWhite)
var rookBlack = Piece.Rook(color: .Black, positionColumn: "h", positionRow: 8, image: Piece.PiecesImg.RookBlack)
var rookBlack2 = Piece.Rook(color: .Black, positionColumn: "h", positionRow: 1, image: Piece.PiecesImg.RookBlack)

var bishopWhite = Piece.Bishop(color: .White, positionColumn: "f", positionRow: 1, image: Piece.PiecesImg.BishopWhite)
var bishopWhite2 = Piece.Bishop(color: .White, positionColumn: "c", positionRow: 1, image: Piece.PiecesImg.BishopWhite)
var bishopBlack = Piece.Bishop(color: .Black, positionColumn: "f", positionRow: 8, image: Piece.PiecesImg.BishopBlack)
var bishopBlack2 = Piece.Bishop(color: .Black, positionColumn: "c", positionRow: 8, image: Piece.PiecesImg.BishopBlack)

var knightWhite = Piece.Knight(color: .White, positionColumn: "g", positionRow: 1, image: Piece.PiecesImg.KnightWhite)
var knightWhite2 = Piece.Knight(color: .White, positionColumn: "b", positionRow: 1, image: Piece.PiecesImg.KnightWhite)
var knightBlack = Piece.Knight(color: .Black, positionColumn: "g", positionRow: 8, image: Piece.PiecesImg.KnightBlack)
var knightBlack2 = Piece.Knight(color: .Black, positionColumn: "b", positionRow: 8, image: Piece.PiecesImg.KnightBlack)

var pawnWhite = Piece.Pawn(color: .White, positionColumn: "a", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite2 = Piece.Pawn(color: .White, positionColumn: "b", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite3 = Piece.Pawn(color: .White, positionColumn: "c", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite4 = Piece.Pawn(color: .White, positionColumn: "d", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite5 = Piece.Pawn(color: .White, positionColumn: "e", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite6 = Piece.Pawn(color: .White, positionColumn: "f", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite7 = Piece.Pawn(color: .White, positionColumn: "g", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite8 = Piece.Pawn(color: .White, positionColumn: "h", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnBlack = Piece.Pawn(color: .Black, positionColumn: "a", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack2 = Piece.Pawn(color: .Black, positionColumn: "b", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack3 = Piece.Pawn(color: .Black, positionColumn: "c", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack4 = Piece.Pawn(color: .Black, positionColumn: "d", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack5 = Piece.Pawn(color: .Black, positionColumn: "e", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack6 = Piece.Pawn(color: .Black, positionColumn: "f", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack7 = Piece.Pawn(color: .Black, positionColumn: "g", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack8 = Piece.Pawn(color: .Black, positionColumn: "h", positionRow: 7, image: Piece.PiecesImg.PawnBlack)

// Arrays of pieces

let whiteColorPieces = [kingWhite, queenWhite, rookWhite, rookWhite2, bishopWhite, bishopWhite2, knightWhite, knightWhite2, pawnWhite, pawnWhite2, pawnWhite3, pawnWhite4, pawnWhite5, pawnWhite6, pawnWhite7, pawnWhite8]
let blackColorPieces = [kingBlack, queenBlack, rookBlack, rookBlack2, bishopBlack, bishopBlack2, knightBlack, knightBlack2, pawnBlack, pawnBlack2, pawnBlack3, pawnBlack4, pawnBlack5, pawnBlack6, pawnBlack7, pawnBlack8]
let chessPieces = [whiteColorPieces, blackColorPieces]

let literals = ["   ", "  a ", "  b ", "  c ", "  d  ", " e ", " f ", " g ", " h ", "   "]

// Making chess board

let blackSquare = " \u{2b1b} "
let whiteSquare = " \u{2b1c} "
var topRow = [String]()
var allChessBoard = [Array<Any>]()
var temp = [String]()
for k in 0...10 {
    temp.removeAll()
    for m in 0...9 {
        if k == 0 {
            topRow.append(literals[m])
        }
        
        if m == 0 && (0..<9).contains(k) || m == 9 && (0..<9).contains(k) {
            temp.append(String(" \(k) "))
        }
        
        
        if (1..<9).contains(k) && (1..<9).contains(m) {
            if k % 2 != m % 2 {
                //print("w k = \(k), m = \(m)")
                temp.append(whiteSquare)
            } else {
                //print("k = \(k), m = \(m)")
                temp.append(blackSquare)
            }
        }
        
        
        //print(temp)
    }
    
    if k == 0 || k == 10 {
        //print(temp, k)
        allChessBoard.append(topRow)
        
    } else if (0..<9).contains(k) {
        
        allChessBoard.append(temp)
    }
}

//print(allChessBoard)

for i in allChessBoard.reversed() {
    print(i)
}
