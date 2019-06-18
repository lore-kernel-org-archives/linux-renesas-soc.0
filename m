Return-Path: <SRS0=HpHr=UR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F48C31E5B
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Jun 2019 15:19:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7239213F2
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Jun 2019 15:19:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729038AbfFRPTW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Jun 2019 11:19:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:16408 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728572AbfFRPTW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 11:19:22 -0400
X-IronPort-AV: E=Sophos;i="5.62,389,1554735600"; 
   d="scan'208";a="18981207"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Jun 2019 00:19:20 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 89C474006C69;
        Wed, 19 Jun 2019 00:19:16 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Subject: [PATCH 0/3] Add HDMI support to HiHope RZ/G2M
Date:   Tue, 18 Jun 2019 16:18:36 +0100
Message-Id: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

this series adds HDMI support to the HiHope RZ/G2M board.

Thanks,
Fab

Fabrizio Castro (3):
  dt-bindings: display: renesas: Add r8a774a1 support
  arm64: dts: renesas: r8a774a1: Add HDMI encoder instance
  arm64: dts: renesas: hihope-common: Add HDMI support

 .../bindings/display/bridge/renesas,dw-hdmi.txt    |  4 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     | 62 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          | 32 +++++++++++
 3 files changed, 97 insertions(+), 1 deletion(-)

-- 
2.7.4

