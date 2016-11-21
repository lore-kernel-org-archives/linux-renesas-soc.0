Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41756 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754228AbcKUMGC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 07:06:02 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 05/18] arm64: dts: h3ulcb: update header
Date: Mon, 21 Nov 2016 13:05:34 +0100
Message-Id: <c77c97557614f07c72393eafa09ef826e0924293.1479726397.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1479726397.git.horms+renesas@verge.net.au>
References: <cover.1479726397.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

This updates H3ULCB device tree header with official board name

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index bcb11a868343..f178fe1730de 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -1,5 +1,5 @@
 /*
- * Device Tree Source for the H3ULCB board
+ * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2016 Cogent Embedded, Inc.
-- 
2.7.0.rc3.207.g0ac5344
