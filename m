Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:48676 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753768AbdHWL73 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2017 07:59:29 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 0/2] ARM: dts: r8a7791: CPG/MSSR conversion fallout
Date: Wed, 23 Aug 2017 13:59:24 +0200
Message-Id: <1503489566-9423-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

Here are the two remaining patches from the series "[PATCH v2 0/5] ARM:
dts: rcar-gen2: Convert to new CPG/MSSR bindings" and "[PATCH v2 0/4] ARM:
dts: rcar-gen2: Stop grouping clocks under a "clocks" subnode", rebased
against renesas-devel-20170822-v4.13-rc6 (actually no changes at all!).

Thanks for applying!

Geert Uytterhoeven (2):
  ARM: dts: r8a7791: Convert to new CPG/MSSR bindings
  ARM: dts: r8a7791: Stop grouping clocks under a "clocks" subnode

 arch/arm/boot/dts/r8a7791-koelsch.dts |   4 +-
 arch/arm/boot/dts/r8a7791-porter.dts  |   4 +-
 arch/arm/boot/dts/r8a7791.dtsi        | 672 ++++++++--------------------------
 3 files changed, 159 insertions(+), 521 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
