Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE27C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 14:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B6FA20830
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 14:48:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="lXlKPyU8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfDCOsa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 10:48:30 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:30773 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfDCOsa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 10:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1554302908;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=72M3vFmJCYTXlUTg8dNm1vFgmDAMjqp4RVSlG11yfnU=;
        b=lXlKPyU8kcKeLXDNE4PXklPXMa4qEonUdAjwOzE0YRiVkvsySQA6OdfnDzjWYj5eh3
        5IlR/SmANKP6A+2GIe+bYwK6AISy0EeAZMeKiDjZ1rhHl4PaePGdIeWqbFZSZEepLsAq
        Y9H3X2y8gv0jsH4QO21kayZ/Z6GQ017qi6Og53+C5IJ5TWVLHvtcXENf77JeyKTxeCt9
        e/Cw6V3Rlo1jUMGU+En1tgGFx4vg+AdP+A/JATURD7rKBZC2EIxyRff5e/laRFFnCNgA
        lyOMJTXZBKiEm3QuiBmPWX9HBb43/jgJa635ryF3t3zLhD8Tp2isMFNlL2mW/0XR6hS3
        q7FQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82dZd67HY0g="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
        with ESMTPSA id L0be16v33EjOXzI
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 3 Apr 2019 16:45:24 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc:     wsa@the-dreams.de, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] pinctrl: sh-pfc: r8a7796: Remove placeholder I2C pin data
Date:   Wed,  3 Apr 2019 16:45:16 +0200
Message-Id: <1554302716-14750-2-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554302716-14750-1-git-send-email-uli+renesas@fpond.eu>
References: <1554302716-14750-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Pin data for I2C controllers 0, 3 and 5 is properly defined already.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index d5e95f2..38cce69 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1499,11 +1499,6 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP18_7_4,	FMIN_C,			SEL_FM_2),
 	PINMUX_IPSR_MSEL(IP18_7_4,	FMIN_D,			SEL_FM_3),
 
-	/* I2C */
-	PINMUX_IPSR_NOGP(0,		I2C_SEL_0_1),
-	PINMUX_IPSR_NOGP(0,		I2C_SEL_3_1),
-	PINMUX_IPSR_NOGP(0,		I2C_SEL_5_1),
-
 /*
  * Static pins can not be muxed between different functions but
  * still need mark entries in the pinmux list. Add each static
-- 
2.7.4

