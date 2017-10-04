Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:51978 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751958AbdJDMhA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 08:37:00 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] ARM: dts: rcar-gen2: Use generic node name for VSP1 nodes
Date: Wed,  4 Oct 2017 14:36:45 +0200
Message-Id: <1507120609-14501-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus, Laurent,

This patch series replaces the specific node names used for the VSP1
nodes by the preferred generic node names, cfr. commit 0e1bfb72b076b07d
("v4l: vsp1: Use generic node name").

Thanks!

Geert Uytterhoeven (4):
  ARM: dts: r8a7790: Use generic node name for VSP1 nodes
  ARM: dts: r8a7791: Use generic node name for VSP1 nodes
  ARM: dts: r8a7792: Use generic node name for VSP1 nodes
  ARM: dts: r8a7794: Use generic node name for VSP1 nodes

 arch/arm/boot/dts/r8a7790.dtsi | 8 ++++----
 arch/arm/boot/dts/r8a7791.dtsi | 6 +++---
 arch/arm/boot/dts/r8a7792.dtsi | 6 +++---
 arch/arm/boot/dts/r8a7794.dtsi | 4 ++--
 4 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
