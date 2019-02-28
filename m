Return-Path: <SRS0=CNOd=RD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,TVD_SUBJ_WIPE_DEBT,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F562C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 10:51:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC8502183F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 10:51:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731523AbfB1KvY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Feb 2019 05:51:24 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:56686 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfB1KvY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Feb 2019 05:51:24 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id iArL1z00s3XaVaC01ArL61; Thu, 28 Feb 2019 11:51:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gzJHc-0007N2-RF; Thu, 28 Feb 2019 11:51:20 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gzJHc-00009c-OQ; Thu, 28 Feb 2019 11:51:20 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: power: r8a77965: Remove non-existent A3IR power domain
Date:   Thu, 28 Feb 2019 11:51:19 +0100
Message-Id: <20190228105119.548-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
removed the A3IR power domain on R-Car M3-N, as this SoC does not have
an Image Processing Unit (IMP-X5).

As of commit d8c6557bc93be73e ("arm64: dts: renesas: r8a77965: Remove
non-existent IPMMU-IR"), this definition is no longer used from DT, and
thus can be removed.

Fixes: a527709b78b3c997 ("soc: renesas: rcar-sysc: Add R-Car M3-N support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop RFC, as the dependency is part of v5.0-rc1.
---
 include/dt-bindings/power/r8a77965-sysc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/power/r8a77965-sysc.h b/include/dt-bindings/power/r8a77965-sysc.h
index 05a4b5917314791a..de82d8a15ea13a85 100644
--- a/include/dt-bindings/power/r8a77965-sysc.h
+++ b/include/dt-bindings/power/r8a77965-sysc.h
@@ -21,7 +21,6 @@
 #define R8A77965_PD_A3VC		14
 #define R8A77965_PD_3DG_A		17
 #define R8A77965_PD_3DG_B		18
-#define R8A77965_PD_A3IR		24
 #define R8A77965_PD_A2VC1		26
 
 /* Always-on power area */
-- 
2.17.1

