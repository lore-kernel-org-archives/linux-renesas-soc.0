Return-Path: <SRS0=r2fM=YD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDECC4360C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Oct 2019 14:26:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4901720B7C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Oct 2019 14:26:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbfJJO0J (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Oct 2019 10:26:09 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:57697 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725923AbfJJO0I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Oct 2019 10:26:08 -0400
X-IronPort-AV: E=Sophos;i="5.67,280,1566831600"; 
   d="scan'208";a="28794119"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Oct 2019 23:26:06 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BE7E24288736;
        Thu, 10 Oct 2019 23:26:02 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 0/3] Add CAN and CAN-FD support to the RZ/G2N SoC
Date:   Thu, 10 Oct 2019 15:25:57 +0100
Message-Id: <1570717560-7431-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

this series adds CAN and CAN FD support to the RZ/G2N SoC specific dtsi.

Thanks,
Fab

v1->v2:
* Fixed patch 2/3 according to Geert's comment

Fabrizio Castro (3):
  dt-bindings: can: rcar_can: Add r8a774b1 support
  dt-bindings: can: rcar_canfd: document r8a774b1 support
  arm64: dts: renesas: r8a774b1: Add CAN and CAN FD support

 .../devicetree/bindings/net/can/rcar_can.txt       |  5 ++-
 .../devicetree/bindings/net/can/rcar_canfd.txt     |  5 ++-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          | 48 ++++++++++++++++++++--
 3 files changed, 51 insertions(+), 7 deletions(-)

-- 
2.7.4

