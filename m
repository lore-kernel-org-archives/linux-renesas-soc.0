Return-Path: <SRS0=E5el=C2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C457C43461
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Sep 2020 13:26:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC8EB2072E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Sep 2020 13:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgIQNZp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbgIQNWD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 09:22:03 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F79C061756
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2020 06:21:22 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id V1MK2300Y4C55Sk011MKYt; Thu, 17 Sep 2020 15:21:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kItqh-0000kM-Qj; Thu, 17 Sep 2020 15:21:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kItqh-0002EF-Od; Thu, 17 Sep 2020 15:21:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: Fix MSIOF1 DMA channels
Date:   Thu, 17 Sep 2020 15:21:15 +0200
Message-Id: <20200917132117.8515-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

According to Technical Update TN-RCT-S0352A/E, MSIOF1 DMA can only be
used with SYS-DMAC0 on some SoCs.  This patch series fixes the DTS files
for the affected SoCs,

I have tested this on Ebisu/4D with R-Car E3 using spidev_test and DT
overlays
  - r8a77990-msiof1-dmac0-spidev.dtso
  - r8a77990-msiof1-dmac1-spidev-bad.dtso
  - r8a77990-msiof1-dmac2-spidev-bad.dtso
from
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

The bad ones fail with:

    spi_sh_msiof e6ea0000.spi: failed to start hardware
    spidev spi0.0: SPI transfer failed: -110

I intend to queue these in renesas-devel for v5.10.

Thanks for your comments!

Geert Uytterhoeven (2):
  arm64: dts: renesas: r8a77990: Fix MSIOF1 DMA channels
  arm64: dts: renesas: r8a774c0: Fix MSIOF1 DMA channels

 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 5 ++---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
