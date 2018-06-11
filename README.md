This is an OSX application that registers and responds to the `gs://` protoco, letting you open Google Cloud Storage URIs from a browser or command line in the Google Cloud Console.

It wraps the `https://` protcol, opening your default browser to `https://console.cloud.google.com/storage/browser/<ORIGINAL_URI>`.

## Installation

```bash
git clone git@github.com:abstrctn/open-gs.git
cd open-gs

ln -s $(pwd)/gs.app /Applications/gs.app
```

The first time you open a gs:// link, OSX will ask for confirmation. Check the *Always TK* link to prevent the dialog from appearing in the future.

## Development

The `gs.app/Contents/Resources/Scripts/main.scpt` file is compiled, so you will need to open `gs.app` in the AppleScript editor to modify it.
