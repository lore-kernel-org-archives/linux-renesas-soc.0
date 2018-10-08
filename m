Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:26890 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726193AbeJHQlP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Oct 2018 12:41:15 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/4] Improve pinctrl support for the RZ/G1C
Date: Mon,  8 Oct 2018 10:30:15 +0100
Message-Id: <1538991019-18577-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

this series adds support for I2C[0123], DU1, VIN[01], and QSPI1
to the pinctrl driver of the RZ/G1C (a.k.a. R8A77470).

This series applies on top of next-20181005, and depends on:
https://patchwork.kernel.org/patch/10630259/

Thanks,
Fab

Fabrizio Castro (4):
  pinctrl: sh-pfc: r8a77470: Add remaining I2C pin groups
  pinctrl: sh-pfc: r8a77470: Add DU1 pin groups
  pinctrl: sh-pfc: r8a77470: Add VIN pin groups
  pinctrl: sh-pfc: r8a77470: Add QSPI1 pin groups

 drivers/pinctrl/sh-pfc/pfc-r8a77470.c | 516 ++++++++++++++++++++++++++++++++++
 1 file changed, 516 insertions(+)

-- 
2.7.4
