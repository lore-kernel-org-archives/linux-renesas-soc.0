Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31CAC10F03
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 10:03:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3E74217D7
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 10:03:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbfDYJ7t (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 05:59:49 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:39434 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729204AbfDYJ7t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 05:59:49 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id 4Zzn200103XaVaC01ZzoVQ; Thu, 25 Apr 2019 11:59:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJbAR-0003XY-Tn; Thu, 25 Apr 2019 11:59:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hJbAR-0000L8-SG; Thu, 25 Apr 2019 11:59:47 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] pinctrl: sh-pfc: Miscellaneous improvements
Date:   Thu, 25 Apr 2019 11:59:43 +0200
Message-Id: <20190425095946.1259-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Linus,

This patch series contains miscellaneous improvements to the Renesas pin
control source code base.  None of these have any impact on the
resulting binary.

I intend to queue this in sh-pfc-for-v5.3.

Thanks for your comments!


Geert Uytterhoeven (3):
  pinctrl: sh-pfc: Rename 2-parameter CPU_ALL_PORT() variant
  pinctrl: sh-pfc: Add SH_PFC_PIN_CFG_PULL_UP_DOWN shorthand
  pinctrl: sh-pfc: Move PIN_NONE to shared header file

 drivers/pinctrl/sh-pfc/pfc-r8a73a4.c     |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c     |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c    |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c     | 78 ++++++++++----------
 drivers/pinctrl/sh-pfc/pfc-r8a7779.c     |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c     |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c     |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7792.c     |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c     |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 67 ++++++++---------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 67 ++++++++---------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 69 +++++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 69 +++++++++--------
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    |  2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    | 94 ++++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    |  2 +-
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c      |  2 +-
 drivers/pinctrl/sh-pfc/pfc-sh7734.c      |  2 +-
 drivers/pinctrl/sh-pfc/pinctrl.c         |  3 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h          | 10 ++-
 21 files changed, 235 insertions(+), 248 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
