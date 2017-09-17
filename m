Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751242AbdIQXss (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Sep 2017 19:48:48 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/5] [KMS-Tests] Kernel log validator and Stress testing
Date: Mon, 18 Sep 2017 00:48:39 +0100
Message-Id: <1505692124-12167-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Hi Laurent,

Here is an initial run on implementing a log validator for the KMS test suite
along with some cleanup patches and a mode-set stress test.

The log validator is implemented as a decorator to the .execute() function such
that it will be called for every test {suite,class} that is run.

Currently it reports the failure using the last run test description which may
be inaccurate if a test module runs multiple tests in a single class.

The validator performs basic string matching against known kernel failure
points. This could be extended to extract specific log failure sections, but
this is likely not required as the tests already log all kernel messages to
their output log file.

Kieran Bingham (5):
  kmstest: Repair pep8 line formatting
  kmstest: Repeir pep8 whitespace errors
  kmstest: Provide a Kernel log validator
  tests: Test the log validator with fake faults
  tests: Add a CRTC mode set stress test

 tests/kms-test-log-validator.py | 111 ++++++++++++++++++++++++++++++++++++++++
 tests/kms-test-stresstest.py    |  76 +++++++++++++++++++++++++++
 tests/kmstest.py                |  27 ++++++++--
 3 files changed, 211 insertions(+), 3 deletions(-)
 create mode 100755 tests/kms-test-log-validator.py
 create mode 100755 tests/kms-test-stresstest.py

-- 
2.7.4
