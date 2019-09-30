Return-Path: <SRS0=dTnv=XZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB506C4360C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 30 Sep 2019 09:15:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A238A21721
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 30 Sep 2019 09:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbfI3JPb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 30 Sep 2019 05:15:31 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:7844 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726952AbfI3JPb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Sep 2019 05:15:31 -0400
X-IronPort-AV: E=Sophos;i="5.64,565,1559487600"; 
   d="scan'208";a="27682611"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 30 Sep 2019 18:15:27 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 19EEC4003ECE;
        Mon, 30 Sep 2019 18:15:23 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/4] Add RZ/G2N DU support
Date:   Mon, 30 Sep 2019 10:15:01 +0100
Message-Id: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add binding/driver support for
R8A774B1(a.k.a RZ/G2N) DU (which is very similar to the R8A77965 DU);
it has one RGB output, one LVDS output and one HDMI output.

Biju Das (4):
  dt-bindings: display: renesas: du: Document the r8a774b1 bindings
  drm: rcar-du: Add R8A774B1 support
  dt-bindings: display: renesas: lvds: Document r8a774b1 bindings
  drm: rcar-du: lvds: Add r8a774b1 support

 .../bindings/display/bridge/renesas,lvds.txt       |  1 +
 .../devicetree/bindings/display/renesas,du.txt     |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              | 30 ++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |  1 +
 4 files changed, 34 insertions(+)

-- 
2.7.4

