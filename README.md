[![LlmTornado](https://badgen.net/nuget/v/BlazingTs?v=303&icon=nuget&label=BlazingTs)](https://www.nuget.org/packages/BlazingTs)

# BlazingTS

This is a drop-in, FOSS replacement for `Microsoft.Typescript.Msbuild`.

## Getting Started

```
dotnet add package BlazingTs
```

Create the `tsconfig.json` file in your project and build it. BlazingTS will invoke bundled `tsc` during the `BeforeBuild` phase of MSBuild and transpile your `ts`/`tsx` into `js`/`jsx` files.

## Information

BlazingTS targets `netstandard2.0`, hence, it's compatible with almost any version of .NET Core / .NET Framework. The library is cross-platform, supporting Linux, Windows, and MacOS. A GitHub action automatically updates the library, checking for a new release of TypeScript (on NPM) daily. If a new version is released, the library is updated automatically and a new release on NuGet is created. Therefore, new versions of TypeScript are available immediately, unlike `Microsoft.Typescript.Msbuild` which is updated manually by a maintainer, resulting in a significant delay/skipping of (minor) releases altogether.

## License

This library is licensed under the [MIT](https://github.com/lofcz/blazing-ts/blob/master/LICENSE) license.
