Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34907 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751342AbdHXJaQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 05:30:16 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/3] vsp-tests: Add BRS test
Date: Thu, 24 Aug 2017 12:30:40 +0300
Message-Id: <20170824093043.8606-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series adds a test to the VSP unit test suite for the BRS module.

The BRS is the Blend/ROP Secondary unit, a stripped-down version of the BRU
that supports two inputs only. It is present in some VSPD instances, in
particular on the H3 ES2.0.

As the VSPD is used for display pipelines only the BRS can't be tested through
the V4L2 API with the upstream VSP driver. A simple hack that exposes the VSPD
through V4L2 is needed.

Laurent Pinchart (3):
  vsp-lib: Use the correct media device name to count BRU inputs
  vsp-lib: Add support for RPF-BRS-WPF pipelines
  tests: Add BRS test

 scripts/vsp-lib.sh          | 63 +++++++++++++++++++++++++++++++--------------
 tests/vsp-unit-test-0024.sh | 45 ++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 20 deletions(-)
 create mode 100755 tests/vsp-unit-test-0024.sh

-- 
Regards,

Laurent Pinchart
