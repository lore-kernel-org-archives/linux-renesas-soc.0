Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC251C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 14:41:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE97F2083E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 14:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfDKOlK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 10:41:10 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:62824 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726264AbfDKOlK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 10:41:10 -0400
X-IronPort-AV: E=Sophos;i="5.60,337,1549897200"; 
   d="scan'208";a="12768438"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Apr 2019 23:41:07 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A460640579FD;
        Thu, 11 Apr 2019 23:41:04 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/4] Add RZ/G2M DU support
Date:   Thu, 11 Apr 2019 15:34:27 +0100
Message-Id: <1554993271-29523-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add binding/driver support for
R8A774A1(a.k.a RZ/G2M) DU (which is very similar to the R8A7796 DU);
it has one RGB output, one LVDS output and one HDMI output.

This patchset is based on linux_next next-20190411 branch.

Biju Das (4):
  dt-bindings: display: renesas: du: Document the r8a774a1 bindings
  dt-bindings: display: renesas: lvds: Document r8a774a1 bindings
  drm: rcar-du: Add R8A774A1 support
  drm: rcar-du: lvds: Add r8a774a1 support

 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
 Documentation/devicetree/bindings/display/renesas,du.txt          | 2 ++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c                             | 1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                               | 1 +
 4 files changed, 5 insertions(+)

-- 
2.7.4

