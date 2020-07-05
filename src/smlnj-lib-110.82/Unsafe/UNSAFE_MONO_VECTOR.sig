
signature UNSAFE_MONO_VECTOR =
sig
   type elem
   type vector

   (* omit Size check;
    * elements have indeterminate values *)
   val create: int -> vector
   (* omit Subscript check *)
   val sub: vector * int -> elem
   (* omit Subscript check *)
   val update: vector * int * elem -> unit
end

