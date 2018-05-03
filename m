Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:45150 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbeECNCp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 May 2018 09:02:45 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/3] arm64: dts: renesas: Correct whitespace
Date: Thu,  3 May 2018 14:38:27 +0200
Message-Id: <1525351110-13403-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series fixes a few whitespace issues in DTS files.

Changes compared to v1:
  - Rebased.

Thanks!

Geert Uytterhoeven (3):
  arm64: dts: renesas: r8a7795: Correct whitespace
  arm64: dts: renesas: r8a7796: Correct whitespace
  arm64: dts: renesas: r8a77965: Correct whitespace

 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 14 +++++++-------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  |  8 ++++----
 arch/arm64/boot/dts/renesas/r8a77965.dtsi |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
