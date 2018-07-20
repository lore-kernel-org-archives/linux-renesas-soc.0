Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33214 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727755AbeGTMwF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 08:52:05 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 6/7] ARM: shmobile: defconfig: Set CONFIG_LOCALVERSION
Date: Fri, 20 Jul 2018 14:03:54 +0200
Message-Id: <8d40e5637291a3b6fb0da19de269299903d7054b.1532086504.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1532086504.git.horms+renesas@verge.net.au>
References: <cover.1532086504.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

This allows to derive the kernel flavor from the kernel version at
runtime.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index ac3dad3c3b9d..b961c121515b 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -1,3 +1,4 @@
+CONFIG_LOCALVERSION="-shmobile"
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ=y
 CONFIG_IKCONFIG=y
-- 
2.11.0
