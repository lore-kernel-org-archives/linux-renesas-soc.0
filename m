Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751162AbdHWWlK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2017 18:41:10 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/2] vsp-tests: Shell compatibility
Date: Wed, 23 Aug 2017 23:41:02 +0100
Message-Id: <1503528064-10454-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Update the vsp-tests to source the vsp-lib.sh with an explicit path, and
use the POSIX compliant '.' rather than 'source'.

Also update the README to document new requirements.

Kieran Bingham (2):
  tests: Use POSIX '.' as 'source'
  README: Document need for killall command

 README                      | 2 +-
 tests/vsp-unit-test-0001.sh | 2 +-
 tests/vsp-unit-test-0002.sh | 2 +-
 tests/vsp-unit-test-0003.sh | 2 +-
 tests/vsp-unit-test-0004.sh | 2 +-
 tests/vsp-unit-test-0005.sh | 2 +-
 tests/vsp-unit-test-0006.sh | 2 +-
 tests/vsp-unit-test-0007.sh | 2 +-
 tests/vsp-unit-test-0008.sh | 2 +-
 tests/vsp-unit-test-0009.sh | 2 +-
 tests/vsp-unit-test-0010.sh | 2 +-
 tests/vsp-unit-test-0011.sh | 2 +-
 tests/vsp-unit-test-0012.sh | 2 +-
 tests/vsp-unit-test-0013.sh | 2 +-
 tests/vsp-unit-test-0014.sh | 2 +-
 tests/vsp-unit-test-0015.sh | 2 +-
 tests/vsp-unit-test-0016.sh | 2 +-
 tests/vsp-unit-test-0017.sh | 2 +-
 tests/vsp-unit-test-0018.sh | 2 +-
 tests/vsp-unit-test-0019.sh | 2 +-
 tests/vsp-unit-test-0020.sh | 2 +-
 tests/vsp-unit-test-0021.sh | 2 +-
 tests/vsp-unit-test-0022.sh | 2 +-
 tests/vsp-unit-test-0023.sh | 2 +-
 24 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.7.4
