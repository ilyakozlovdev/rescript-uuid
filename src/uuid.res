/* 16 byte array */
type bytesT = (int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int)

@scope("uuid") @val external _NIL: string = "NIL"

@module("uuid") external parse: unit => bytesT = "parse"
@module("uuid") external stringify: bytesT => string = "stringify"
@module("uuid") external validate: string => bool = "validate"
@module("uuid") external version: string => int = "version"

module V1 = {
  @deriving(abstract)
  type options = {
    @optional node: (int, int, int, int, int, int),
    @optional clockseq: int,
    @optional msecs: int,
    @optional nsecs: int,
    @optional random: bytesT,
    @optional rng: unit => bytesT,
  }

  @module("uuid") external make: unit => string = "v1"
  @module("uuid") external makeWithOptions: (~options: v1Options) => string = "v1"
  @module("uuid")
  external makeWithBuffer: (
    ~options: v1Options,
    ~buffer: array<int>,
    ~offset: int=?,
    unit,
  ) => string = "v1"
}

module V3 = {
  @module("uuid") @scope("v3") @val external _v3DNS: string = "DNS"
  @module("uuid") @scope("v3") @val external _v3URL: string = "URL"

  @module("uuid")
  external make: (~name: string, ~namespace: @unwrap [#Uuid(string) | #Bytes(bytesT)]) => string =
    "v3"

  @module("uuid")
  external makeWithBuffer: (
    ~name: string,
    ~namespace: @unwrap [#Uuid(string) | #Bytes(bytesT)],
    ~buffer: array<int>,
    ~offset: int=?,
    unit,
  ) => string = "v3"
}
module V4 = {
  @deriving(abstract)
  type options = {
    @optional random: bytesT,
    @optional rng: unit => bytesT,
  }

  @module("uuid") external make: unit => string = "v4"
  @module("uuid") external makeWithOptions: (~options: v4Options) => string = "v4"
  @module("uuid")
  external makeWithBuffer: (
    ~options: v4Options=?,
    ~buffer: array<int>,
    ~offset: int=?,
    unit,
  ) => string = "v4"
}
module V5 = {
  @module("uuid") @scope("v5") @val external _v5DNS: string = "DNS"
  @module("uuid") @scope("v5") @val external _v5URL: string = "URL"

  @module("uuid")
  external make: (~name: string, ~namespace: @unwrap [#Uuid(string) | #Bytes(bytesT)]) => string =
    "v5"

  @module("uuid")
  external makeWithBuffer: (
    ~name: string,
    ~namespace: @unwrap [#Uuid(string) | #Bytes(bytesT)],
    ~buffer: array<int>,
    ~offset: int=?,
    unit,
  ) => string = "v5"
}
