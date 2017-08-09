Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33411 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751523AbdHITO7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 15:14:59 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFT 0/2] mmc: renesas_sdhi: small patches for RZ/A1
Date: Wed,  9 Aug 2017 21:14:50 +0200
Message-Id: <20170809191452.5254-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Here is a small series to improve RZ support for SDHI. I don't have that
platform currently, so I hope Chris has some time to check these simple
patches. It is based on top of the patch just sent out:
"[PATCH] mmc: renesas_sdhi: use extra flag for CBSY usage"

Regards,

   Wolfram


Wolfram Sang (2):
  mmc: renesas_sdhi: enably CBSY bit for RZ platform
  mmc: renesas_sdhi: document version of RZ/A1 instance

 drivers/mmc/host/renesas_sdhi_core.c     | 1 +
 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.11.0
