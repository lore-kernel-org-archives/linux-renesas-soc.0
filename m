Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:54930 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752472AbeESUeI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 May 2018 16:34:08 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com
Subject: [PATCH 0/2] vsp-tests: Fix suspend/resume test
Date: Sat, 19 May 2018 23:34:24 +0300
Message-Id: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This small series fixes the VSP suspend/resume test to ensure that the
VSP is running when suspending. The first patch isn't strictly required,
but was helpful when debugging the second patch, so I've included it in
the series.

Laurent Pinchart (2):
  vsp-lib: Capture the kernel log messages in test log files
  tests: suspend/resume: Increase number of processed frames

 scripts/vsp-lib.sh          |  5 +++++
 tests/vsp-unit-test-0020.sh | 15 ++++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)

-- 
Regards,

Laurent Pinchart
