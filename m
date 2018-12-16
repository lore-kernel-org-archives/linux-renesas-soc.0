Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEAFC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 11:31:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48C672086C
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 11:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZqDkFqzy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730116AbeLPLbd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 06:31:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55218 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729910AbeLPLbd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 06:31:33 -0500
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC96359
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Dec 2018 12:31:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544959891;
        bh=31O1Ax/W2eexj7q7Nj7cbl0UD0Sh0SMKGFoRsoQ8f2I=;
        h=From:To:Subject:Date:From;
        b=ZqDkFqzyfYZGPPZo5wq8o/hALv+iVs0ij5+y2nejJGtzx1YKqipqrEY90Mk4p0CwB
         O6UB8m2btoVe8sy17GvHIYKEvumTR78CHzJWa9qqTIqNC3677GL+3tRJ8DiAEmJ7Hy
         HqEqCyDj8UF9+vsETIHWBnFg44qeII9vsuamWL4Y=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a77995: draak: Set better backlight levels
Date:   Sun, 16 Dec 2018 13:32:17 +0200
Message-Id: <20181216113217.11379-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The backlight levels provided in the Draak DT produce a perceived
brightness very biased towards high brightness. Use better brightness
levels based on the CIE 1931 formula.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index cd067319e6f3..7970459192ac 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -28,8 +28,8 @@
 		compatible = "pwm-backlight";
 		pwms = <&pwm1 0 50000>;
 
-		brightness-levels = <256 128 64 16 8 4 0>;
-		default-brightness-level = <6>;
+		brightness-levels = <512 511 505 494 473 440 392 327 241 133 0>;
+		default-brightness-level = <10>;
 
 		power-supply = <&reg_12p0v>;
 		enable-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
-- 
Regards,

Laurent Pinchart

