Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:4030 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727655AbeHWQhZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 12:37:25 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add CAN support to rcar_can driver
Date: Thu, 23 Aug 2018 14:07:30 +0100
Message-Id: <1535029653-7418-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

RZ/G2 is slightly different from other R-Car and RZ/G1 SoCs as clkp2
isn't available on RZ/G2 devices. Changes to driver and documentation
are therefore necessary and taken care of here.

Thanks,
Fab

Fabrizio Castro (3):
  can: rcar_can: Fix erroneous registration
  can: rcar_can: Add RZ/G2 support
  dt-bindings: can: rcar_can: Add r8a774a1 support

 .../devicetree/bindings/net/can/rcar_can.txt       | 11 +++--
 drivers/net/can/rcar/rcar_can.c                    | 48 ++++++++++++++++++----
 2 files changed, 48 insertions(+), 11 deletions(-)

-- 
2.7.4
