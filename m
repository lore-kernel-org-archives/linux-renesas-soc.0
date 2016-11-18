Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:36580 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752502AbcKRKhl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 05:37:41 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: r8a7743/r8a7745: Add device nodes for PRR
Date: Fri, 18 Nov 2016 11:37:41 +0100
Message-Id: <1479465463-19572-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series adds the device nodes for the Product Register to the
recently added RZ/G DTS files, which allow to provide SoC product
and revision information.

This depends on "[PATCH 0/2] ARM: dts: r8a7743/r8a7745: Move RST nodes
before SYSC nodes".

Thanks!

Geert Uytterhoeven (2):
  ARM: dts: r8a7743: Add device node for PRR
  ARM: dts: r8a7745: Add device node for PRR

 arch/arm/boot/dts/r8a7743.dtsi | 5 +++++
 arch/arm/boot/dts/r8a7745.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
