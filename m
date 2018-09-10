Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:18788 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727411AbeIJPgv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 11:36:51 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-can@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 0/3] Add can support to RZ/G2M
Date: Mon, 10 Sep 2018 11:43:12 +0100
Message-Id: <1536576195-11520-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

this series contains all that's necessary to add CAN support
for RZ/G2M (a.k.a. r8a774a1).

v1-v2:
* applied Geert's comments

Thanks,
Fab

Chris Paterson (1):
  arm64: dts: renesas: r8a774a1: Add CAN nodes

Fabrizio Castro (2):
  can: rcar_can: Fix erroneous registration
  dt-bindings: can: rcar_can: Add r8a774a1 support

 .../devicetree/bindings/net/can/rcar_can.txt       | 18 +++++++++++-----
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          | 24 ++++++++++++++++++++++
 drivers/net/can/rcar/rcar_can.c                    |  5 ++++-
 3 files changed, 41 insertions(+), 6 deletions(-)

-- 
2.7.4
