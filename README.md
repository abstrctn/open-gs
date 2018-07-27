This is an OSX application that registers and responds to the `gs://` protocol, letting you open Google Cloud Storage URIs from a browser or command line in the Google Cloud Console.

It wraps the `https://` protocol, opening your default browser to `https://console.cloud.google.com/storage/browser/<ORIGINAL_URI>`.

## Installation

```bash
git clone git@github.com:abstrctn/open-gs.git
cd open-gs

ln -s $(pwd)/gs.app /Applications/gs.app
```

The first time you open a gs:// link, OSX will ask for confirmation. Check the *Always open these types of links in the associated app* box to prevent the dialog from appearing in the future.

## Details

The portion of the URL after `browser/` must match a directory prefix that exists in the bucket, which will show all files within that directory. The path-based filter will only work on directories, you cannot include a file name as part of the page.

A separate `prefix` querystring can be used to filter the results, and this support filenames. Thus the script attempts to strip filenames by removing everything after the final slash in the URL, and sending it as the `prefix` querystring parameter instead. This process is skipped if the gs url contains only the bucket name without a path.

e.g., `gs://bucket/directory/` -> https://console.cloud.google.com/storage/browser/bucket/directory
e.g., `gs://bucket/directory/file.txt` -> https://console.cloud.google.com/storage/browser/bucket/directory?prefix=file.txt

## Development

`source/main.applescript` contains the source code for the compiled script `gs.app/Contents/Resources/Scripts/main.scpt`. After editing the file in `source`, run `make build` to compile the script into the `.app`.
