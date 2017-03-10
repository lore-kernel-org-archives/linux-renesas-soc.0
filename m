Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:40792 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937314AbdCJNsg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 08:48:36 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] ARM: shmobile: Document and identify RZ/G1H and RZ/G1N
Date: Fri, 10 Mar 2017 14:48:26 +0100
Message-Id: <1489153710-8159-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

Now the part numbers of the Renesas RZ/G1H and RZ/G1N are publicly
available, this patch series documents the DT bindings for these SoCs,
and adds support for identifying them.

Thanks!

Geert Uytterhoeven (4):
  ARM: shmobile: Document RZ/G1H SoC DT binding
  ARM: shmobile: Document RZ/G1N SoC DT binding
  soc: renesas: Identify RZ/G1H
  soc: renesas: Identify RZ/G1N

 Documentation/devicetree/bindings/arm/shmobile.txt |  4 ++++
 drivers/soc/renesas/renesas-soc.c                  | 16 ++++++++++++++++
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
