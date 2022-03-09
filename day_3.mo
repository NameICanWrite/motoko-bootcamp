import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Char "mo:base/Char";

    

actor {
    public func is_inside(t : Text, c : Char) : async Bool {
        for (value in t.chars()) {
            if (value == c) {
                return true
            };
        };
        return false
    };
    private func swap(array : [var Nat], j : Nat, i : Nat) : async [Nat] {
        let temp = array[i];
        array[i] := array[j];
        array[j] := temp;
        return Array.freeze(array)
    };

    public func init_count(n : Nat) : async [Nat] {
        let array : [var Nat] = Array.init<Nat>(n, 0);
        var index = 0;
        while (index < n) {
            array[index] := index;
            index := index + 1;
        };
        return Array.freeze(array)
    };

    public func seven(array : [Nat]) : async Text {
        for (value in array.vals()) {
            if (await is_inside(Nat.toText(value), '7')) {
                return "Seven is found"
            }
        };
        return "Seven not found"
    };
    public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {
        switch(n){
            // Case where n is null
            case(null) {
                return m;
            };
            // Case where n is a nat
            case(?something){
                return something;
            };
        }
    };

    public func day_of_the_week(n : Nat) : async ?Text {
        switch(n) {
            case(1) {
                return ?"Monday"
            };
            
            case(2) {
                return ?"Tuesday"
            };
            case(3) {
                return ?"Wednesday"
            };
            case(4) {
                return ?"Thursday"
            };
            case(5) {
                return ?"Friday"
            };
            case(6) {
                return ?"Saturday"
            };
            case(7) {
                return ?"Sunday"
            };
            case(default) {
                return null
            };
            
        }
    };

    public func populate_array(array : [?Nat]) : async [Nat] {
        return Array.map<?Nat, Nat>(array, func (item : ?Nat) : Nat {
            switch(item) {
                case(null) {
                    return 0;
                };
                case(?something) {
                    return something;
                }
            }
        })
    };

    public func sum_of_array(array : [Nat]) : async Nat {
        return Array.foldLeft<Nat, Nat>(array, 0, func (res : Nat, item : Nat) : Nat {
            return (res + item)
        })
    };

    public func square_array(array : [Nat]) : async [Nat] {
        return Array.map<Nat, Nat>(array, func (item : Nat) {
            return item ** 2
        })
    };

    public func increase_by_index(array : [Nat]) : async [Nat] {
        return Array.mapEntries<Nat, Nat>(array, func (item : Nat, index : Nat) {
            return item + index
        })
    };

//takes the func that takes array item and the given item
    private func contains<A>(array : [A], a : A, f : (A, A) -> Bool) : Bool{
        for (value in array.vals()) {
            if (f(value, a) == true) {
                return true
            }
        };
        return false
    };

    public func testContains() : async Bool {
        if (
            contains<Nat>([1,2,3,4], 1, func (item : Nat, a : Nat) {
                return a == item
            }) and
            (contains<Nat>([2,3,4], 1, func (item : Nat, a : Nat) {
                return a == item
            }) == false)
        ) {
            return true
        } else {
            return false
        }
        
    }

}