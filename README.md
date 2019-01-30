Dockerfile to install [aquatone](https://github.com/michenriksen/aquatone) (the go version) and [Chromium (headless)](https://www.chromium.org/getting-involved/download-chromium).  More info about Aquatone on [Michael Henriksen's blog](https://michenriksen.com/blog/aquatone-now-in-go/).

This docker image does not recompile Aquatone or Chromium, it installs the binaries of each.

Can be used as so:

    echo 'www.cnn.com' | docker run -v ~/scratch/aquatone:/output --rm -i youngderekm/aquatone -out /output

    # report and all output is now available in ~/scratch/aquatone

This project is licensed under the terms of the MIT license.
