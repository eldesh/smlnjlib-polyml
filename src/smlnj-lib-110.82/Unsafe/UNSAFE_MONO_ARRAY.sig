
signature UNSAFE_MONO_ARRAY =
sig
   type array
   type elem

   (* omit Size check;
    * elements have indeterminate value
    *)
   val create: int -> array
   (* omit Subscript check *)
   val sub: array * int -> elem
   (* omit Subscript check *)
   val update: array * int * elem -> unit
end


