Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46225 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933359AbdIYHzG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 03:55:06 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] ARM: Add definition for monitor mode
Date: Mon, 25 Sep 2017 09:54:43 +0200
Message-Id: <c5d43be52e0c7380f985585ef72dac1a6a89b59d.1506325834.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506325834.git.horms+renesas@verge.net.au>
References: <cover.1506325834.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

<asm/ptrace.h> provides *_MODE definitions for the various processor
modes, but monitor mode was missing.

Add MON_MODE to avoid code using the hardcoded value.

Suggested-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/include/uapi/asm/ptrace.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
index 5af0ed1b825a..70ff6bf489f3 100644
--- a/arch/arm/include/uapi/asm/ptrace.h
+++ b/arch/arm/include/uapi/asm/ptrace.h
@@ -53,6 +53,7 @@
 #endif
 #define FIQ_MODE	0x00000011
 #define IRQ_MODE	0x00000012
+#define MON_MODE	0x00000016
 #define ABT_MODE	0x00000017
 #define HYP_MODE	0x0000001a
 #define UND_MODE	0x0000001b
-- 
2.1.4
