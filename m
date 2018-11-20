Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58272 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726021AbeKUJkR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 04:40:17 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/3] mmc: refactor RPMB block count handling
Date: Wed, 21 Nov 2018 00:08:29 +0100
Message-Id: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Renesas R-Car SDHI hardware, we sometimes had timeouts accessing the RPMB.
This is because AutoCMD23/12 features needs a properly filled sbc to work
correctly. But RPMB sends an individual CMD23. I could have fixed the driver
but after some research concluded that fixing the core seems the proper thing
to do. I also added some sanity checking while here. Please let me know what
you think.

Tested on a R-Car M3-N. No timeouts showed up anymore. I'll try to improve the
testing, though, to check if I can make the occasional timeouts from before
more reproducible. And then confirm that this patchset improves the situation :)

Wolfram Sang (3):
  mmc: core: validate user input for RPMB block count
  mmc: core: use mrq->sbc when sending CMD23 for RPMB
  mmc: core: remove obsolete mmc_set_blockcount() function

 drivers/mmc/core/block.c | 14 +++++++++-----
 drivers/mmc/core/core.c  | 14 --------------
 drivers/mmc/core/core.h  |  2 --
 3 files changed, 9 insertions(+), 21 deletions(-)

-- 
2.11.0
