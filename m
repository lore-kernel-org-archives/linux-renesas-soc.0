Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFB5C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFB6820663
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NLA2NdNu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfCFXYL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 18:24:11 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46772 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfCFXYL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 18:24:11 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCFFDE84;
        Thu,  7 Mar 2019 00:24:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551914643;
        bh=wQXCrYOgfS6jdJSGF1H3ZMT4URHeRDWlnICE5c/HVW4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NLA2NdNu7BGag13XHRIEw1VQeCzHsQqNUCC7ygknD9lPAaEzPqHMBiuJImhJIloHh
         faVKuez6kj7z/2tsHnzB17vb2IH/3RATyhDtCXU9v/de7IuQdmnmoS6TB6oFpy6tPk
         EyuVlYix7HhLSYWNO+7lSnPHF9zC9KIheOT7ysxg=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH/RFC 13/15] arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its companion LVDS1
Date:   Thu,  7 Mar 2019 01:23:43 +0200
Message-Id: <20190306232345.23052-14-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
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
index b2f606e286ce..90c5ce8ab7e1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1678,6 +1678,8 @@
 			resets = <&cpg 727>;
 			status = "disabled";
 
+			renesas,companion = <&lvds1>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 8530d9fc1371..81762884a2dc 100644
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

