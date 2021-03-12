Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56A9C433E6
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Mar 2021 09:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 908B564FF3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Mar 2021 09:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbhCLJuj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Mar 2021 04:50:39 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:33307 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232994AbhCLJuh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 04:50:37 -0500
X-IronPort-AV: E=Sophos;i="5.81,243,1610377200"; 
   d="scan'208";a="74972786"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Mar 2021 18:50:36 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id EE2A1400E9F2;
        Fri, 12 Mar 2021 18:50:35 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, yusuke.goda.sx@renesas.com,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] treewide: Add CAN support for r8a77961
Date:   Fri, 12 Mar 2021 18:50:28 +0900
Message-Id: <20210312095030.534957-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on renesas-drivers-2021-02-16-v5.11 tag.
And, Goda-san tested this patch series on R-Car M3-W+ StarterKit board
with Kingfisher. (Thank you Goda-san!)

Changes from v1:
 - In patch 1/2
 -- Add R8A77961 to the paragraph about required properties.
 -- Update "R8A7796" to "R8A77960". And add a description for this.
 - In patch 2/2
 -- Add Reviewed-by from Geert-san.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=446721

Yoshihiro Shimoda (2):
  dt-bindings: net: can: rcar_can: Document r8a77961 support
  arm64: dts: renesas: r8a77961: Add CAN nodes

 .../devicetree/bindings/net/can/rcar_can.txt  |  5 ++--
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     | 26 +++++++++++++++++--
 2 files changed, 27 insertions(+), 4 deletions(-)

-- 
2.25.1

