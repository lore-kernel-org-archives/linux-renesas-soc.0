Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from newton.telenet-ops.be ([195.130.132.45]:37922 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752000AbdBIKT4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2017 05:19:56 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 3vJvFw5lnyzMyYh1
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Feb 2017 11:19:48 +0100 (CET)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: shmobile: Remove ARCH_SHMOBILE_MULTI
Date: Thu,  9 Feb 2017 11:18:47 +0100
Message-Id: <1486635529-6636-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series completes the migration from ARCH_SHMOBILE_MULTI to
ARCH_RENESAS, which was started by commit 9b5ba0df4ea4 ("ARM: shmobile:
Introduce ARCH_RENESAS").

Thanks for applying!

Geert Uytterhoeven (2):
  ARM: dts: renesas: Switch from ARCH_SHMOBILE_MULTI to ARCH_RENESAS
  ARM: shmobile: Remove ARCH_SHMOBILE_MULTI

 arch/arm/boot/dts/Makefile     | 38 +++++++++++++++++++-------------------
 arch/arm/mach-shmobile/Kconfig |  4 ----
 2 files changed, 19 insertions(+), 23 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
