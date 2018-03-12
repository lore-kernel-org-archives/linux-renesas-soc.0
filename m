Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:38668 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751379AbeCLOk1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Mar 2018 10:40:27 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/6] pinctrl: sh-pfc: rcar-gen3: Rename EtherAVB "mdc" pin group to "mdio"
Date: Mon, 12 Mar 2018 15:40:16 +0100
Message-Id: <1520865622-11774-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

On Renesas R-Car Gen2 SoCs, the pin group for the MDIO bus is named
"mdio".

When initial support was added for R-Car H3, the MDIO pin was forgotten,
and the MDC pin got its own group named "mdc".  During the addition of
support for R-Car M3-W, this mistake was noticed.  But as R-Car H3 and
M3-W are pin compatible, and can be mounted on the same boards, the
decision was made to just add the MDIO pin to the existing "mdc" group.
Later this was extended to R-Car H3 ES2.0, and M3-N, because of pin
compatibility, and to R-Car D3, in the name of consistency among R-Car
Gen3 SoCs.

However, this decision keeps on being questioned when adding new SoC
support.  Hence bite the bullet and admit our mistake, and rename the
pin group from "mdc" to "mdio", like on R-Car Gen2 SoCs.  Backwards
compatibility with old DTBs is retained by using a pin group alias.

This patch series:
  1. Introduces a macro for creating pin group aliases,
  2. Renames the "mdc" pin group to "mdio" on R-Car H3 (ES1.x and
     ES2.0), M3-W, M3-N, and D3.

Thanks for your comments!

Geert Uytterhoeven (6):
  pinctrl: sh-pfc: Add SH_PFC_PIN_GROUP_ALIAS()
  pinctrl: sh-pfc: r8a7795: Rename EtherAVB "mdc" pin group to "mdio"
  pinctrl: sh-pfc: r8a7795-es1: Rename EtherAVB "mdc" pin group to
    "mdio"
  pinctrl: sh-pfc: r8a7796: Rename EtherAVB "mdc" pin group to "mdio"
  pinctrl: sh-pfc: r8a77965: Rename EtherAVB "mdc" pin group to "mdio"
  pinctrl: sh-pfc: r8a77995: Rename EtherAVB "mdc" pin group to "mdio"

 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 10 ++++++----
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 10 ++++++----
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 10 ++++++----
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 10 ++++++----
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    | 10 ++++++----
 drivers/pinctrl/sh-pfc/sh_pfc.h          |  5 +++--
 6 files changed, 33 insertions(+), 22 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
