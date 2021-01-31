Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B8FC433DB
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 31 Jan 2021 10:37:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 225DF64E1F
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 31 Jan 2021 10:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhAaKgQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 31 Jan 2021 05:36:16 -0500
Received: from aruko.org ([45.79.249.221]:45612 "EHLO aruko.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230439AbhAaKI2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jan 2021 05:08:28 -0500
X-Greylist: delayed 621 seconds by postgrey-1.27 at vger.kernel.org; Sun, 31 Jan 2021 05:08:26 EST
Received: from localhost.localdomain (unknown [213.111.80.72])
        by aruko.org (Postfix) with ESMTPSA id 14C9B7F496;
        Sun, 31 Jan 2021 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruko.org; s=mail;
        t=1612087039; bh=WaYjN6LulNhQAZc5zhwsQAkXNQ91yI459HM4uMk/86Y=;
        h=From:To:Cc:Subject:Date;
        b=CRGZWkrihQ1uFYO2Y0oYzbvDecHao0u9aMQKSt76J5dxQ6FtdbgYTONUdxYRw/Gy6
         eNAEK+hcPKWHOW5rwNQ3av+Thd6fMuOvPNi8vcFvfY8+5ZAy2FQp1LPIc4mwAa8pd9
         FyfUvgVNBEKBRjUd9oJmdV/tiGMxqJtHP25JK7N0=
From:   Mykyta Poturai <ddone@aruko.org>
Cc:     Mykyta Poturai <ddone@aruko.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: display: Add "disable-hpd" binding
Date:   Sun, 31 Jan 2021 11:57:01 +0200
Message-Id: <20210131095701.965147-1-ddone@aruko.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the "disable-hpd" binding, used to disable hotplug detected
functionality in the driver. When it's enabled the driver assumes that
the connector is always connected and disables the hotplug detect
related IRQ.

Signed-off-by: Mykyta Poturai <ddone@aruko.org>
---
 .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
index 3f6072651182..b2b899f46b86 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
@@ -39,6 +39,7 @@ Optional properties:
 
 - power-domains: Shall reference the power domain that contains the DWC HDMI,
   if any.
+- disable-hpd: Disables the hotplug detect feature
 
 
 Example:
-- 
2.30.0

