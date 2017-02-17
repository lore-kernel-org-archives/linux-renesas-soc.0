Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:34564 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934589AbdBQRAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2017 12:00:42 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: Upgrade to PSCI v1.0 to support Suspend-to-RAM
Date: Fri, 17 Feb 2017 18:00:30 +0100
Message-Id: <1487350832-29820-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series upgrades the version of the PSCI firmware, as
advertised in DT on Renesas R-Car Gen3 systems, from v0.2 to v1.0.

Note that this series does not have any runtime effects: as of PSCI
v0.2, PSCI provides a VERSION API.  Hence Linux always detected the
actual version, regardless of what was stated in DT, and enabled v1.0
features like system suspend:

    PSCIv1.0 detected in firmware.

However, it is better to have the real hardware^H^H^H^H^H^H^H^Hfirmware
description in DT.

Tested on Salvator-X (both H3 and M3-W) with firmware v2.16.0, but I do
have old boot logs showing that PSCIv1.0 has been detected for a long
time.

Thanks for applying!

Khiem Nguyen (2):
  arm64: dts: r8a7795: Upgrade to PSCI v1.0 to support Suspend-to-RAM
  arm64: dts: r8a7796: Upgrade to PSCI v1.0 to support Suspend-to-RAM

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
