Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41705 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933774AbcKXKtC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2016 05:49:02 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH mmc/next] mmc: sh_mobile_sdhi:  remove support for sh7372
Date: Thu, 24 Nov 2016 11:48:54 +0100
Message-Id: <1479984534-25468-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Remove documentation of support for the SH7372 (SH-Mobile AP4) from the MMC
driver. The driver itself appears to have no SH7372 specific code.

Commit edf4100906044225 ("ARM: shmobile: sh7372 dtsi: Remove Legacy file")
removes this SoC from the kernel in v4.1.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
index 13df9c2399c3..1db9e74bb9c1 100644
--- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
@@ -11,7 +11,6 @@ optional bindings can be used.
 
 Required properties:
 - compatible:	"renesas,sdhi-shmobile" - a generic sh-mobile SDHI unit
-		"renesas,sdhi-sh7372" - SDHI IP on SH7372 SoC
 		"renesas,sdhi-sh73a0" - SDHI IP on SH73A0 SoC
 		"renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
 		"renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
-- 
2.7.0.rc3.207.g0ac5344
