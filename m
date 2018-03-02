Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:48440 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424002AbeCBM1u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Mar 2018 07:27:50 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] ARM: shmobile: defconfig: Disable CONFIG_EMBEDDED
Date: Fri,  2 Mar 2018 13:27:44 +0100
Message-Id: <1519993666-11041-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series disables CONFIG_EMBEDDED in shmobile_defconfig, which
stands in the way of using more sane defaults expressed in Kconfig
logic.

The first patch does a mandatory refresh of shmobile_defconfig as a
preparatory step/
The second patch actually disables CONFIG_EMBEDDED.

Changes compared to v1:
  - Enhance patch description,
  - Rebase.

Thanks!

Geert Uytterhoeven (2):
  ARM: shmobile: defconfig: Refresh
  ARM: shmobile: defconfig: Disable CONFIG_EMBEDDED

 arch/arm/configs/shmobile_defconfig | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
