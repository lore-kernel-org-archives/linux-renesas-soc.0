Return-Path: <SRS0=uTUX=YA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B665ECE58C
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Oct 2019 10:23:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7A90206BB
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Oct 2019 10:23:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbfJGKXo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Oct 2019 06:23:44 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:49708 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbfJGKXo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 06:23:44 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id AaPh2100Y05gfCL01aPhM7; Mon, 07 Oct 2019 12:23:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-00087E-Lq; Mon, 07 Oct 2019 12:23:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-0003CQ-KP; Mon, 07 Oct 2019 12:23:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 13/19] soc: renesas: rcar-rst: Add support for R-Car M3-W+
Date:   Mon,  7 Oct 2019 12:23:26 +0200
Message-Id: <20191007102332.12196-14-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007102332.12196-1-geert+renesas@glider.be>
References: <20191007102332.12196-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Reset block in the R-Car M3-W+ (R8A77961) SoC to the
Renesas R-Car RST driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/rcar-rst.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index cd5592977cefc22b..14d05a070dd3ecea 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -59,6 +59,7 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
 	/* R-Car Gen3 */
 	{ .compatible = "renesas,r8a7795-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a7796-rst", .data = &rcar_rst_gen3 },
+	{ .compatible = "renesas,r8a77961-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77965-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77970-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77980-rst", .data = &rcar_rst_gen3 },
-- 
2.17.1

