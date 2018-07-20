Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:59092 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387878AbeGTNPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 09:15:55 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tejun Heo <tj@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ata: sata_rcar: Add rudimentary Runtime PM support
Date: Fri, 20 Jul 2018 14:27:37 +0200
Message-Id: <20180720122739.30056-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Tejun,

This patch series replaces the explicit clock handling in the Reneas
R-Car SATA driver by proper Runtime PM calls.

Besides making the driver more generic and independent of actual SoC
clock/power hierarchies, this is also needed to support virtualization,
where the guest cannot be in full control of power management due to
isolation.

For now the device is just powered at probe time, like before.
Further PM optimizations can be done later.

Thanks!

Geert Uytterhoeven (2):
  ata: sata_rcar: Provide a short-hand for &pdev->dev
  ata: sata_rcar: Add rudimentary Runtime PM support

 drivers/ata/sata_rcar.c | 52 +++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 28 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
