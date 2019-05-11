Return-Path: <SRS0=cdtB=TL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F4B1C04AB1
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 11 May 2019 21:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D384E20989
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 11 May 2019 21:07:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p3ns6Do9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfEKVHk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 11 May 2019 17:07:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58288 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfEKVHk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 17:07:40 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E40989F9;
        Sat, 11 May 2019 23:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557608855;
        bh=1B7dAooCfZpIkl+dK29uGYb9y0qALr5WKOWOQ2/nL+M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p3ns6Do9pj/WAIEMvZK2n+fuNMkt4x5nyX//mrN7C71aBGjsCRMzXZ6zWX8wCgqYU
         SF4kZJFaFpmfNStXG3CABEsKFsWKeVQ17znfQ46oy1Q4039KOIFI9LCwxehCwA+Sub
         kkWBc59NIb5cyTDpccDMSXtKTqHaHwwiEaOjInlI=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its companion LVDS1
Date:   Sun, 12 May 2019 00:07:00 +0300
Message-Id: <20190511210702.18394-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the new renesas,companion property to the LVDS0 node to point to the
companion LVDS encoder LVDS1.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index d2ad665fe2d9..b52e3fdb5fca 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1731,6 +1731,8 @@
 			resets = <&cpg 727>;
 			status = "disabled";
 
+			renesas,companion = <&lvds1>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 5bf3af246e14..94b5177eb152 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1038,6 +1038,8 @@
 			resets = <&cpg 727>;
 			status = "disabled";
 
+			renesas,companion = <&lvds1>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
Regards,

Laurent Pinchart

