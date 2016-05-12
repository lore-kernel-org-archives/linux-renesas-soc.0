Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:54509 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752169AbcELI3N (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 12 May 2016 04:29:13 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta24.fe.bosch.de (Postfix) with ESMTP id EB439D80235
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:29:11 +0200 (CEST)
Received: from FE-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id 9EB9CA407A8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2016 10:29:11 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 6/6] arm64: renesas: select MFD_SYSCON
Date: Thu, 12 May 2016 10:27:21 +0200
Message-ID: <1463041641-27485-7-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
References: <1463041641-27485-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The Clock Pulse Generator (CPG) relies on syscon to obtain the values of
the mode pins.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index fda93a2..9bd88d1 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -106,6 +106,7 @@ config ARCH_SHMOBILE
 config ARCH_RENESAS
 	bool "Renesas SoC Platforms"
 	select ARCH_SHMOBILE
+	select MFD_SYSCON
 	select PINCTRL
 	select PM
 	select PM_GENERIC_DOMAINS
-- 
2.8.0
