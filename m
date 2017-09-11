Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Add Renesas SoC DT bindings doc to Renesas ARM sections
Date: Mon, 11 Sep 2017 12:54:58 +0200
Message-Id: <1505127298-4497-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 28e9ab798e35b7ab..f714eea70cb1eea5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1744,6 +1744,7 @@ Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
 S:	Supported
 F:	arch/arm64/boot/dts/renesas/
+F:	Documentation/deviuetree/bindings/arm/shmobile.txt
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
 
@@ -1863,6 +1864,7 @@ F:	arch/arm/boot/dts/sh*
 F:	arch/arm/configs/shmobile_defconfig
 F:	arch/arm/include/debug/renesas-scif.S
 F:	arch/arm/mach-shmobile/
+F:	Documentation/deviuetree/bindings/arm/shmobile.txt
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
 
-- 
2.7.4
