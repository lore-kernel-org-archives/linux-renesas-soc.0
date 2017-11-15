Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754013AbdKOOif (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 09:38:35 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: niklas.soderlund@ragnatech.se
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PATCH 0/3] [VIN-Tests] minor updates
Date: Wed, 15 Nov 2017 14:38:28 +0000
Message-Id: <1510756711-6488-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Hi Niklas,

Some minor updates to the 8camera-status tool, and a speed up fix for the
vin-tests core function 'mc_get_dev()'.

Kieran Bingham (3):
  tools: 8camera-status: Fix write failure mis-allocations
  tools: 8camera-status: Expand to 9 cameras
  vin-tests: Refactor mc_get_dev

 scripts/vin-tests.sh | 14 +++-----------
 tools/8camera-status | 12 ++++++------
 2 files changed, 9 insertions(+), 17 deletions(-)

-- 
2.7.4
