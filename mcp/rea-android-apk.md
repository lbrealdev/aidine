# REA Android APK

REA (`rea-agents` 6.7.0) inspects a local APK. Code and resources are different tools. REA does not install Java, JADX, Apktool, an Android SDK, or an emulator, and it does not download the APK.

Upstream: [morluto/rea](https://github.com/morluto/rea).

## File

REA starts at a filesystem path. Fetching from Google Play is a separate CLI ([apkeep](https://github.com/EFForg/apkeep/blob/master/USAGE-google-play.md)) and is outside this setup.

## JDK

Full JDK 17 or newer, including the compiler module. `JAVA_HOME` may point at it. If unset, REA uses `java` on `PATH`. On Linux, the JADX launch also needs a procps-compatible `ps` on `PATH`.

## Code

REA does not use a `jadx` binary on `PATH`. It wants the pinned JAR `jadx-headless-mcp` 0.7.1.

- URL: `https://github.com/1013503897/jadx-headless-mcp/releases/download/v0.7.1/jadx-headless-mcp-0.7.1-all.jar`
- SHA-256: `6e5eacf500b64292bfb73c49797c1958f6ee44646e43e868039ae7feb573ff75`
- `REA_JADX_MCP_JAR` is the absolute path to that JAR, in the shell or in the MCP server environment.

Readiness checks the JAR zip and the JDK modules. It does not open an APK. APK signature verification is not performed.

| CLI | MCP |
| --- | --- |
| `rea inspect-android-package PATH` | `inspect_android_package` |
| `rea search-android-classes PATH NAME` | `search_android_classes` |
| `rea inspect-android-class PATH CLASS` | `inspect_android_class` |
| `rea inspect-android-method PATH CLASS METHOD` | `inspect_android_method` |
| `rea trace-android-references PATH CLASS` | `trace_android_references` |

Method calls take an optional overload index. An ambiguous method is rejected. If Java decompilation omits a body, REA can return that method's smali and mark `java_body_unavailable`. Native and abstract methods come back with `body_status: "not_available"`. Static initializers (`<clinit>`) come back as smali.

Upstream records the class-page bridge on Linux x86-64 with Temurin 21, and on Windows x64 with JDK 21 and this JAR. Windows arm64 is outside this provider.

## Resources

Apktool decodes the binary manifest, string tables, locales, and version. REA calls it with `--no-src`, so smali is skipped. Code stays with JADX.

Apktool 2.7.0 or newer. Upstream verified 2.7.0 and 3.0.3. Put `apktool` on `PATH`, or set `REA_APKTOOL_COMMAND` to the launcher.

```shell
rea inspect-apktool-client
```

That prints the version. It does not install Apktool.

Those versions still run. The doc discloses advisories: before 2.9.2 (all hosts, CVE-2024-21633), before 2.9.3 (Windows, GHSA-vgwr-4w3p-xmjv), and the 3.0.0 line before 3.0.2 (CVE-2026-39973). Prefer a build outside those windows for an untrusted APK. The floor 2.7.0 is compatibility, not a security recommendation.

```shell
rea decode-android-resources PATH
```

MCP name: `decode_android_resources`. A locale such as `pt-BR` selects Android's `values-pt-rBR`. The decode deadline is 600 seconds. Captured output is capped at 4 MiB.

## Order

1. Local APK path.
2. JDK 17+.
3. Pinned JADX JAR plus `REA_JADX_MCP_JAR`.
4. Apktool 2.7.0 or newer, outside the advisory windows when the file is untrusted.
5. Restart the agent that holds the REA MCP process so it sees `JAVA_HOME` and `REA_JADX_MCP_JAR`.
6. Ask for one behavior. Package and class commands answer code. The resource command answers strings, locales, and version.

## Agent

Registering the client does not install the JDK, the JAR, or Apktool. Review the plan before dropping `--dry-run`.

```shell
npx -y rea-agents@6.7.0 setup --client hermes --dry-run
npx -y rea-agents@6.7.0 setup --client opencode --dry-run
```

## Links

- [Android analysis](https://github.com/morluto/rea/blob/main/docs/android-analysis.md)
- [Apktool resources](https://github.com/morluto/rea/blob/main/docs/apktool-resource-analysis.md)
- [Repo](https://github.com/morluto/rea)
