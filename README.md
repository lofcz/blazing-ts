[![LlmTornado](https://badgen.net/nuget/v/BlazingTs?v=302&icon=nuget&label=BlazingTs)](https://www.nuget.org/packages/BlazingTs)

# BlazingTS

This is a drop-in replacement for closed-source `Microsoft.Typescript.Msbuild`.

## Getting Started

```
dotnet add package BlazingTs
```

Create the `tsconfig.json` file in your project and build it. BlazingTS will invoke bundled `tsc` during the `BeforeBuild` phase of MS Build and transpile your `ts`/`tsx` into `js`/`jsx` files.
