Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:54546 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727858AbeIQUlQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 16:41:16 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Laura Abbott <labbott@redhat.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jinbum Park <jinb.park7@gmail.com>,
        =?UTF-8?q?Cl=C3=A9ment=20Peron?= <clement.peron@devialet.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: debug-ll: Add support for r8a7744
Date: Mon, 17 Sep 2018 16:06:30 +0100
Message-Id: <1537196790-4775-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1537196790-4775-1-git-send-email-biju.das@bp.renesas.com>
References: <1537196790-4775-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable low-level debugging support for RZ/G1N (R8A7744). RZ/G1N uses
SCIF0 for the debug console.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/Kconfig.debug | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index f6fcb8a..7c86875 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -940,12 +940,13 @@ choice
 
 	config DEBUG_RCAR_GEN2_SCIF0
 		bool "Kernel low-level debugging messages via SCIF0 on R-Car Gen2 and RZ/G1"
-		depends on ARCH_R8A7743 || ARCH_R8A7790 || ARCH_R8A7791 || \
-			ARCH_R8A7792 || ARCH_R8A7793
+		depends on ARCH_R8A7743 || ARCH_R8A7744 || ARCH_R8A7790 || \
+			ARCH_R8A7791 || ARCH_R8A7792 || ARCH_R8A7793
 		help
 		  Say Y here if you want kernel low-level debugging support
-		  via SCIF0 on Renesas RZ/G1M (R8A7743), R-Car H2 (R8A7790),
-		  M2-W (R8A7791), V2H (R8A7792), or M2-N (R8A7793).
+		  via SCIF0 on Renesas RZ/G1M (R8A7743), RZ/G1N (R8A7744),
+		  R-Car H2 (R8A7790), M2-W (R8A7791), V2H (R8A7792), or
+		  M2-N (R8A7793).
 
 	config DEBUG_RCAR_GEN2_SCIF1
 		bool "Kernel low-level debugging messages via SCIF1 on R8A77470"
-- 
2.7.4
