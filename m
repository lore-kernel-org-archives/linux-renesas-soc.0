Return-Path: <SRS0=RTEs=YJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134EAFA372A
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Oct 2019 15:09:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFBCE20640
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Oct 2019 15:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbfJPPJm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Oct 2019 11:09:42 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:54122 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfJPPJm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 11:09:42 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id EF9h2100205gfCL01F9hfC; Wed, 16 Oct 2019 17:09:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkvl-0003wJ-0S; Wed, 16 Oct 2019 17:09:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkvk-0007yb-VA; Wed, 16 Oct 2019 17:09:40 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Drop legacy DT clock support
Date:   Wed, 16 Oct 2019 17:09:39 +0200
Message-Id: <20191016150939.30620-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As of commit 362b334b17943d84 ("ARM: dts: r8a7791: Convert to new
CPG/MSSR bindings"), all upstream R-Car Gen2 device tree source files
use the unified "Renesas Clock Pulse Generator / Module Standby and
Software Reset" DT bindings.

Hence remove backward compatibility with old R-Car Gen2 device trees
describing a hierarchical representation of the various CPG and MSTP
clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel-for-v5.5.

The abovementioned commit was part of the v4.15 release.
The conversion was backported to v4.14.75-ltsi, and included in any
R-Car BSP based on v4.14 (rcar-3.6.0 and later).
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 9e4bc1865f84abae..2fd3aa6f32124df0 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -24,7 +24,6 @@
 #include "rcar-gen2.h"
 
 static const struct of_device_id cpg_matches[] __initconst = {
-	{ .compatible = "renesas,rcar-gen2-cpg-clocks", },
 	{ .compatible = "renesas,r8a7743-cpg-mssr", .data = "extal" },
 	{ .compatible = "renesas,r8a7744-cpg-mssr", .data = "extal" },
 	{ .compatible = "renesas,r8a7790-cpg-mssr", .data = "extal" },
