Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:59848 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753300AbcHPO4f (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 10:56:35 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: r8a7790/r8a7791: Remove obsolete vsp1 properties
Date: Tue, 16 Aug 2016 16:56:30 +0200
Message-Id: <1471359392-12584-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus, Laurent,

This patch series removes from the R-Car H2 and M2-W DT source files the
obsolete DT properties to identify the exact VSP device instance
features, which are no longer needed nor used since commit
5aa2eb3c86d4fd16 ("[media] v4l: vsp1: Configure device based on IP
version").

Geert Uytterhoeven (2):
  ARM: dts: r8a7790: Remove obsolete vsp1 properties
  ARM: dts: r8a7791: Remove obsolete vsp1 properties

 arch/arm/boot/dts/r8a7790.dtsi | 23 -----------------------
 arch/arm/boot/dts/r8a7791.dtsi | 18 ------------------
 2 files changed, 41 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
