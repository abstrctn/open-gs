This is an OSX application that registers and responds to the `gs://` protocol, letting you open Google Cloud Storage URIs from a browser or command line in the Google Cloud Console.

It wraps the `https://` protocol, opening your default browser to `https://console.cloud.google.com/storage/browser/<ORIGINAL_URI>`.

## Details

The portion of the URL after `browser/` must match a directory prefix that exists in the bucket, which will show all files within that directory. You cannot include a file name as part of the page.

Thus the script attempts to strip filenames by removing everything after the final slash in the URL, and sending it as the `prefix` querystring parameter instead. This will filter the results down to only the file you requested. This process is skipped if the gs url ends in a slash.

e.g., `gs://bucket/directory/` -> https://console.cloud.google.com/storage/browser/bucket/directory
e.g., `gs://bucket/directory/file.txt` -> https://console.cloud.google.com/storage/browser/bucket/directory?prefix=file.txt

## Installation

```bash
git clone git@github.com:abstrctn/open-gs.git
cd open-gs

ln -s $(pwd)/gs.app /Applications/gs.app
```

The first time you open a gs:// link, OSX will ask for confirmation. Check the *Always open these types of links in the associated app* box to prevent the dialog from appearing in the future.

## Development

`source/main.applescript` contains the source code for the compiled script `gs.app/Contents/Resources/Scripts/main.scpt`. After editing the file in `source`, run `make build` to compile the script into the `.app`.
