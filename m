Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DD7C25B4E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 23 Jan 2023 01:35:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjAWBfJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 22 Jan 2023 20:35:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjAWBfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Jan 2023 20:35:08 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B5E9A18A8F
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Jan 2023 17:35:06 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,238,1669042800"; 
   d="scan'208";a="150244406"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jan 2023 10:35:06 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EAF674000C7C;
        Mon, 23 Jan 2023 10:35:05 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/5] arm64: dts: renesas: Add/update IPMMU support for R-Car Gen4
Date:   Mon, 23 Jan 2023 10:34:43 +0900
Message-Id: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on the following patch which update the dt-binding
for renesas,ipmmu-main property.

https://lore.kernel.org/all/20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com/

Yoshihiro Shimoda (5):
  arm64: dts: renesas: r8a779f0: Revise renesas,ipmmu-main
  arm64: dts: renesas: r8a779f0: Add iommus to MMC node
  arm64: dts: renesas: r8a779g0: Add IPMMU nodes
  arm64: dts: renesas: r8a779g0: Add iommus to DMAC nodes
  arm64: dts: renesas: r8a779g0: Add iommus to MMC node

 arch/arm64/boot/dts/renesas/r8a779f0.dtsi |   9 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 126 ++++++++++++++++++++++
 2 files changed, 131 insertions(+), 4 deletions(-)

-- 
2.25.1

