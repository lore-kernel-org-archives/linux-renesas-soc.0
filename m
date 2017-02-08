Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=o/Yn=ZV=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH 0/5] vsp-tests: Implement RPF cropping tests
Date: Wed,  8 Feb 2017 14:03:55 +0000
Message-Id: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Update the gen-image utility such that it can crop the image at input,
and provide tests to ensure that the output of the RPF is as we expect.

The first patch in the series, reformats the output filenames such that
frames, and the correct reference frame are in the correct sort order in
the filesystem. This helps with comparing the output in case of errors

Kieran Bingham (5):
  vsp-lib: sort output frames correctly
  vsp-lib: Filter non-filesystem regular characters
  gen-image: Implement option to parse an input crop
  vsp-lib: Support RPF frame cropping
  tests: Add RPF cropping test

 scripts/vsp-lib.sh          |  44 ++++++++++++++-
 src/gen-image.c             | 106 +++++++++++++++++++++++++++++++++++++-
 tests/vsp-unit-test-0021.sh |  39 ++++++++++++++-
 3 files changed, 187 insertions(+), 2 deletions(-)
 create mode 100755 tests/vsp-unit-test-0021.sh

base-commit: 067d210716b282f7e5ecede5a33c7f7fdabd1358
-- 
git-series 0.9.1
