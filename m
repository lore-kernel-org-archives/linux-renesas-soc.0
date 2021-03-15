Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D2FC4332D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Mar 2021 16:31:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 004D564F2A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Mar 2021 16:31:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbhCOQbA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Mar 2021 12:31:00 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:2673 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbhCOQa5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 12:30:57 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.homenet.telecomitalia.it (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A8F49240007;
        Mon, 15 Mar 2021 16:30:51 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: renesas: eagle: Include eagle-gmsl
Date:   Mon, 15 Mar 2021 17:30:28 +0100
Message-Id: <20210315163028.173148-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315163028.173148-1-jacopo+renesas@jmondi.org>
References: <20210315163028.173148-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Include the eagle-gmsl.dtsi to enable GMSL camera support on the
Eagle-V3M platform.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index d2f63cccc238..555070aae03d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -404,3 +404,6 @@ &scif0 {
 
 	status = "okay";
 };
+
+/* FAKRA Overlay */
+#include "eagle-gmsl.dtsi"
-- 
2.30.0

