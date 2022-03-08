import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Char "mo:base/Char";

actor {
public func nat_to_nat8(n : Nat) : async Nat8 {
        if (n <= 255) {
             return Nat8.fromNat(n)
        } else {
            return 0;
        }
    };

    public func max_number_with_n_bits(n : Nat) : async Nat {
        return (2 ** n) - 1
    };

    public func decimal_to_bits(n : Nat) : async Text {
        var divident = n;
        if (divident == 0) {
            return "0";
        };
        var res : Text = "";
        while (divident > 0) {
            let remainder : Text = Nat.toText(divident % 2);
            divident := divident / 2;
            res := Text.concat(remainder, res);
        };
        return res
    };

     //	Return the character corresponding to the unicode value n.
    public func unicode_to_character(n : Nat32) : async Char {
    	let char : Char = Char.fromNat32(n);
    	return char
    };

    public func capitalize_character(c : Char) : async Char {
        let uniChar : Nat32 = Char.toNat32(c);
        var capitalizedUniChar : Nat32 = 0;
        if ((uniChar >= 97)) {
            if ((uniChar <= 122)) {
                capitalizedUniChar := uniChar - 32;
            }
            
        } else {
            capitalizedUniChar := uniChar;
        };
        return Char.fromNat32(capitalizedUniChar)
    };

    public func capitalize_text(t : Text) : async Text {
        var res : Text = "";
        for (value in t.chars()) {
            let capitalized : Char = await capitalize_character(value);
            res := Text.concat(res, Char.toText(capitalized));
        };
        return res;
    };

        public func trim_whitespace(t : Text) : async Text {
        return Text.trim(t, #text " ")
    };

}