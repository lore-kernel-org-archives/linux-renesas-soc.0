Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E41C4332F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Oct 2022 07:12:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiJLHM6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Oct 2022 03:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiJLHMr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 03:12:47 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7873FAE229
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 00:12:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:3da6:62e6:8ab0:ff90])
        by andre.telenet-ops.be with bizsmtp
        id WvCd2800R32x5mf01vCd2M; Wed, 12 Oct 2022 09:12:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oiVuv-001M7Z-Bj; Wed, 12 Oct 2022 09:12:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oiVuu-007fp3-Qz; Wed, 12 Oct 2022 09:12:36 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779g0/white-hawk: Add SDHI/eMMC support
Date:   Wed, 12 Oct 2022 09:12:32 +0200
Message-Id: <cover.1665558371.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds SDHI support for the R-Car V4H SoC, and eMMC
support for the White Hawk board.

    renesas_sdhi_internal_dmac ee140000.mmc: mmc0 base at 0x00000000ee140000, max clock rate 200 MHz
    mmc0: new HS400 MMC card at address 0001
    mmcblk0: mmc0:0001 G1M15L 29.6 GiB
    mmcblk0boot0: mmc0:0001 G1M15L 31.5 MiB
    mmcblk0boot1: mmc0:0001 G1M15L 31.5 MiB
    mmcblk0rpmb: mmc0:0001 G1M15L 4.00 MiB, chardev (246:0)

The White Hawk CPU board also has a µSD-slot, which is mutually
exclusive with the eMMC, and obstructed by a pin header on the BreakOut
Board.  Hence accessing it requires removing the CPU board, which is a
task I haven't undertaken.

I plan to queue these in renesas-devel for v6.2.
Thanks for your comments!

Geert Uytterhoeven (1):
  arm64: dts: renesas: r8a779g0: Add SDHI node

Takeshi Kihara (1):
  arm64: dts: renesas: white-hawk-cpu: Add eMMC support

 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 41 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 14 +++++++
 2 files changed, 55 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
