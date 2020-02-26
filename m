Return-Path: <SRS0=mEDe=4O=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814BEC4BA2F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 26 Feb 2020 20:28:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 521F924670
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 26 Feb 2020 20:28:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="JSKZmJKK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbgBZU2j (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 26 Feb 2020 15:28:39 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:12072 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbgBZU2i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 15:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582748917;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=q5luusvIJbdrR+mxIQrVhZuB+GR70FBQKAWvV9kZ81Q=;
        b=JSKZmJKKPx6FnwdyVCTWbQVoNEONU7yyu4D9tPh7cqVnoOo1wquDISuTpmq6HGpu9D
        ZtaZ6hxvdRZiXlvMOS4szpqHbrV89rPYGlK0vnITOAc3dj5OEOrfrebv8yK1eLaKO2X8
        B5OwXUCu+FrwcQYkgVx3qZOI9ren3082lf8Fu06iM2PBUsjfOetNHBwDFptIb8lXNewx
        AJAVPxswfdoJtUWH5QFlil/j8ZYIU/USuJ5+jcshd1HvZXyj2X9baWrXjiwMDhRVyqSw
        sBQECYxrjyxhLE8rbjipR7EcK2Jg03tpQ466e1hO0i3zzPAwoXLUuYrWrA3fcuKaFUi1
        +S7g==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GNcd21/dZ4="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id L09b9cw1QKSSWO8
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 21:28:28 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 10/11] clk: renesas: r8a77965: mark RWDT clock as ignore-unused
Date:   Wed, 26 Feb 2020 21:28:16 +0100
Message-Id: <1582748897-17374-11-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582748897-17374-1-git-send-email-uli+renesas@fpond.eu>
References: <1582748897-17374-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Ensures RWDT remains alert throughout the boot process if enabled.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index b3af4da..d77174b 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -255,6 +255,9 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 static const unsigned int r8a77965_crit_mod_clks[] __initconst = {
 	MOD_CLK_ID(408),	/* INTC-AP (GIC) */
 };
+static const unsigned int r8a77965_used_mod_clks[] __initconst = {
+	MOD_CLK_ID(402),	/* RWDT */
+};
 
 /*
  * CPG Clock Data
@@ -340,6 +343,8 @@ const struct cpg_mssr_info r8a77965_cpg_mssr_info __initconst = {
 	/* Critical Module Clocks */
 	.crit_mod_clks		= r8a77965_crit_mod_clks,
 	.num_crit_mod_clks	= ARRAY_SIZE(r8a77965_crit_mod_clks),
+	.used_mod_clks		= r8a77965_used_mod_clks,
+	.num_used_mod_clks	= ARRAY_SIZE(r8a77965_used_mod_clks),
 
 	/* Callbacks */
 	.init			= r8a77965_cpg_mssr_init,
-- 
2.7.4

