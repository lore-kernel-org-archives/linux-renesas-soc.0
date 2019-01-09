Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545BCC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 14:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2517A206B7
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 14:00:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfetoDoJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730690AbfAIOAt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 09:00:49 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43080 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730636AbfAIOAt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 09:00:49 -0500
Received: by mail-wr1-f65.google.com with SMTP id r10so7752783wrs.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Jan 2019 06:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vZjCLEPCAt+4U1c3gD/GWGjUg9HPaZfO6HiogV76xX0=;
        b=gfetoDoJh4/rQkkEqfkG7beLuhunI9FjG+SNJNyOvbTJq/svz0OcGwXy5gxbM4sfPf
         u8nrAXtcl7MgbDB7PoKuUYbBlF0U2ZlXWCdJsrk/k5+BMkhZ+KjKRitl6V9rQsRSVS8y
         HUOld1v5GDdD6nTqx1w6v9po6gXdWu91ZhBX1no/msmObGNhAAYWlIAwlZfjz7v1quhN
         00a/KMLnUyPPUR1km+D4ch7gGW2kvvcJYQGry+Yg4toG/5L7+I0GWG4kdT7gh7ErnHGK
         U8aP888WFiCOkj9LE5s1NzTPLua3Ue9JZttBWoOCqcl0zdDjPXYo2ANvAnnvl2x+rmlN
         oNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vZjCLEPCAt+4U1c3gD/GWGjUg9HPaZfO6HiogV76xX0=;
        b=lkzW3qoI4X/xW2N/nv2FASA+eqzXHOGR9XD19FfG/r+0WgEGDq+U9HVH/8rekrDabi
         HxCG2vq6l7TUGKzaD6AXAMyGjjrtlXbpvuLDQM131nc1xsSdjVdsX/hwf+W/J1gUbyCv
         6O8GVjEGMxDU+rsd0TQJE2hHZrLkhLSwF3UyyChIYJ6OlJgA7LWGObGCsjvLzQZZG3cb
         rhxPIwG6hsIpMf4JbK/CsScVUjeWjDnG3O65cGqUskA8duVYQPF7yunSOgBh3qq1IIWo
         2WfRLYtUuPS2VACJ4TfzZsuNQMRQI9AcsE+ItU3kC0vgGLskdJDzMpD+7H36PEmk5ZZ3
         y4jw==
X-Gm-Message-State: AJcUukdjC7DB5x4OkfW6Gq8nlm1OxYdyQb54YjpNpN1y85AfyG+mfc0e
        7tqyYK2UgX4qz7f8ojUL/SxEHqrH
X-Google-Smtp-Source: ALg8bN6yQkHsmN+SOFWU0tXNg3a+dynek9KTyhGgMAoo0CTbnQznS4lKL2wfPqm1uvdeSWT59Ivzyg==
X-Received: by 2002:adf:dfd1:: with SMTP id q17mr5479650wrn.27.1547042447724;
        Wed, 09 Jan 2019 06:00:47 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id k23sm10376044wmj.32.2019.01.09.06.00.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jan 2019 06:00:46 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Fix backlight regulator numbering
Date:   Wed,  9 Jan 2019 15:00:45 +0100
Message-Id: <20190109140045.17449-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

There are two regulator1 nodes in the Ebisu DTS right now, one 3.3V for
the eMMC and one 12V for the backlight. This causes one to be overwritten
by the other, ultimatelly resulting in inoperable eMMC, which depends on
the former. Fix this by renumbering the backlight regulator to regulator2.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Reported-by: Simon Horman <horms+renesas@verge.net.au>
Fixes: 9d16c4a10e07 ("arm64: dts: renesas: r8a77990: ebisu: Add backlight")
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index e0590c0af4c4..89383aa35d65 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -191,7 +191,7 @@
 		clock-frequency = <24576000>;
 	};
 
-	reg_12p0v: regulator1 {
+	reg_12p0v: regulator2 {
 		compatible = "regulator-fixed";
 		regulator-name = "D12.0V";
 		regulator-min-microvolt = <12000000>;
-- 
2.19.2

