Return-Path: <SRS0=T57Y=2G=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725EBC2D0BF
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Dec 2019 10:29:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A55B20725
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Dec 2019 10:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pKln3/96"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbfLPK3n (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 16 Dec 2019 05:29:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40692 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfLPK3m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 05:29:42 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 245051446;
        Mon, 16 Dec 2019 11:29:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576492176;
        bh=PqCIRiuoRxfir1JLxW5cg/mfITNtQQ6T2YBYYiR7P/Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pKln3/96+ZqHuBbXmbfTA+NgnHVfotTpTLheRoWyv/NhjQHDSOZtSFowVDAH/I9wb
         ahglm85r+MRtepxpCeDi0YgJ1oR0QiW4lP9eva8y3VZhZWKjYdigEMcC4yJLx+O0m8
         QPCnJnlgGgVObe6/yutitUQDTktpd74WI+bQg9Q4=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH v6 09/13] arm64: dts: renesas: r8a7795-es1-salvator-x: Include MAX9286 8 Camera expansion board
Date:   Mon, 16 Dec 2019 10:29:26 +0000
Message-Id: <20191216102930.5867-10-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
References: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
 <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Include the overlay for the dual MAX9286 expansion board, providing 8
FAKRA camera connectors.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
index c72968623e94..a845a988cb06 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
@@ -155,3 +155,6 @@
 
 	status = "okay";
 };
+
+/* Include the max9286 expansion board "overlay" */
+#include "salvator-x-max9286.dtsi"
-- 
2.20.1

