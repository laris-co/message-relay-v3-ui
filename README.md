# message-relay-v3-ui

The web UI of [message-relay-v3](https://github.com/laris-co/message-relay-v3): Chats, Stream, Endpoints
(React + the PocketBase JS SDK). Released on its own, so the UI updates without a new add-on image.

```
bun install && bun run dev      # against a relay on http://127.0.0.1:8789
bun test && bun run build       # dist/
scripts/release.sh v0.2.0    # tag + GitHub release with dist.zip
```

**Update a running relay.** Add-on option `ui_version`: `latest`, a tag (`v0.2.0`), or a full URL of a
`dist.zip`. Restart the add-on: it downloads that build at start. If the download fails it keeps the
last one it loaded, else the build inside the image.
