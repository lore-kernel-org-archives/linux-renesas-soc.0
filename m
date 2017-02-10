Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=Wi0l=ZX=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH v2 0/4] vsp-tests: Implement RPF cropping tests
Date: Fri, 10 Feb 2017 13:30:04 +0000
Message-Id: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Update the gen-image utility such that it can crop the image at input,
and provide tests to ensure that the output of the RPF is as we expect.

v2:
 - rebased on master branch
 - review comments fixed
 - vsp-unit-test-0021.sh description fixed

Kieran Bingham (4):
  vsp-lib: Filter non-filesystem regular characters
  gen-image: Implement option to parse an input crop
  vsp-lib: Support RPF frame cropping
  tests: Add RPF cropping test

 scripts/vsp-lib.sh          |  55 ++++++++++++---
 src/gen-image.c             | 132 +++++++++++++++++++++++++++++++++++++-
 tests/vsp-unit-test-0021.sh |  36 ++++++++++-
 3 files changed, 213 insertions(+), 10 deletions(-)
 create mode 100755 tests/vsp-unit-test-0021.sh

base-commit: 8d7af82da291e16c770040c857f6d5cb43590df1
-- 
git-series 0.9.1
