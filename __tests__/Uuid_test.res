// open Jest;

// describe("UUID", () => {
//   describe("V1", () =>
//     test("should create uuids based on ascending timestamp", () => {
//       open Expect;
//       let uuids = [
//         Uuid.V1.create(),
//         Uuid.V1.create(),
//         Uuid.V1.create(),
//         Uuid.V1.create(),
//       ];
//       let sorted =
//         uuids
//         |> List.sort((a, b) =>
//              String.compare(Uuid.V1.toString(a), Uuid.V1.toString(b))
//            );
//       expect(uuids) |> toEqual(sorted);
//     })
//   );
//   describe("V3", () => {
//     let tests = [
//       (
//         Uuid.V3.create(
//           ~name="hello.example.com",
//           ~namespace=`Uuid(Uuid.V3._DNS),
//         ),
//         "9125a8dc-52ee-365b-a5aa-81b0b3681cf6",
//       ),
//       (
//         Uuid.V3.create(
//           ~name="http://example.com/hello",
//           ~namespace=`Uuid(Uuid.V3._URL),
//         ),
//         "c6235813-3ba4-3801-ae84-e0a6ebb7d138",
//       ),
//       (
//         Uuid.V3.create(
//           ~name="hello",
//           ~namespace=`Uuid("0f5abcd1-c194-47f3-905b-2df7263a084b"),
//         ),
//         "a981a0c2-68b1-35dc-bcfc-296e52ab01ec",
//       ),
//     ];
//     testAll(
//       "should produce the same results as the uuid library tests",
//       tests,
//       ((uuid, asString)) =>
//       Expect.(expect(uuid |> Uuid.V3.toString) |> toBe(asString))
//     );
//     describe("writing to a buffer", () => {
//       /* data from this test https://github.com/kelektiv/node-uuid/blob/master/test/test.js#L143 */
//       let testBuf = [|
//         0x91,
//         0x25,
//         0xa8,
//         0xdc,
//         0x52,
//         0xee,
//         0x36,
//         0x5b,
//         0xa5,
//         0xaa,
//         0x81,
//         0xb0,
//         0xb3,
//         0x68,
//         0x1c,
//         0xf6,
//       |];
//       test("should write to a buffer", () => {
//         open Expect;
//         let buffer = Array.make(16, 0);
//         Uuid.V3.createWithBuffer(
//           ~name="hello.example.com",
//           ~namespace=`Uuid(Uuid.V3._DNS),
//           ~buffer,
//           (),
//         )
//         |> ignore;
//         let bufferContents =
//           testBuf |> Array.mapi((index, _) => buffer[index]);
//         expect(bufferContents) |> toEqual(testBuf);
//       });
//       test("should write to a buffer with an offset", () => {
//         open Expect;
//         let offset = 3;
//         let buffer = Array.make(19, 0);
//         Uuid.V3.createWithBuffer(
//           ~name="hello.example.com",
//           ~namespace=`Uuid(Uuid.V3._DNS),
//           ~buffer,
//           ~offset,
//           (),
//         )
//         |> ignore;
//         let bufferContents =
//           testBuf |> Array.mapi((index, _) => buffer[index + offset]);
//         expect(bufferContents) |> toEqual(testBuf);
//       });
//     });
//   });
//   describe("V4", () => {
//     test("it should create a uuid", () => {
//       open Expect;
//       let uuid = Uuid.V4.create();
//       let lengths =
//         uuid
//         |> Uuid.V4.toString
//         |> Js.String.split("-")
//         |> Array.map(i => String.length(i));
//       expect(lengths) |> toEqual([|8, 4, 4, 4, 12|]);
//     });
//     test("it should create a uuid from bytes", () => {
//       open Expect;
//       let uuid =
//         Uuid.V4.createWithOptions(
//           ~options=
//             Uuid.V4.options(
//               ~random=(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16),
//               (),
//             ),
//         );
//       uuid
//       |> Uuid.V4.toString
//       |> expect
//       |> toBe("01020304-0506-4708-890a-0b0c0d0e0f10");
//     });
//     test("it should create a uuid from a rng function", () => {
//       open Expect;
//       let uuid =
//         Uuid.V4.createWithOptions(
//           ~options=
//             Uuid.V4.options(
//               ~rng=
//                 () => (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16),
//               (),
//             ),
//         );
//       uuid
//       |> Uuid.V4.toString
//       |> expect
//       |> toBe("01020304-0506-4708-890a-0b0c0d0e0f10");
//     });
//     describe("writing to a buffer", () => {
//       test("it should write to a buffer", () => {
//         open Expect;
//         let buffer = Array.make(16, 0);
//         let expected = [|
//           1,
//           2,
//           3,
//           4,
//           5,
//           6,
//           71,
//           8,
//           137,
//           10,
//           11,
//           12,
//           13,
//           14,
//           15,
//           16,
//         |];
//         Uuid.V4.createWithBuffer(
//           ~options=
//             Uuid.V4.options(
//               ~random=(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16),
//               (),
//             ),
//           ~buffer,
//           (),
//         )
//         |> ignore;
//         expect(buffer) |> toEqual(expected);
//       });
//       test("it should write to a buffer at an offset", () => {
//         open Expect;
//         let buffer = Array.make(20, 0);
//         let offset = 3;
//         let expected = [|
//           0,
//           0,
//           0,
//           1,
//           2,
//           3,
//           4,
//           5,
//           6,
//           71,
//           8,
//           137,
//           10,
//           11,
//           12,
//           13,
//           14,
//           15,
//           16,
//           0,
//         |];
//         Uuid.V4.createWithBuffer(
//           ~options=
//             Uuid.V4.options(
//               ~random=(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16),
//               (),
//             ),
//           ~buffer,
//           ~offset,
//           (),
//         )
//         |> ignore;
//         expect(buffer) |> toEqual(expected);
//       });
//     });
//   });
//   describe("V5", () => {
//     let tests = [
//       (
//         Uuid.V5.create(
//           ~name="hello.example.com",
//           ~namespace=`Uuid(Uuid.V5._DNS),
//         ),
//         "fdda765f-fc57-5604-a269-52a7df8164ec",
//       ),
//       (
//         Uuid.V5.create(
//           ~name="http://example.com/hello",
//           ~namespace=`Uuid(Uuid.V5._URL),
//         ),
//         "3bbcee75-cecc-5b56-8031-b6641c1ed1f1",
//       ),
//       (
//         Uuid.V5.create(
//           ~name="hello",
//           ~namespace=`Uuid("0f5abcd1-c194-47f3-905b-2df7263a084b"),
//         ),
//         "90123e1c-7512-523e-bb28-76fab9f2f73d",
//       ),
//     ];
//     testAll(
//       "should produce the same results as the uuid library tests",
//       tests,
//       ((uuid, asString)) =>
//       Expect.(expect(uuid |> Uuid.V5.toString) |> toBe(asString))
//     );
//     describe("writing to a buffer", () => {
//       /* data from this test https://github.com/kelektiv/node-uuid/blob/master/test/test.js#L168 */
//       let testBuf = [|
//         0xfd,
//         0xda,
//         0x76,
//         0x5f,
//         0xfc,
//         0x57,
//         0x56,
//         0x04,
//         0xa2,
//         0x69,
//         0x52,
//         0xa7,
//         0xdf,
//         0x81,
//         0x64,
//         0xec,
//       |];
//       test("should write to a buffer", () => {
//         open Expect;
//         let buffer = Array.make(16, 0);
//         Uuid.V5.createWithBuffer(
//           ~name="hello.example.com",
//           ~namespace=`Uuid(Uuid.V5._DNS),
//           ~buffer,
//           (),
//         )
//         |> ignore;
//         let bufferContents =
//           testBuf |> Array.mapi((index, _) => buffer[index]);
//         expect(bufferContents) |> toEqual(testBuf);
//       });
//       test("should write to a buffer with an offset", () => {
//         open Expect;
//         let offset = 3;
//         let buffer = Array.make(19, 0);
//         Uuid.V5.createWithBuffer(
//           ~name="hello.example.com",
//           ~namespace=`Uuid(Uuid.V5._DNS),
//           ~buffer,
//           ~offset,
//           (),
//         )
//         |> ignore;
//         let bufferContents =
//           testBuf |> Array.mapi((index, _) => buffer[index + offset]);
//         expect(bufferContents) |> toEqual(testBuf);
//       });
//     });
//   });
// });
