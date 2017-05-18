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
    case King (title: String, color: Color, positionColumn: String, positionRow: Int, image: PiecesImg)
    case Queen (title: String, color: Color, positionColumn: String, positionRow: Int, image: PiecesImg)
    case Rook (title: String, color: Color, positionColumn: String, positionRow: Int, image: PiecesImg)
    case Bishop (title: String, color: Color, positionColumn: String, positionRow: Int, image: PiecesImg)
    case Knight (title: String, color: Color, positionColumn: String, positionRow: Int, image: PiecesImg)
    case Pawn (title: String, color: Color, positionColumn: String, positionRow: Int, image: PiecesImg)
    
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

// Making chess board
let literalsDict = [1: "a",2: "b",3: "c",4: "d",5: "e",6: "f",7: "g",8: "h"]
let literals = "  A B C D E F G H "
let blackSquare = "\u{2b1b}"
let whiteSquare = "\u{2b1c}"
var str = ""
func changePiece(text: String, pieceImg: String) -> String {
    var str = text
    str.remove(at: str.index(before: str.endIndex))
    return str + pieceImg
}
var chessPieces = [Piece]()
// Print checkmate postion

print("\n*********************")
print("***** Checkmate *****")
print("*********************\n")

var kingBlack = Piece.King(title: "King", color: .Black, positionColumn: "d", positionRow: 8, image: .KingBlack)
var rookWhite = Piece.Rook(title: "Rook", color: .White, positionColumn: "h", positionRow: 8, image: .RookWhite)
var rookWhite2 = Piece.Rook(title: "Rook", color: .White, positionColumn: "g", positionRow: 7, image: .RookWhite)
var chessPieces = [kingBlack, rookWhite, rookWhite2]

print(literals)
for i in 1...8 {
    str = "\(9 - i) "
    for j in 1...8 {
        str += (i + j) % 2 == 0 ? whiteSquare : blackSquare
        
        for chessPiece in chessPieces {
            switch chessPiece {
            case .King (let piece) where piece.positionColumn == literalsDict[j] && piece.positionRow == i:
                changePiece(pieceImg: piece.image.rawValue)
            case .Queen (let piece) where piece.positionColumn == literalsDict[j] && piece.positionRow == i:
                changePiece(pieceImg: piece.image.rawValue)
            case .Rook (let piece) where piece.positionColumn == literalsDict[j] && piece.positionRow == i:
                changePiece(pieceImg: piece.image.rawValue)
            case .Bishop (let piece) where piece.positionColumn == literalsDict[j] && piece.positionRow == i:
                changePiece(pieceImg: piece.image.rawValue)
            case .Knight (let piece) where piece.positionColumn == literalsDict[j] && piece.positionRow == i:
                changePiece(pieceImg: piece.image.rawValue)
            case .Pawn (let piece) where piece.positionColumn == literalsDict[j] && piece.positionRow == i:
                changePiece(pieceImg: piece.image.rawValue)
            default: break
            }
        }
    }
    str += " \(9 - i)"
    print(str)
}
print(literals)

// Pieces configuration

var kingWhite = Piece.King(title: "King", color: .White, positionColumn: "e", positionRow: 1, image: Piece.PiecesImg.KingWhite)
var kingBlack = Piece.King(title: "King", color: .Black, positionColumn: "e", positionRow: 8, image: Piece.PiecesImg.KingBlack)

var queenWhite = Piece.Queen(title: "Queen", color: .White, positionColumn: "d", positionRow: 1, image: Piece.PiecesImg.QueenWhite)
var queenBlack = Piece.Queen(title: "Queen", color: .Black, positionColumn: "d", positionRow: 8, image: Piece.PiecesImg.QueenBlack)

var rookWhite = Piece.Rook(title: "Rook", color: .White, positionColumn: "h", positionRow: 1, image: Piece.PiecesImg.RookWhite)
var rookWhite2 = Piece.Rook(title: "Rook", color: .White, positionColumn: "a", positionRow: 1, image: Piece.PiecesImg.RookWhite)
var rookBlack = Piece.Rook(title: "Rook", color: .Black, positionColumn: "h", positionRow: 8, image: Piece.PiecesImg.RookBlack)
var rookBlack2 = Piece.Rook(title: "Rook", color: .Black, positionColumn: "a", positionRow: 8, image: Piece.PiecesImg.RookBlack)

var bishopWhite = Piece.Bishop(title: "Bishop", color: .White, positionColumn: "f", positionRow: 1, image: Piece.PiecesImg.BishopWhite)
var bishopWhite2 = Piece.Bishop(title: "Bishop", color: .White, positionColumn: "c", positionRow: 1, image: Piece.PiecesImg.BishopWhite)
var bishopBlack = Piece.Bishop(title: "Bishop", color: .Black, positionColumn: "f", positionRow: 8, image: Piece.PiecesImg.BishopBlack)
var bishopBlack2 = Piece.Bishop(title: "Bishop", color: .Black, positionColumn: "c", positionRow: 8, image: Piece.PiecesImg.BishopBlack)

var knightWhite = Piece.Knight(title: "Knight", color: .White, positionColumn: "g", positionRow: 1, image: Piece.PiecesImg.KnightWhite)
var knightWhite2 = Piece.Knight(title: "Knight", color: .White, positionColumn: "b", positionRow: 1, image: Piece.PiecesImg.KnightWhite)
var knightBlack = Piece.Knight(title: "Knight", color: .Black, positionColumn: "g", positionRow: 8, image: Piece.PiecesImg.KnightBlack)
var knightBlack2 = Piece.Knight(title: "Knight", color: .Black, positionColumn: "b", positionRow: 8, image: Piece.PiecesImg.KnightBlack)

var pawnWhite = Piece.Pawn(title: "Pawn", color: .White, positionColumn: "a", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite2 = Piece.Pawn(title: "Pawn", color: .White, positionColumn: "b", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite3 = Piece.Pawn(title: "Pawn", color: .White, positionColumn: "c", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite4 = Piece.Pawn(title: "Pawn", color: .White, positionColumn: "d", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite5 = Piece.Pawn(title: "Pawn", color: .White, positionColumn: "e", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite6 = Piece.Pawn(title: "Pawn", color: .White, positionColumn: "f", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite7 = Piece.Pawn(title: "Pawn", color: .White, positionColumn: "g", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnWhite8 = Piece.Pawn(title: "Pawn", color: .White, positionColumn: "h", positionRow: 2, image: Piece.PiecesImg.PawnWhite)
var pawnBlack = Piece.Pawn(title: "Pawn", color: .Black, positionColumn: "a", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack2 = Piece.Pawn(title: "Pawn", color: .Black, positionColumn: "b", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack3 = Piece.Pawn(title: "Pawn", color: .Black, positionColumn: "c", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack4 = Piece.Pawn(title: "Pawn", color: .Black, positionColumn: "d", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack5 = Piece.Pawn(title: "Pawn", color: .Black, positionColumn: "e", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack6 = Piece.Pawn(title: "Pawn", color: .Black, positionColumn: "f", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack7 = Piece.Pawn(title: "Pawn", color: .Black, positionColumn: "g", positionRow: 7, image: Piece.PiecesImg.PawnBlack)
var pawnBlack8 = Piece.Pawn(title: "Pawn", color: .Black, positionColumn: "h", positionRow: 7, image: Piece.PiecesImg.PawnBlack)

// Arrays of pieces
chessPieces.removeAll()
chessPieces = [kingWhite, queenWhite, rookWhite, rookWhite2, bishopWhite, bishopWhite2, knightWhite, knightWhite2, pawnWhite, pawnWhite2, pawnWhite3, pawnWhite4, pawnWhite5, pawnWhite6, pawnWhite7, pawnWhite8, kingBlack, queenBlack, rookBlack, rookBlack2, bishopBlack, bishopBlack2, knightBlack, knightBlack2, pawnBlack, pawnBlack2, pawnBlack3, pawnBlack4, pawnBlack5, pawnBlack6, pawnBlack7, pawnBlack8]


// Print all pieces on start positions
func printAllPiecesOnStart(array: [Piece]) {
    let literalsDict = [1: "a",2: "b",3: "c",4: "d",5: "e",6: "f",7: "g",8: "h"]
    let literalsStr = "  A B C D E F G H "
    let blackSquare = "\u{2b1b}"
    let whiteSquare = "\u{2b1c}"
    var str = ""
    print(literalsStr)
    for i in 1...8 {
        let m = 9 - i
        str = "\(m) "
        for j in 1...8 {
            str += (i + j) % 2 == 0 ? whiteSquare : blackSquare
            
            for chessPiece in array {
                switch chessPiece {
                case .King (let piece) where piece.positionColumn == literalsDict[j] && piece.positionRow == m:
                    str = changePiece(text: str, pieceImg: piece.image.rawValue)
                case .Queen (let piece) where piece.positionColumn == literalsDict[j] && piece.positionRow == m:
                    str = changePiece(text: str, pieceImg: piece.image.rawValue)
                case .Rook (let piece) where piece.positionColumn == literalsDict[j] && piece.positionRow == m:
                    str = changePiece(text: str, pieceImg: piece.image.rawValue)
                case .Bishop (let piece) where piece.positionColumn == literalsDict[j] && piece.positionRow == m:
                    str = changePiece(text: str, pieceImg: piece.image.rawValue)
                case .Knight (let piece) where piece.positionColumn == literalsDict[j] && piece.positionRow == m:
                    str = changePiece(text: str, pieceImg: piece.image.rawValue)
                case .Pawn (let piece) where piece.positionColumn == literalsDict[j] && piece.positionRow == m:
                    str = changePiece(text: str, pieceImg: piece.image.rawValue)
                default: break
                }
            }
        }
        str += " \(9 - i)"
        print(str)
    }
    print(literalsStr)

}

func printChessArray(Piece : [Piece]) {
    for chess in Piece {
        switch chess {
        case .King (let t, let c, let col, let row, _) : print("\(t) - \(c) - \(col):\(row)")
        case .Queen (let t, let c, let col, let row, _) : print("\(t) - \(c) - \(col):\(row)")
        case .Rook (let t, let c, let col, let row, _) : print("\(t) - \(c) - \(col):\(row)")
        case .Bishop (let t, let c, let col, let row, _) : print("\(t) - \(c) - \(col):\(row)")
        case .Knight (let t, let c, let col, let row, _) : print("\(t) - \(c) - \(col):\(row)")
        case .Pawn (let t, let c, let col, let row, _) : print("\(t) - \(c) - \(col):\(row)")
        }
    }
}

printChessArray(Piece: chessPieces)

printAllPiecesOnStart(array: chessPieces)
