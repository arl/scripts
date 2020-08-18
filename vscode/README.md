# Go: debug a test function

Most of the time you just want to use the GUI _run test_/_debug test_ buttons
appearing above the test function, but this is useful when your configuration
differs from the _standard_ one, for example:
 - you want *Delve* to step into the `vendor` folder rather than in the module
   cache.
 - you want to pass *Delve* some arguments

```json
    {
        "name": "Launch test function",
        "type": "go",
        "request": "launch",
        "mode": "test",
        "program": "${workspaceFolder}/output",
        "buildFlags": "-mod=vendor",
        "args": [
            "-test.run",
            "TestOrganizerOutputIdempotencyAtSwitchDay/disableCacheCompression=true"
        ],
        "dlvLoadConfig": {
            "followPointers": true,
            "maxVariableRecurse": 1,
            "maxStringLen": 256,
            "maxArrayValues": 256,
            "maxStructFields": -1
        },
    },
``` 
