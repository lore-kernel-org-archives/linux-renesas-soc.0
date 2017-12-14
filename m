Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750737AbdLNAZO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 19:25:14 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Cc: Kieran Bingham <kieran@ksquared.org.uk>
Subject: [RFC PATCH 0/3] [RFC] Video HDMI Loop-back Test
Date: Thu, 14 Dec 2017 00:25:06 +0000
Message-Id: <cover.417c1b91fc9842fb290756d5ad23bdc16970b1e1.1513211056.git-series.kieran@bingham.xyz>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran@bingham.xyz>

This short series works towards providing automated system validation by
introducing the ability to capture frames using the R-Car VIN device with an
HDMI cable connected to our HDMI output of the DU.

To support this test, relevant patches and support must be provided by kmsxx
which has been posted separately [0]:
 [PATCH 0/4] kms++util: Provide validation helpers

This series provides an rcar_vin module to assist in detecting and identifying
the correct video device to use for the video capture device.

The rcar_vin module provides a lot of code which is not used specifically by
the following kms-test-vin-loopback test but is kept in the module as an RFC
and to stimulate discussion on implementing convenient helpers to wrap our
R-Car interfaces in python modules, especially as so much platform knowledge is
required to set up a capture.

Finally the VIN loopback test is added which uses two pre-filled display
buffers to simulate an active running display but with constant content.

The display output is then captured by setting up a VideoDevice interface and
registering a handler (handle_frame_capture) to process buffers when the are
presented by the VIN driver.

The captured frames are compared against the constant output buffer - and
written to file in the event that there are any differences to allow for visual
inspection and analysis.

This test currently highlights potential colour space conversion issues in YUYV
pipelines, and a non-determined error in ARGB configured pipelines which will
be investigated separately.

Further future possibilities here:
 - Automatically configure the media device and links with a media-ctl abstraction
 - Add meta-data into the output frames so that they can be correctly matched
   against incoming captured frames. (I'm thinking adding a QR code to each frame)

--
Regards

Kieran

[0] https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg21303.html

Kieran Bingham (3):
  kms-tests: Provide .gitignore
  rcar_vin: Provide VIN configuration helpers
  tests: Add a DU->VIN loopback test

 .gitignore                     |   4 +-
 tests/kms-test-vin-loopback.py | 198 ++++++++++++++++++++++++++++++++++-
 tests/rcar_vin.py              | 107 ++++++++++++++++++-
 3 files changed, 309 insertions(+)
 create mode 100644 .gitignore
 create mode 100755 tests/kms-test-vin-loopback.py
 create mode 100755 tests/rcar_vin.py

base-commit: 724e38e6c5f511030d7cbdcd40ccc3d0f8749981
-- 
git-series 0.9.1
