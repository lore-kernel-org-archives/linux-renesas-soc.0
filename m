Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33850 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753803AbcGVNvS (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 22 Jul 2016 09:51:18 -0400
Received: by mail-lf0-f47.google.com with SMTP id l69so86037031lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2016 06:51:17 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org,
	geert+renesas@glider.be
Subject: [PATCH] pinctrl: sh-pfc: r8a7792: add missing pinmux data
Date: Fri, 22 Jul 2016 16:51:13 +0300
Message-ID: <3787651.qWyGt9oMl5@wasted.cogentembedded.com>
In-Reply-To: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch I've based my R8A7792 PFC work on had some VIN pinmux data missing
and I  just  noticed that while adding the VIN pin groups...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
repo plus my 5 R8A7792 PFC patches  posted before...

 drivers/pinctrl/sh-pfc/pfc-r8a7792.c |    3 +++
 1 file changed, 3 insertions(+)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
@@ -622,6 +622,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP4_10_9, VI0_D18_R2),
 	PINMUX_IPSR_MSEL(IP4_10_9, VI1_D14_G6_Y6, SEL_VI1_0),
 	PINMUX_IPSR_GPSR(IP4_12_11, VI4_D4_C4),
+	PINMUX_IPSR_GPSR(IP4_12_11, VI0_D19_R3),
 	PINMUX_IPSR_MSEL(IP4_12_11, VI1_D15_G7_Y7, SEL_VI1_0),
 	PINMUX_IPSR_GPSR(IP4_14_13, VI4_D5_C5),
 	PINMUX_IPSR_GPSR(IP4_14_13, VI0_D20_R4),
@@ -633,6 +634,8 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP4_18_17, VI0_D22_R6),
 	PINMUX_IPSR_GPSR(IP4_18_17, VI2_D14_Y6),
 	PINMUX_IPSR_GPSR(IP4_20_19, VI4_D8_Y0),
+	PINMUX_IPSR_GPSR(IP4_20_19, VI0_D23_R7),
+	PINMUX_IPSR_GPSR(IP4_20_19, VI2_D15_Y7),
 	PINMUX_IPSR_GPSR(IP4_21, VI4_D9_Y1),
 	PINMUX_IPSR_GPSR(IP4_21, VI3_D12_Y4),
 	PINMUX_IPSR_GPSR(IP4_22, VI4_D10_Y2),
