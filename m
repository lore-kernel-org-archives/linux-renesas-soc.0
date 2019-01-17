Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A58C43612
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 01:50:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0771C206C2
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 01:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eu+fCx4r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbfAQBt7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 20:49:59 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39966 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbfAQBt7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 20:49:59 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yyyyyyyyyyyyyby-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00::2])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6DE4E1D;
        Thu, 17 Jan 2019 02:49:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1547689796;
        bh=YevjtIxNSZMdVh2mTm2ufGiLUfssGr39KJy+zF6NbiA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eu+fCx4rFfJfDENorBq5knR+lovyy6p2c4YuGhHEwO5XZpyMJZOfGiAlv9LreHZvj
         MobMv9mkgTuH1veV3+vu6WKCJZ5U13GxL5LZhS1bFBciRAa3tSzLp/XaIwmjvrcdjh
         jPVCjQT9nbMUEBmJhDkQuRxeJORHmZWoDLkc32cY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 5/6] arm64: dts: renesas: r8a77990: ebisu: Enable LVDS1 encoder
Date:   Thu, 17 Jan 2019 03:49:45 +0200
Message-Id: <20190117014946.9669-6-laurent.pinchart+renesas@ideasonboard.com>
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
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 62bdddcbbae7..df5dc23fd252 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -443,6 +443,8 @@
 };
 
 &lvds1 {
+	status = "okay";
+
 	clocks = <&cpg CPG_MOD 727>,
 		 <&x13_clk>,
 		 <&extal_clk>;
-- 
Regards,

Laurent Pinchart

