Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:34255 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751027AbeDYIUe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Apr 2018 04:20:34 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a77990: Revise some nodes
Date: Wed, 25 Apr 2018 17:20:08 +0900
Message-Id: <1524644410-12465-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the renesas-devel-20180424-v4.17-rc2 tag
of renesas.git.

This patch set is from https://patchwork.kernel.org/patch/10352549/.
About scif node, I'll submit such a revising patch later (maybe at adding
other scif nodes timing).

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a77990: Revise the cache controller node
  arm64: dts: renesas: r8a77990: Revise the psci node

 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
1.9.1
