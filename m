Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4164AC6FA82
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 22 Sep 2022 05:17:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiIVFRO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 22 Sep 2022 01:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiIVFRN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Sep 2022 01:17:13 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E474BA61C9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Sep 2022 22:17:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,335,1654527600"; 
   d="scan'208";a="135788124"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Sep 2022 14:17:12 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 48555400D0D1;
        Thu, 22 Sep 2022 14:17:12 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/2] arm64: dts: renesas: r8a779f0: Add Ethernet Switch and SERDES nodes
Date:   Thu, 22 Sep 2022 14:17:04 +0900
Message-Id: <20220922051706.3442382-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add/enable Ethernet Switch and SERDES for R-Car S4-8 (r8a779f0).

Changes from v2:
 https://lore.kernel.org/all/20220921084745.3355107-8-yoshihiro.shimoda.uh@renesas.com/
 https://lore.kernel.org/all/20220921084745.3355107-9-yoshihiro.shimoda.uh@renesas.com/
 - Separate patches into each subsystem.
   (No change actual code from v2.)

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a779f0: Add Ethernet Switch and SERDES nodes
  arm64: dts: renesas: r8a779f0: spider: Enable Ethernet Switch and
    SERDES

 .../dts/renesas/r8a779f0-spider-ethernet.dtsi |  54 +++++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 111 ++++++++++++++++++
 2 files changed, 165 insertions(+)

-- 
2.25.1

