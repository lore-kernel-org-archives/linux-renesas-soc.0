Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E48C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 15:30:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C0B44217D6
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 15:30:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbfAVPa4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 10:30:56 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:37400 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728829AbfAVPa4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 10:30:56 -0500
X-IronPort-AV: E=Sophos;i="5.56,506,1539615600"; 
   d="scan'208";a="5883683"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jan 2019 00:30:53 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6B24F4007C55;
        Wed, 23 Jan 2019 00:30:50 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v3 0/5] Add Display support
Date:   Tue, 22 Jan 2019 15:25:44 +0000
Message-Id: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add display support for iWave G20D-Q7 board based on RZ/G1N.

This patch series is tested against linux-next

V1--> V2
	* Add DU support : Removed LVDS definition from r8a7743 DU node.
V2--> V3
	* Added LVDS support for both r8a7743 and r8a7744 SoC.

Biju Das (5):
  ARM: dts: r8a7743: Convert to new LVDS DT bindings
  dt-bindings: display: renesas: lvds: Document r8a7744 bindings
  drm: rcar-du: lvds: Add r8a7744 support
  ARM: dts: r8a7744: Add DU support
  ARM: dts: r8a7744: Add LVDS support

 .../bindings/display/bridge/renesas,lvds.txt       |  1 +
 arch/arm/boot/dts/r8a7743.dtsi                     | 36 ++++++++++++++++----
 arch/arm/boot/dts/r8a7744.dtsi                     | 38 ++++++++++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |  1 +
 4 files changed, 67 insertions(+), 9 deletions(-)

-- 
2.7.4

