Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3722AC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:27:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 046C321873
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rP1KqQaO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbeLSK1F (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 05:27:05 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40897 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbeLSK1F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 05:27:05 -0500
Received: by mail-pg1-f193.google.com with SMTP id z10so9254882pgp.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Dec 2018 02:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=wP7yk7EfxcoQNaOKneO+tsw+vFTI71A/k123dOAEeFI=;
        b=rP1KqQaOn5u/WtVy0AlbDTjuljfy9HsQfMjG1cjF1Pgiw5HGplziVEQlTRDTtQmnvh
         n/d1NUjBHs7iJjXQSAm++YuoQISGqYGuoXl7pwsUfs8AtSJ+RPlJ0MvzWY9DDdKBdDkM
         4gMnRI9DfJkrX7uOSZhr7QanNkDtrj0QCQUuwGE8ZAmau7iTM2kEt8AE+prEt9rCFapb
         ltW3QtfSTrkklQcc0AwC+e9zvp2i9wMkNkMuW1NZZFMkW3xuHPva/6HLIjMz1VKd1vlV
         r1J+QA1U4gRNwTIaXXUKqr+ReUdmpEDWvjdVxhh3OXV97lpvyr5lG5/pWduO1Do+Bqjn
         bE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=wP7yk7EfxcoQNaOKneO+tsw+vFTI71A/k123dOAEeFI=;
        b=BdvvjAkMXnEN0nEE8uFG/FlHyqkNxH/PdZwQY6t72q8secMrsljWb5Z3C3Gesb0UsS
         06QhUk1JI8shcb+No3iJr6euYnDSPTtDFPR9nUdKJmdtijis83MQpoyuHq8XGP0DaRso
         1TI19JiLgo3GhnJMuu7zzcsFquIw5nB5anJyJAzH9jEi0epmurHiURQohsE4nt+tgugo
         CneS0a/yJID7z9GPS7jORDduundODMWuUSg1/ytEVHjp8PrAruriHVieNXx5gGerq3ov
         QO1p4cIqmwbZe4w3IbTrVNjP3LUdvMc6m/y6Ls9EKkImIucICu7Qm/R/Wf9dJMPG84ar
         XMmg==
X-Gm-Message-State: AA+aEWaBPv691whg+TGYaqdQjI+Cphrjuq4StmjIc+iAV9JzdmpYQ/Rc
        l/+mfqfssYeIMxTLTKaUXeQ3wDO9
X-Google-Smtp-Source: AFSGD/UWsnLos44CgmSlbnzHq51FXOy1gr8e9caV016/jXdWnHo0A4gKlQswT7fbW2Wuhol9sBUpeA==
X-Received: by 2002:a62:11c7:: with SMTP id 68mr19833743pfr.21.1545215223226;
        Wed, 19 Dec 2018 02:27:03 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id u87sm40446572pfi.2.2018.12.19.02.27.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Dec 2018 02:27:02 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 19 Dec 2018 19:27:30 +0900
Message-Id: <154521525038.7290.12170153110718373437.sendpatchset@octo>
In-Reply-To: <154521516632.7290.5245227863765109428.sendpatchset@octo>
References: <154521516632.7290.5245227863765109428.sendpatchset@octo>
Subject: [PATCH 09/09] Random build workarounds for renesas-drivers
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

The latest renesas-drivers release does not build for me with
the arm64 defconfig. Probably related to my old toolchain.

Take the easy way out and work around the build issues locally.

Not for upstream merge.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Applies on top of renesas-drivers-2018-12-18-v4.20-rc7

 arch/arm64/include/asm/smp.h                    |    2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c |    2 +-
 drivers/tty/serial/sh-sci.c                     |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

--- 0001/arch/arm64/include/asm/smp.h
+++ work/arch/arm64/include/asm/smp.h	2018-12-19 13:51:47.246815997 +0900
@@ -30,7 +30,7 @@
 #define CPU_PANIC_KERNEL		(3)
 
 #define CPU_STUCK_REASON_52_BIT_VA	(1U << CPU_STUCK_REASON_SHIFT)
-#define CPU_STUCK_REASON_NO_GRAN	(2U << CPU_STUCK_REASON_SHIFT)
+#define CPU_STUCK_REASON_NO_GRAN	(2 << CPU_STUCK_REASON_SHIFT)
 
 #ifndef __ASSEMBLY__
 
--- 0001/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ work/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c	2018-12-19 14:06:48.699077685 +0900
@@ -560,7 +560,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_dat
 
 static const struct dw_mipi_dsi_phy_ops dw_mipi_dsi_rockchip_phy_ops = {
 	.init = dw_mipi_dsi_phy_init,
-	.get_lane_mbps = dw_mipi_dsi_get_lane_mbps,
+	//.get_lane_mbps = dw_mipi_dsi_get_lane_mbps,
 };
 
 static void dw_mipi_dsi_rockchip_config(struct dw_mipi_dsi_rockchip *dsi,
--- 0001/drivers/tty/serial/sh-sci.c
+++ work/drivers/tty/serial/sh-sci.c	2018-12-19 13:42:38.328037070 +0900
@@ -1347,7 +1347,7 @@ static int sci_submit_rx(struct sci_port
 {
 	struct dma_chan *chan = s->chan_rx;
 	struct uart_port *port = &s->port;
-	unsigned long flags;
+	unsigned long flags = 0;
 	int i;
 
 	for (i = 0; i < 2; i++) {
