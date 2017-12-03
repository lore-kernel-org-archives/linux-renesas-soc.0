Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53664 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750854AbdLCKzr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Dec 2017 05:55:47 -0500
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id D8BAE20218
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Dec 2017 11:54:02 +0100 (CET)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] kms-tests: Add CRC test
Date: Sun,  3 Dec 2017 12:55:52 +0200
Message-Id: <20171203105554.10416-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This small patch series adds a CRC computation test to the DU test suite.

The test is currently quite limited as it only captures the CRC at the output
of the pipeline for multiple frames and verifies that the CRC values match.
This is enough to exercise the DRM/KMS CRC API to test the driver's CRC
implementation, but more functional tests should be added later.

The kernel code is available at

	git://linuxtv.org/pinchartl/media.git vsp1-discom-v1-201712

Laurent Pinchart (2):
  kmstest.py: Add CRC reader class
  tests: crc: Add CRC computation test

 tests/kms-test-crc.py | 103 ++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/kmstest.py      |  55 +++++++++++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100755 tests/kms-test-crc.py

-- 
Regards,

Laurent Pinchart
