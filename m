Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47956 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbeK0Acm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 19:32:42 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Avri Altman <Avri.Altman@wdc.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] mmc: refactor RPMB block count handling
Date: Mon, 26 Nov 2018 14:38:12 +0100
Message-Id: <20181126133814.1185-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Renesas R-Car SDHI hardware, we sometimes had timeouts accessing the RPMB.
This is because AutoCMD23/12 features needs a properly filled sbc to work
correctly. But RPMB sends an individual CMD23. I could have fixed the driver
but after some research concluded that fixing the core seems the proper thing
to do. Tested on a R-Car M3-N. No timeouts showed up anymore.

Changes since RFC:

* dropped sanity checks on block count size
* added comment why we don't do sanity checks
* rebased to current mmc/next
* added Tested-tags from Clément, thanks!

Wolfram Sang (2):
  mmc: core: use mrq->sbc when sending CMD23 for RPMB
  mmc: core: remove obsolete mmc_set_blockcount() function

 drivers/mmc/core/block.c | 15 ++++++++++-----
 drivers/mmc/core/core.c  | 14 --------------
 drivers/mmc/core/core.h  |  2 --
 3 files changed, 10 insertions(+), 21 deletions(-)

-- 
2.11.0
