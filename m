Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591FEC43444
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 01:50:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19A2120651
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 01:50:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tlJU5GJP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbfAQBuA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 20:50:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39964 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbfAQBuA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 20:50:00 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yyyyyyyyyyyyyby-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00::2])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36397E21;
        Thu, 17 Jan 2019 02:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1547689796;
        bh=jQkzVZKbBewcoYhv3S+u1LCWMpGO097i3ahy7RSaqIU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tlJU5GJPOBp5FwrXA2OtglgbR6r1VZ57lYBekmLftPHDdE9mV6ugal59LfrvK4/t8
         UmRYVB+SzAFFGHUoI7/npMUx9GCDLtXb2TyeTEZTHPZm6kjXZDgk2kibL9Qr/GsDad
         ddYfKYCwLCMz8lOkjmvWxjEjQNQ/4zU+C2U5WHww=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 6/6] arm64: dts: renesas: r8a77995: draak: Enable LVDS1 encoder
Date:   Thu, 17 Jan 2019 03:49:46 +0200
Message-Id: <20190117014946.9669-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190117014946.9669-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190117014946.9669-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The LVDS1 encoder must supply a pixel clock to the DU for the DPAD
output when the LVDS0 encoder is used. Enable it despite its output not
being connected.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 89df9bc844c0..1879f0feaf88 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -356,6 +356,8 @@
 };
 
 &lvds1 {
+	status = "okay";
+
 	clocks = <&cpg CPG_MOD 727>,
 		 <&x12_clk>,
 		 <&extal_clk>;
-- 
Regards,

Laurent Pinchart

