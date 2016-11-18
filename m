Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:33576 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751816AbcKRKYV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 05:24:21 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: r8a7743/r8a7745: Move RST nodes before SYSC nodes
Date: Fri, 18 Nov 2016 11:24:21 +0100
Message-Id: <1479464663-19054-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series moves the RST nodes in the recently added RZ/G DTS
files before the SYSC nodes, to preserve both alphabetical (label) and
numerical ordering (unit address).

Thanks for applying!

Geert Uytterhoeven (2):
  ARM: dts: r8a7743: Move RST node before SYSC node
  ARM: dts: r8a7745: Move RST node before SYSC node

 arch/arm/boot/dts/r8a7743.dtsi | 10 +++++-----
 arch/arm/boot/dts/r8a7745.dtsi | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
