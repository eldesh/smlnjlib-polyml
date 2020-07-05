
signature UNSAFE =
sig
  structure Vector      : UNSAFE_VECTOR
  structure Array       : UNSAFE_ARRAY
  structure CharArray   : UNSAFE_MONO_ARRAY
  structure CharVector  : UNSAFE_MONO_VECTOR
  structure Word8Array  : UNSAFE_MONO_ARRAY
  structure Word8Vector : UNSAFE_MONO_VECTOR
  structure Real64Array : UNSAFE_MONO_ARRAY 
end

