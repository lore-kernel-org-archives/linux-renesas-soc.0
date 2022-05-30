Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FF4C433F5
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 30 May 2022 02:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbiE3Cqa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 29 May 2022 22:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbiE3Cqa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 May 2022 22:46:30 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1640B3CA6D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 May 2022 19:46:28 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,261,1647270000"; 
   d="scan'208";a="122651997"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 May 2022 11:46:28 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 26FB44172468;
        Mon, 30 May 2022 11:46:28 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] arm64: dts: renesas: r8a779f0: Add IPMMU support
Date:   Mon, 30 May 2022 11:46:24 +0900
Message-Id: <20220530024626.1870277-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on renesas-drivers-2022-05-17-v5.18-rc7.

Changes from v1:
 - Rename ipmmu_hsc with ipmmu_hc.
https://lore.kernel.org/all/20220125130021.4144902-1-yoshihiro.shimoda.uh@renesas.com/

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a779f0: Add IPMMU nodes
  arm64: dts: renesas: r8a779f0: Add iommus in dmac nodes

 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)

-- 
2.25.1

