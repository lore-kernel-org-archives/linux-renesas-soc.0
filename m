Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:55596 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966078AbeFSSSj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jun 2018 14:18:39 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [LOCAL/RFC] MAINTAINERS: renesas_defconfig does not exist upstream
Date: Tue, 19 Jun 2018 20:18:35 +0200
Message-Id: <20180619181835.23926-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Make sure patches for arch/arm64/configs/renesas_defconfig are sent to
the right people, and don't bother anyone outside linux-renesas-soc.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.

Is this a good idea, or will it cause too many merge conflicts in
MAINTAINERS?

Impact on scripts/get_maintainer.pl:

    -Catalin Marinas <catalin.marinas@arm.com> (maintainer:ARM64 PORT (AARCH64 ARCHITECTURE))
    -Will Deacon <will.deacon@arm.com> (maintainer:ARM64 PORT (AARCH64 ARCHITECTURE))
    -Simon Horman <horms+renesas@verge.net.au> (commit_signer:8/9=89%,authored:3/9=33%)
    -Geert Uytterhoeven <geert+renesas@glider.be> (commit_signer:6/9=67%,authored:3/9=33%,added_lines:330/336=98%,removed_lines:5/5=100%)
    -Laurent Pinchart <laurent.pinchart@ideasonboard.com> (commit_signer:1/9=11%)
    -Wolfram Sang <wsa+renesas@sang-engineering.com> (commit_signer:1/9=11%,authored:1/9=11%)
    -Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> (commit_signer:1/9=11%,authored:1/9=11%)
    -Kieran Bingham <kieran.bingham@ideasonboard.com> (authored:1/9=11%)
    -linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE))
    -linux-kernel@vger.kernel.org (open list)
    +Simon Horman <horms@verge.net.au> (supporter:ARM/RENESAS ARM64 ARCHITECTURE)
    +Magnus Damm <magnus.damm@gmail.com> (supporter:ARM/RENESAS ARM64 ARCHITECTURE)
    +linux-renesas-soc@vger.kernel.org (open list:ARM/RENESAS ARM64 ARCHITECTURE)
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d5eeff51b5fd329..de0ffbc8e4d66586 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1854,6 +1854,7 @@ Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
 S:	Supported
 F:	arch/arm64/boot/dts/renesas/
+F:	arch/arm64/configs/renesas_defconfig
 F:	Documentation/devicetree/bindings/arm/shmobile.txt
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
@@ -2265,6 +2266,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 S:	Maintained
 F:	arch/arm64/
 F:	Documentation/arm64/
+X:	arch/arm64/configs/renesas_defconfig
 
 AS3645A LED FLASH CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@iki.fi>
@@ -15877,3 +15879,4 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 S:	Buried alive in reporters
 F:	*
 F:	*/
+X:	arch/arm64/configs/renesas_defconfig
-- 
2.17.1
