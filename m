Return-Path: <SRS0=AhbF=PM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFE3C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 09:13:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B62C217F5
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 09:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbfADJNV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Jan 2019 04:13:21 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:44816 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfADJNV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jan 2019 04:13:21 -0500
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id L9DK1z0013XaVaC019DKvy; Fri, 04 Jan 2019 10:13:19 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gfLXa-0003rX-U9; Fri, 04 Jan 2019 10:13:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gfLXa-0003Jx-ST; Fri, 04 Jan 2019 10:13:18 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL 1/2] arm64: dts: renesas: r8a774a1: Add dummy board DTS
Date:   Fri,  4 Jan 2019 10:13:15 +0100
Message-Id: <20190104091316.12716-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190104091316.12716-1-geert+renesas@glider.be>
References: <20190104091316.12716-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Improve build coverage until a real board DTS surfaces.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile           | 3 +++
 arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts | 2 ++
 2 files changed, 5 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index a8ce6594342d993d..b4a006313cb66048 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -14,3 +14,6 @@ dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
 dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
+
+# SoCs lacking upstream board support
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-dummy.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts b/arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts
new file mode 100644
index 0000000000000000..dc4418ab8096fc4c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts
@@ -0,0 +1,2 @@
+/dts-v1/;
+#include "r8a774a1.dtsi"
-- 
2.17.1

