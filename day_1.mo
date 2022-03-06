import Array "mo:base/Array";
import Nat "mo:base/Nat";


actor {
    public func add(n : Nat, m: Nat) : async Nat {
        return n + m;
    };

    public func square(n : Nat) : async Nat {
        return n * n;
    };

    public func days_to_second(n : Nat) : async Nat {
        return n * 24 * 60 * 60;
    };

    var counter = 0;

    public func increment_counter() : async Nat {
        counter := counter + 1;
        return counter ;
    };

    public func clear_counter() : async Text {
        counter := 0;
        return "Counter set to 0";
    };

    public func divide(n : Nat, m : Nat) : async Bool {
        if (n % m == 0) {
            return true;
        } else {
            return false;
        }
    };

    public func is_even(n : Nat) : async Bool {
        return await divide(n, 2);
    };

    public func sum_of_array(array : [Nat]) : async Nat {
        var sum : Nat = 0;
        for (value in array.vals()) {
            sum := sum + value;
        };
        return sum;
    };

    public func maximum(array : [Nat]) : async Nat {
        var max : Nat = 0;
        for (value in array.vals()) {
            if (value > max) {
                max := value;
            }
        };
        return max;
    };

    public func remove_from_array(array : [Nat], n : Nat) : async [Nat] {
        return Array.filter(array, func (item : Nat) : Bool {
            if (item == n) {
                return false
            } else {
                return true
            }
        });
    };

    public func selection_sort(array : [Nat]) : async [Nat] {
        return Array.sort(array, Nat.compare);
    };
};
