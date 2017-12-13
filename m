Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750819AbdLMXKR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 18:10:17 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/4] kms++util: Provide validation helpers
Date: Wed, 13 Dec 2017 23:10:08 +0000
Message-Id: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Our kms-tests test suite for verifying the R-Car DU is based on kmsxx.

We are implementing a 'loop-back' validator, by providing an HDMI cable from
the display output directly into the HDMI receiver on the same development
board.

By using the existing VideoStreamer and pyvid objects, we can capture the output
and compare to provide automated display validation.

As an effort to commence this process, this series implements a basic frame
buffer comparison, which expects identical frame sizes to operate.

This could be could be expanded upon later to provide a more detailed
comparison at the pixel level later, but this serves as an initial starting
point to quickly verify if the data captured matches the data that we expected.

Kieran Bingham (4):
  videodevice: Fix minor spacing
  py: pyvid: Provide stream_off binding
  kms++util: Add verification module
  kms++util: Add frame compare functionality

 kms++util/inc/kms++util/kms++util.h |  3 ++-
 kms++util/src/verification.cpp      | 52 ++++++++++++++++++++++++++++++-
 kms++util/src/videodevice.cpp       |  2 +-
 py/pykms/pykmsutil.cpp              |  7 ++++-
 py/pykms/pyvid.cpp                  |  1 +-
 5 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 kms++util/src/verification.cpp

base-commit: fee73296cae1a4984e18c8d8ee8e50ab217b1e4a
-- 
git-series 0.9.1
