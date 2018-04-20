Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:46570 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754826AbeDTNPp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 09:15:45 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: shmobile: Disable CONFIG_FB_SH_MOBILE_MERAM
Date: Fri, 20 Apr 2018 15:15:39 +0200
Message-Id: <1524230141-7612-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

The last Renesas ARM platform using this driver was removed in commit
a521422ea4ae6128 ("ARM: shmobile: mackerel: Remove Legacy C board
code"), hence CONFIG_FB_SH_MOBILE_MERAM can be disabled.

Thanks!

Geert Uytterhoeven (2):
  ARM: shmobile: defconfig: Disable CONFIG_FB_SH_MOBILE_MERAM
  ARM: multi_v7_defconfig: Disable CONFIG_FB_SH_MOBILE_MERAM

 arch/arm/configs/multi_v7_defconfig | 1 -
 arch/arm/configs/shmobile_defconfig | 1 -
 2 files changed, 2 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
