# rescript-uuid

Rescript bindings for [uuid](https://www.npmjs.com/package/uuid)


# Install
```
yarn add uuid
yarn add -D rescript-uuid
```
Add it to your bsconfig.json
```
"bs-dependencies": [
    ...
    "rescript-uuid"
],
```

# Example

```
let v1 = Uuid.V1.make();
let v1WithOptions = Uuid.V1.createWithOptions(
    Uuid.V1.options(~msecs=1, ())
);

let v3 = Uuid.V3.make(
    ~name="Test", 
    ~namespace=#Uuid(Uuid.V3._DNS)
);

let v4 = Uuid.V4.make();

let v5 = Uuid.V5.make(
    ~name="Test", 
    ~namespace=#Uuid(Uuid.V5._DNS)
);

```