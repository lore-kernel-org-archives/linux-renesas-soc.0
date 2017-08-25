Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:52848 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755508AbdHYM45 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2017 08:56:57 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: renesas: Add support for R-Car V3M
Date: Fri, 25 Aug 2017 14:56:48 +0200
Message-Id: <1503665810-13945-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

This patch series adds initial R-Car V3M infrastructure:
  1. SoC DT bindings,
  2. Main Kconfig symbol.

Both follow the example set by R-Car D3 aka r8a77995, using 5-digit instead
of 4-digit part numbers.
Alternatively, we could stick to 4-digit part numbers if the fifth digit is
a zero.

For your convenience, a branch with more preliminary work (thanks Sergei,
for posting the clock driver!) for testing on v3m/eagle is also available
in the topic/r8a77970-integration branch of my renesas-drivers git
repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

Thanks for your comments!

Geert Uytterhoeven (2):
  ARM: shmobile: Document R-Car V3M SoC DT bindings
  arm64: renesas: Add Renesas R8A77970 Kconfig support

 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 arch/arm64/Kconfig.platforms                       | 6 ++++++
 2 files changed, 8 insertions(+)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
