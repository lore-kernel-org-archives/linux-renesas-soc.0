Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:10213 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729197AbeIRTVE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 15:21:04 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/5] Add I2C4/DU0/QSPI0/SDHI2/USB to r8a77470
Date: Tue, 18 Sep 2018 14:47:53 +0100
Message-Id: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

this series adds I2C4/DU0/QSPI0/SDHI2/USB0/USB1 pin groups and
functions to the RZ/G1C (a.k.a. r8a77470).

Thanks,
Fab

Fabrizio Castro (5):
  pinctrl: sh-pfc: r8a77470: Add I2C4 pin groups
  pinctrl: sh-pfc: r8a77470: Add DU0 pin groups
  pinctrl: sh-pfc: r8a77470: Add QSPI0 pin groups
  pinctrl: sh-pfc: r8a77470: Add SDHI2 pin groups
  pinctrl: sh-pfc: r8a77470: Add USB pin groups

 drivers/pinctrl/sh-pfc/pfc-r8a77470.c | 275 ++++++++++++++++++++++++++++++++++
 1 file changed, 275 insertions(+)

-- 
2.7.4
