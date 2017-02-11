Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <SRS0=zE3d=ZY=ideasonboard.com=kieran.bingham+renesas@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Subject: [PATCH 0/2] vsp-tests: Provide stress testing
Date: Sat, 11 Feb 2017 14:43:04 +0000
Message-Id: <1486824186-26450-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Add two extra tests utilising the 'stress' command utilty.

These tests wrap existing test functionality whilst holding the system under
arbitrary heavy load

Kieran Bingham (2):
  tests: Add basic stress testing
  tests: Add extended stress testing

 tests/vsp-unit-test-0022.sh | 55 ++++++++++++++++++++++++++++++++++++++++
 tests/vsp-unit-test-0023.sh | 61 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100755 tests/vsp-unit-test-0022.sh
 create mode 100755 tests/vsp-unit-test-0023.sh

-- 
2.7.4
