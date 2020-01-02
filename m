Return-Path: <SRS0=OKYY=2X=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E79FC2D0DC
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  2 Jan 2020 14:12:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 312E22253D
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  2 Jan 2020 14:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgABOMw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 2 Jan 2020 09:12:52 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:45238 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728443AbgABOMw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jan 2020 09:12:52 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id lSCn2100M5USYZQ06SCnzC; Thu, 02 Jan 2020 15:12:51 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1in1DT-0006OT-BY; Thu, 02 Jan 2020 15:12:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1in1DT-00006t-AE; Thu, 02 Jan 2020 15:12:47 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        David Lechner <david@lechnology.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] dt-bindings: display: sitronix,st7735r: Add Okaya rh128128t
Date:   Thu,  2 Jan 2020 15:12:44 +0100
Message-Id: <20200102141246.370-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102141246.370-1-geert+renesas@glider.be>
References: <20200102141246.370-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for the Okaya RH128128T display, which is a 128x128
1.44" TFT display driven by a Sitronix ST7715R TFT Controller/Driver.

ST7715R and ST7735R are very similar.  Their major difference is that
the former is restricted to displays of up to 132x132 pixels, while the
latter supports displays up to 132x162 pixels.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/display/sitronix,st7735r.txt          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
index cd5c7186890a2be7..87ebdcb294e29798 100644
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
@@ -4,7 +4,9 @@ This binding is for display panels using a Sitronix ST7735R controller in SPI
 mode.
 
 Required properties:
-- compatible:	"jianda,jd-t18003-t01", "sitronix,st7735r"
+- compatible:	Must be one of the following combinations:
+		  - "jianda,jd-t18003-t01", "sitronix,st7735r"
+		  - "okaya,rh128128t", "sitronix,st7715r"
 - dc-gpios:	Display data/command selection (D/CX)
 - reset-gpios:	Reset signal (RSTX)
 
-- 
2.17.1

