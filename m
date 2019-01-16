Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148EBC43612
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 15:37:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E247320675
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 15:37:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404984AbfAPPhz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 10:37:55 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:34880 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404991AbfAPPhz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 10:37:55 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id R3ds1z00k3XaVaC063dtCK; Wed, 16 Jan 2019 16:37:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gjnGK-0007jf-Tk; Wed, 16 Jan 2019 16:37:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gjl7r-0001l3-9D; Wed, 16 Jan 2019 14:20:59 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: Print pin group when debugging
Date:   Wed, 16 Jan 2019 14:20:58 +0100
Message-Id: <20190116132058.6716-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Knowing which pin group is being configured is useful information when
debugging pin configuration.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.1.

 drivers/pinctrl/sh-pfc/pinctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index 274d5ff870786457..c97d2ba7677c91e9 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -347,6 +347,8 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 	unsigned int i;
 	int ret = 0;
 
+	dev_dbg(pctldev->dev, "Configuring pin group %s\n", grp->name);
+
 	spin_lock_irqsave(&pfc->lock, flags);
 
 	for (i = 0; i < grp->nr_pins; ++i) {
-- 
2.17.1

