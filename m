Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43203 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751593AbcLFNdX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Dec 2016 08:33:23 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH renesas/devel 1/2] ARM: shmobile: defconfig: Enable r8a774[35] SoCs
Date: Tue,  6 Dec 2016 14:32:52 +0100
Message-Id: <1481031173-18600-2-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1481031173-18600-1-git-send-email-horms+renesas@verge.net.au>
References: <1481031173-18600-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable recently added r8a7743 (RZ/G1M) and r8a7745 (RZ/G1E) SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/shmobile_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index b66e17aec058..760688aa5c79 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -14,6 +14,8 @@ CONFIG_ARCH_EMEV2=y
 CONFIG_ARCH_R7S72100=y
 CONFIG_ARCH_R8A73A4=y
 CONFIG_ARCH_R8A7740=y
+CONFIG_ARCH_R8A7743=y
+CONFIG_ARCH_R8A7745=y
 CONFIG_ARCH_R8A7778=y
 CONFIG_ARCH_R8A7779=y
 CONFIG_ARCH_R8A7790=y
-- 
2.7.0.rc3.207.g0ac5344
