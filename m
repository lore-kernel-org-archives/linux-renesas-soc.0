Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33612 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbeLDPvy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 10:51:54 -0500
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [VSP-Tests PATCH 0/7] Reset controls and unloved patches
Date: Tue,  4 Dec 2018 15:51:39 +0000
Message-Id: <20181204155146.9726-1-kieran.bingham@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Update the VSP-Test suite library to use yavta's (new) --reset-controls
feature to ensure each test starts with a clean environment.

This prevents tests being affected by previous settings to controls such
as rotate or flip.

Also, the series reposts other unloved patches which have gone either
un-reviewed or are still not yet integrated.


Kieran Bingham (7):
  tests: add pseudo platform test
  tests: Provide copy test to validate 1xN streams
  vsp-lib: Provide command line argument parsing
  vsp-lib: trivial: Fix spelling of Reference
  vsp-lib: Allow forcing pixel perfect comparisons
  vsp-lib: Support late queuing of buffers in yavta
  vsp-lib: Reset controls to defaults on each test run

 scripts/vsp-lib.sh          | 62 +++++++++++++++++++++++++++++++++++--
 tests/vsp-unit-test-0000.sh | 20 ++++++++++++
 tests/vsp-unit-test-0025.sh | 45 +++++++++++++++++++++++++++
 3 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100755 tests/vsp-unit-test-0000.sh
 create mode 100755 tests/vsp-unit-test-0025.sh

-- 
2.17.1
