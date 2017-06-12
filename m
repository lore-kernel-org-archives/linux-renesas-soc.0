Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:51610 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751970AbdFLJcV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2017 05:32:21 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: Add reset control properties for audio
Date: Mon, 12 Jun 2017 11:32:15 +0200
Message-Id: <1497259937-9387-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus, Morimoto-san,

This patch series describes all resets wired to the audio modules on
R-Car Gen3 SoCs, following the DT binding update in commit
5f440c48c5d5a11f ("ASoC: rsnd: Document optional reset properties") in
sound-asoc/for-next.

Thanks!

Geert Uytterhoeven (2):
  arm64: dts: r8a7795: Add reset control properties for audio
  arm64: dts: r8a7796: Add reset control properties for audio

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 10 ++++++++++
 2 files changed, 20 insertions(+)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
