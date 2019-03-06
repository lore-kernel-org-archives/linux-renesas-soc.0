Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE5AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF62220663
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 23:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q8qMZGr3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbfCFXYF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 18:24:05 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46772 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbfCFXYF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 18:24:05 -0500
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C608B81;
        Thu,  7 Mar 2019 00:23:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551914639;
        bh=86PhQOJnL1iP4srL5wcOUY+fFuMJaX9O2IV5M3mB8sg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q8qMZGr3P7ptuIyGFiOid354XDYDW7ogk8X8LiYDE4U8xPagrU5zHg15QoPbD663H
         1xJTFdUVstaDA6vyCvA6naSQcPez9JF+eO4rCQPWA8iMKe993yhMPPpNxpNSpH9jkg
         khoRgrQXxPFQUNdtAvi/AXCHqkZaq9IoS2qAvSn4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH/RFC 05/15] dt-bindings: display: bridge: thc63lvd1024: Document dual-link operation
Date:   Thu,  7 Mar 2019 01:23:35 +0200
Message-Id: <20190306232345.23052-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The THC63LVD1024 LVDS decoder can operate in two modes, single-link or
dual-link. In dual-link mode both input ports are used to carry even-
and odd-numbered pixels separately. Document this in the DT bindings,
along with the related rules governing port and usage.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../bindings/display/bridge/thine,thc63lvd1024.txt         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
index 37f0c04d5a28..4ff6eb9bbc19 100644
--- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
+++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
@@ -28,6 +28,13 @@ Optional video port nodes:
 - port@1: Second LVDS input port
 - port@3: Second digital CMOS/TTL parallel output
 
+The device can operate in single-link mode or dual-link mode. In single-link
+mode, all pixels are received on port@0, and port@1 shall not contain any
+endpoint. In dual-link mode, even-numbered pixels are received on port@0 and
+odd-numbered pixels on port@1, and both port@0 and port@1 shall contain
+endpoints.
+
+
 Example:
 --------
 
-- 
Regards,

Laurent Pinchart

