Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE05BC77B70
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Apr 2023 07:27:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjDNH10 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Apr 2023 03:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDNH1Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Apr 2023 03:27:25 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ABCE03591
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Apr 2023 00:27:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,195,1677510000"; 
   d="scan'208";a="155967154"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Apr 2023 16:27:23 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A9A3541AF0CF;
        Fri, 14 Apr 2023 16:27:23 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779f0: Add PCIe support
Date:   Fri, 14 Apr 2023 16:27:15 +0900
Message-Id: <20230414072717.2931212-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add PCIe support for R-Car S4-8 (r8a779f0). The dt-bindings doc
patches are under review now:
https://patchwork.kernel.org/project/linux-pci/list/?series=739719

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a779f0: Add PCIe Host and Endpoint nodes
  arm64: dts: renesas: r8a779f0: spider: Enable PCIe Host ch0

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi |  19 ++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 104 ++++++++++++++++++
 2 files changed, 123 insertions(+)

-- 
2.25.1

