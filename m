Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751370AbdION34 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 09:29:56 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/2] [KMS-Tests] Provide Suspend Resume tests for DU
Date: Fri, 15 Sep 2017 14:29:50 +0100
Message-Id: <1505482192-23896-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Provide testing for each connector on the DU as provided by the DRM framework.

The test ensures that frames are being actively flipped both before and after
a suspend resume cycle utilising the CONFIG_PM_DEBUG framework.

I think there is scope to further abstract the 'PageFlipper' object to its own
module, and separate out the functionality such that it can be shared with
other modules as this will be a common task.

The PageFlipper object is of course heavily based upon the PageFlip test.

These patches have been pushed to a repository available at:
	https://github.com/kbingham/kms-tests.git

Kieran Bingham (2):
  tests/kmstest: Status functions return themselves.
  tests: Test suspend and resume on active pipelines

 tests/kms-test-suspend-resume.py | 189 +++++++++++++++++++++++++++++++++++++++
 tests/kmstest.py                 |   3 +
 2 files changed, 192 insertions(+)
 create mode 100755 tests/kms-test-suspend-resume.py

-- 
2.7.4
