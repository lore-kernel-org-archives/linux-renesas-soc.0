Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1470C10F0C
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8DD29206DD
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vd2iCNRP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbfCFXYH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 18:24:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46758 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfCFXYH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 18:24:07 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 679F3E1C;
        Thu,  7 Mar 2019 00:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551914640;
        bh=sEYXzl4iVpjSdQ0qW+KhMV+XCD8Hbcx9qu8+ZG74DJM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vd2iCNRPpkaKxF1SyjZJEzzrt+iKlMeaDVWb5kcDxcjCyUX6t8vgU5Bvy6CqGC/ud
         qLddEjPqBprsehl9xdi2eqinNdtj1FjunzN+pJ/2odRTSAhn4scWHnjoPcatz/xPkX
         KeHfYOT+12zBsTYK+mEDWzWpZGCftpcCGAW2hDfM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: [PATCH/RFC 07/15] dt-bindings: display: renesas: lvds: Add renesas,companion property
Date:   Thu,  7 Mar 2019 01:23:37 +0200
Message-Id: <20190306232345.23052-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a new optional renesas,companion property to point to the companion
LVDS encoder. This is used to support dual-link operation where the main
LVDS encoder splits even-numbered and odd-numbered pixels between the
two LVDS encoders.

The new property doesn't control the mode of operation, it only
describes the relationship between the master and companion LVDS
encoders.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/display/bridge/renesas,lvds.txt     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
index 900a884ad9f5..a720dbb5de69 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -45,6 +45,12 @@ OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
 
 Each port shall have a single endpoint.
 
+Optional properties:
+
+- renesas,companion : phandle to the companion LVDS encoder. This property is
+  valid for the first LVDS encoder D3 and E3 SoCs only, and points to the
+  second encoder to be used as a companion in dual-link mode.
+
 
 Example:
 
-- 
Regards,

Laurent Pinchart

