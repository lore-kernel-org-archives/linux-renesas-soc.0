Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3CBC282E1
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4DB8217D7
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 09:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728432AbfDYJzr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 05:55:47 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:58860 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbfDYJzq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 05:55:46 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id 4Zvk200053XaVaC01ZvkeZ; Thu, 25 Apr 2019 11:55:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJb6V-0003Wn-TA; Thu, 25 Apr 2019 11:55:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJb6V-0000CW-Qy; Thu, 25 Apr 2019 11:55:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] pinctrl: sh-pfc: Run-time debug code fixes and enhancements
Date:   Thu, 25 Apr 2019 11:55:38 +0200
Message-Id: <20190425095542.726-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Linus,

This patch series contains several fixes and enhancements for the
debug code to validate pinctrl tables at run-time.

I intend to queue this in sh-pfc-for-v5.3.

Thanks for your comments!

Geert Uytterhoeven (4):
  pinctrl: sh-pfc: Correct printk level of group referral warning
  pinctrl: sh-pfc: Mark run-time debug code __init
  pinctrl: sh-pfc: Add check for empty pinmux groups/functions
  pinctrl: sh-pfc: Validate pin tables at runtime

 drivers/pinctrl/sh-pfc/core.c | 60 +++++++++++++++++++++++++++++------
 1 file changed, 50 insertions(+), 10 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
