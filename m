Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7758C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81A592171F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:44:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbfDLMos (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 08:44:48 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:12083 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726773AbfDLMos (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 08:44:48 -0400
X-IronPort-AV: E=Sophos;i="5.60,341,1549897200"; 
   d="scan'208";a="13085321"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Apr 2019 21:44:43 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8A72943D4B4C;
        Fri, 12 Apr 2019 21:44:40 +0900 (JST)
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
Subject: [PATCH V2 0/4] Add RZ/G2M DU support
Date:   Fri, 12 Apr 2019 13:38:01 +0100
Message-Id: <1555072685-59276-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add binding/driver support for
R8A774A1(a.k.a RZ/G2M) DU (which is very similar to the R8A7796 DU);
it has one RGB output, one LVDS output and one HDMI output.

This patchset is based on linux_next next-20190411 branch.

V1-->V2
  * Incorporated Kieran's review comment.
    (https://patchwork.kernel.org/patch/10896165/)

Biju Das (4):
  dt-bindings: display: renesas: du: Document the r8a774a1 bindings
  dt-bindings: display: renesas: lvds: Document r8a774a1 bindings
  drm: rcar-du: Add R8A774A1 support
  drm: rcar-du: lvds: Add r8a774a1 support

 .../bindings/display/bridge/renesas,lvds.txt       |  1 +
 .../devicetree/bindings/display/renesas,du.txt     |  2 ++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              | 30 ++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |  1 +
 4 files changed, 34 insertions(+)

-- 
2.7.4

