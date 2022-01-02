open Main

let myNamespace = "1b671a64-40d5-491e-99b0-da01ff1f3341"

/**
 * UUID V1
 */
let uuidv1_1 = v1()

let uuidv1_2 = v1WithOptions(~options=v1Options(~clockseq=1, ()))

let uuidv1_3 = v1WithBuffer(
  ~options=v1Options(~clockseq=1, ()),
  ~buffer=[1, 2, 3, 4],
  ~offset=0,
  (),
)

/**
 * UUID V3
 */
let uuidv3dns = _v3DNS
let uuidv3url = _v3URL

let uuidv3 = v3(~name="google.com", ~namespace=#Uuid(myNamespace))

/**
 * UUID V4
 */
let uuidv4_1 = v4()
let uuidv4_2 = v4WithOptions(~options=v4Options())
let uuidv4_3 = v4WithBuffer(~options=v4Options(), ~buffer=[], ~offset=0, ())

/**
 * UUID V5
 */

let uuidv5_DNS = _v5DNS
let uuidv5_URL = _v5URL

let uuidv5_1 = v5(~name="google.com", ~namespace=#Uuid(myNamespace))
let uuidv5_2 = v5WithBuffer(~name="google.com", ~namespace=#Uuid(myNamespace), ~buffer=[], ~offset=0, ())
