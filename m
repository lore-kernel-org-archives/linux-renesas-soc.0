Return-Path: <SRS0=AhbF=PM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867E4C43612
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 09:13:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5712E21871
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 09:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbfADJNW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Jan 2019 04:13:22 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:49994 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfADJNV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jan 2019 04:13:21 -0500
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id L9DK1z00H3XaVaC019DKpU; Fri, 04 Jan 2019 10:13:19 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gfLXb-0003ra-CN; Fri, 04 Jan 2019 10:13:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gfLXb-0003K0-BJ; Fri, 04 Jan 2019 10:13:19 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL 2/2] arm64: dts: renesas: r8a774c0: Add dummy board DTS
Date:   Fri,  4 Jan 2019 10:13:16 +0100
Message-Id: <20190104091316.12716-3-geert+renesas@glider.be>
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
 arch/arm64/boot/dts/renesas/Makefile           | 1 +
 arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index b4a006313cb66048..2514cd67c3028659 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -17,3 +17,4 @@ dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 
 # SoCs lacking upstream board support
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-dummy.dtb
+dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-dummy.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts b/arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts
new file mode 100644
index 0000000000000000..e608e052456ed017
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts
@@ -0,0 +1,2 @@
+/dts-v1/;
+#include "r8a774c0.dtsi"
-- 
2.17.1

