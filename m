Return-Path: <SRS0=IirQ=YB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4079C4360C
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Oct 2019 06:06:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B64E20673
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Oct 2019 06:06:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729879AbfJHGGb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Oct 2019 02:06:31 -0400
Received: from mgwkm02.jp.fujitsu.com ([202.219.69.169]:60203 "EHLO
        mgwkm02.jp.fujitsu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729847AbfJHGGb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Oct 2019 02:06:31 -0400
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by mgwkm02.jp.fujitsu.com with smtp
         id 1a4d_3c71_f7fd5f03_8797_4b6d_b756_9481681c9f1f;
        Tue, 08 Oct 2019 15:06:23 +0900
Received: from durio.utsfd.cs.fujitsu.co.jp (durio.utsfd.cs.fujitsu.co.jp [10.24.20.112])
        by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 59AA8AC00D6
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Oct 2019 15:06:23 +0900 (JST)
Received: by durio.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1008)
        id 381101FF217; Tue,  8 Oct 2019 15:06:23 +0900 (JST)
From:   Keiya Nobuta <nobuta.keiya@fujitsu.com>
To:     geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org, nobuta.keiya@fujitsu.com
Subject: [PATCH 2/4] pinctrl: sh-pfc: pfc-r8a7795-es1: Fix typo in pinmux macro for SCL3
Date:   Tue,  8 Oct 2019 15:06:17 +0900
Message-Id: <20191008060619.30237-2-nobuta.keiya@fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191008060619.30237-1-nobuta.keiya@fujitsu.com>
References: <20191008060619.30237-1-nobuta.keiya@fujitsu.com>
X-TM-AS-GCONF: 00
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SCL3 is assigned to GPSR2 bit7 referred by IP1_23_20 macro.

Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 95f9aae..ad05da8 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -718,7 +718,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_PHYS_MSEL(IP1_23_20, HRX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
 	PINMUX_IPSR_PHYS_MSEL(IP1_23_20, VI4_DATA7_B,		I2C_SEL_3_0,	SEL_VIN4_1),
 	PINMUX_IPSR_PHYS_MSEL(IP1_23_20, IERX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
-	PINMUX_IPSR_PHYS(IP0_23_20,	SCL3,			I2C_SEL_3_1),
+	PINMUX_IPSR_PHYS(IP1_23_20,	SCL3,			I2C_SEL_3_1),
 
 	PINMUX_IPSR_PHYS_MSEL(IP1_27_24, PWM2_A,		I2C_SEL_3_0,	SEL_PWM2_0),
 	PINMUX_IPSR_MSEL(IP1_27_24,	A20,			I2C_SEL_3_0),
-- 
2.7.4

