Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284F9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 20:46:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E283520C01
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 20:46:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQSKB/l9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbfBYUqZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 15:46:25 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36265 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfBYUqZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 15:46:25 -0500
Received: by mail-pf1-f195.google.com with SMTP id n22so5049840pfa.3;
        Mon, 25 Feb 2019 12:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=NxP2nkP8W4UwiEV0v/NJRG7eQEN1ZIj/d54T6LLEMjw=;
        b=VQSKB/l9InBkLf851GSsVqC1shW8dBZ2C4ni0u33bnApznlJK4EOL749tCoKf+w6se
         o5kWSjM6fpOgriiqGML0HiUCx3xzhgnPAl8/bSA/ISJKzJL2zMSipNOPkid1lt5Lc9H8
         eMoanAAoVYsk64559eMVG3eFskp45ARICTysyCwfKtefMKK+18gySDtpBPviTbCUn5fb
         fkOcK/gtveUdEdPLhjcaOlXJm/a004hCKrQVS6Oep1SZc1Czzi3hwss5DjshHabYjg5Y
         VFRtO0r/u84Nl6IrOZEFDgClYoYu3mjolAfaP2wCD+9DIJuqh1nnwfLWkbsVy32ZGp9M
         d+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NxP2nkP8W4UwiEV0v/NJRG7eQEN1ZIj/d54T6LLEMjw=;
        b=C9PJjO0fM9QsY6VhrVP44LhS9mJgQCNGnAYZYNGE9SDq8MtxSeXOVjnB/eeNC9Gdkt
         M2384LEviLPvao7C1kC72GN1+/M0ZbtC5nEjorKSiU8XdheUtfCYy99SurYcGEA6OQrZ
         I1iIv0d/7+nWqC12Utd1CqnBw1F6AlhxmSi1QktSr7sCdHes1Eb/AI/J0bvIHmkGkDZB
         h7dgiqEN4wS6qHaXzJOyuWiqYPscFl3T6HnKKSgMaNO4L6QL0Qgwivc5p+js1Jae6xla
         OqnFmpPL9Gp2riOMhAmAtG8aMEgYa/kv1XrAL/VC8YxdSw0OGxU2cnfUQafPRS05jTkK
         9NIQ==
X-Gm-Message-State: AHQUAuam6Yy4ZoIpyRK++Vrn8aeSOv2h5Qbx4iodlvqGccBiMJ+pFpyd
        vXWDRf4SDrv/rC6A+j+PDoi8Th/+
X-Google-Smtp-Source: AHgI3IZT5+rAQBRur+VileNuhDUiyTxsUY2Shd3Reldx/LTuVJilicRL1AX2o1AasefJeU2nkELiPA==
X-Received: by 2002:a65:40c5:: with SMTP id u5mr20622253pgp.275.1551127583918;
        Mon, 25 Feb 2019 12:46:23 -0800 (PST)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id d23sm14848913pfn.180.2019.02.25.12.46.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 25 Feb 2019 12:46:23 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFT] thermal: rcar_thermal: update calculation formula for E3
Date:   Tue, 26 Feb 2019 05:45:58 +0900
Message-Id: <1551127558-28916-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

HW manual changes temperature calculation formula for E3:
- When CTEMP is less than 24
   T = CTEMP[5:0] * 5.5 - 72
- When CTEMP is equal to/greater than 24
   T = CTEMP[5:0] * 5 - 60

This was inspired by a patch in the BSP by Van Do <van.do.xw@renesas.com>

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the master branch of Linus Torvalds's linux tree.

 drivers/thermal/rcar_thermal.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index 97462e9..11df0cc 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -52,6 +52,7 @@ struct rcar_thermal_chip {
 	unsigned int irq_per_ch : 1;
 	unsigned int needs_suspend_resume : 1;
 	unsigned int nirqs;
+	unsigned int ctemp_bands;
 };
 
 static const struct rcar_thermal_chip rcar_thermal = {
@@ -60,6 +61,7 @@ struct rcar_thermal_chip {
 	.irq_per_ch = 0,
 	.needs_suspend_resume = 0,
 	.nirqs = 1,
+	.ctemp_bands = 1,
 };
 
 static const struct rcar_thermal_chip rcar_gen2_thermal = {
@@ -68,6 +70,7 @@ struct rcar_thermal_chip {
 	.irq_per_ch = 0,
 	.needs_suspend_resume = 0,
 	.nirqs = 1,
+	.ctemp_bands = 1,
 };
 
 static const struct rcar_thermal_chip rcar_gen3_thermal = {
@@ -80,6 +83,7 @@ struct rcar_thermal_chip {
 	 * interrupts to detect a temperature change, rise or fall.
 	 */
 	.nirqs = 2,
+	.ctemp_bands = 2,
 };
 
 struct rcar_thermal_priv {
@@ -263,7 +267,12 @@ static int rcar_thermal_get_current_temp(struct rcar_thermal_priv *priv,
 		return ret;
 
 	mutex_lock(&priv->lock);
-	tmp =  MCELSIUS((priv->ctemp * 5) - 65);
+	if (priv->chip->ctemp_bands == 1)
+		tmp =  MCELSIUS((priv->ctemp * 5) - 65);
+	else if (priv->ctemp < 24)
+		tmp = MCELSIUS(((priv->ctemp * 55) - 720) / 10);
+	else
+		tmp = MCELSIUS((priv->ctemp * 5) - 60);
 	mutex_unlock(&priv->lock);
 
 	if ((tmp < MCELSIUS(-45)) || (tmp > MCELSIUS(125))) {
-- 
1.9.1

