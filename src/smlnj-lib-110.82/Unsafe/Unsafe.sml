
structure Unsafe : UNSAFE =
struct
  structure Basis = struct
    structure Array       = Array
    structure Vector      = Vector
    structure CharArray   = CharArray
    structure CharVector  = CharVector
    structure Word8Array  = Word8Array
    structure Word8Vector = Word8Vector
  end

  structure Vector = struct
    val sub    = Basis.Vector.sub
  end

  structure Array  = struct
    val sub    = Basis.Array.sub
    val update = Basis.Array.update
    val create = Basis.Array.array
  end

  structure CharArray   = struct
    open Basis.CharArray
    fun create i = array (i, chr 0)
  end

  structure CharVector  = struct
    open Basis.CharVector
    fun create i = Basis.CharArray.vector (Basis.CharArray.array (i, chr 0))
    fun update (vec, i, el) =
      raise Fail "Unimplemented: Unsafe.CharVector.update"
  end

  structure Word8Array  = struct
    open Basis.Word8Array
    fun create i = array (i, 0w0)
  end

  structure Word8Vector = struct
    open Basis.Word8Vector
    fun create i = Basis.Word8Array.vector (Basis.Word8Array.array (i, 0w0))
    fun update (vec, i, el) =
      raise Fail "Unimplemented: Unsafe.Word8Vector.update"
  end

  structure Real64Array = struct
    open Basis.Array
    type elem = Real.real
    type array = elem array
    fun create i = array (i, 0.0)
  end
end

