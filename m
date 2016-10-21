Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:55989 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932685AbcJUJQX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 05:16:23 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] ARM: dts: renesas: Remove skeleton.dtsi inclusion
Date: Fri, 21 Oct 2016 11:16:05 +0200
Message-Id: <1477041370-22778-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

As of commit 9c0da3cc61f1233c ("ARM: dts: explicitly mark skeleton.dtsi
as deprecated"), including skeleton.dtsi is deprecated.
Hence this series removes its use for all Renesas 32-bit ARM SoCs.

This fixes the following warning seen with W=1:

    Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name

Thanks for applying!

Geert Uytterhoeven (5):
  ARM: dts: emev2: Remove skeleton.dtsi inclusion
  ARM: dts: r8a7778: Remove skeleton.dtsi inclusion
  ARM: dts: r8a7779: Remove skeleton.dtsi inclusion
  ARM: dts: r8a7740: Remove skeleton.dtsi inclusion
  ARM: dts: sh73a0: Remove skeleton.dtsi inclusion

 arch/arm/boot/dts/emev2.dtsi   | 3 ++-
 arch/arm/boot/dts/r8a7740.dtsi | 4 ++--
 arch/arm/boot/dts/r8a7778.dtsi | 4 ++--
 arch/arm/boot/dts/r8a7779.dtsi | 4 ++--
 arch/arm/boot/dts/sh73a0.dtsi  | 4 ++--
 5 files changed, 10 insertions(+), 9 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
