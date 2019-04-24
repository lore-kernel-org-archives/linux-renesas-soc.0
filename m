Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EF4C282CE
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 16:16:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B119F208E4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 16:16:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731056AbfDXQQl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 12:16:41 -0400
Received: from sauhun.de ([88.99.104.3]:35052 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726611AbfDXQQj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 12:16:39 -0400
Received: from localhost (p54B3304D.dip0.t-ipconnect.de [84.179.48.77])
        by pokefinder.org (Postfix) with ESMTPSA id 4BF252CF606;
        Wed, 24 Apr 2019 18:16:38 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     skidnik <skidnik@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT] i2c: designware: ratelimit 'transfer when suspended' errors
Date:   Wed, 24 Apr 2019 18:16:32 +0200
Message-Id: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are two problems with dev_err() here. One: It is not ratelimited.
Two: We don't see which driver tried to transfer something with a
suspended adapter. Switch to dev_WARN_ONCE to fix both issues. Drawback
is that we don't see if multiple drivers are trying to transfer while
suspended. They need to be discovered one after the other now. This is
better than a high CPU load because a really broken driver might try to
resend endlessly.

Link: https://bugs.archlinux.org/task/62391
Fixes: 275154155538 ("i2c: designware: Do not allow i2c_dw_xfer() calls while suspended")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

skdnik: Would you be so kind and test this patch? I can only build-test here.

I have a prototype to fix the similar issue in the core, but this needs more
testing first, so I am sending this one out already.

 drivers/i2c/busses/i2c-designware-master.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index bb8e3f149979..d464799e40a3 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -426,8 +426,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	pm_runtime_get_sync(dev->dev);
 
-	if (dev->suspended) {
-		dev_err(dev->dev, "Error %s call while suspended\n", __func__);
+	if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
 		ret = -ESHUTDOWN;
 		goto done_nolock;
 	}
-- 
2.11.0

