Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89B0C7113B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:16:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B916D20879
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCGpmP+g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbfAUMQv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 07:16:51 -0500
Received: from mail-pg1-f175.google.com ([209.85.215.175]:36015 "EHLO
        mail-pg1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728216AbfAUMQv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 07:16:51 -0500
Received: by mail-pg1-f175.google.com with SMTP id n2so9428431pgm.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 04:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=4fkVNP8g7Sac9iTuFCkvyVlsnGjTxcVAwY3LqnOVm6g=;
        b=PCGpmP+gCh/Xb4PZcUpsuw+LQg/DtI+ZpKofPLKg5woPiQH8lh560uEIEt0Wc/jsxj
         kpZmtLmPYV/UMl1j5Lw5XIFhENdCdRIBZPakrjsDAswnm0kci/5fz6kCxnL1Wtwh2CIW
         gNEPAeOEdHKacjybrCDuvxCsInqJLOzytJ25IOKhMu5AAkcSqZGQaegAAXgggr4n4e52
         84Z+oaHIuVcKV2Vb+46abrCzRs3lh4C1a3efVVzMaAcWO+eBxg4LeWHG/wfsdUcNu/c8
         QVBkhqU00P33PZxSM/g+nzxJE/xZUCEpiTTLkOlEAboELnOQc4HqJAXLi1m/EulfNizW
         tVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=4fkVNP8g7Sac9iTuFCkvyVlsnGjTxcVAwY3LqnOVm6g=;
        b=NyUVgt45s8KxPuVklklzNCcXHpGbYiYk7c1tqTYxEieAgHiHT2tK03uo00aA2EBTs5
         b7EfTLj5YX4PVURVpt+7F+ZpU6ID6LOPJPEYpkL0/zLJCbWtcLn446FikoSBRvAKNlpT
         K84NzUsL/Yy1RCIb0YyON+gXX96ILQnvHY1q8aXREgRjMo0/EV01NQgVRxgLquGPml0h
         TvNQKi+5sPHo/PM7VAZw9S/YZHZS/4lFMlEwPHVjekhlYdashociou4VMmvhMQzXHCBD
         S5P+6qpbyJqjvQT999VEZbUzr1EFqDdWQzDOz1sL2mv0uEBD/NXKcCmhWVHp5mF7h3Ca
         DBrQ==
X-Gm-Message-State: AJcUukcFnxpVb6PpGuGwwRY2J/9w12pNfopBkNws/oXRDygeTgeCY42y
        8bFPo3uVi26RtMd1gId+O8Y+CI+H
X-Google-Smtp-Source: ALg8bN6PdLSThSS8xH7ODBLOodrsK/GjGsPn1Pwf670E2aZEgmSuPKEXplf69OQiSVtQc8C9/iahUA==
X-Received: by 2002:a63:34c3:: with SMTP id b186mr27127560pga.184.1548073010461;
        Mon, 21 Jan 2019 04:16:50 -0800 (PST)
Received: from [127.0.0.1] (30.net042126252.t-com.ne.jp. [42.126.252.30])
        by smtp.gmail.com with ESMTPSA id z191sm16408106pgd.74.2019.01.21.04.16.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 04:16:49 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 21 Jan 2019 21:17:29 +0900
Message-Id: <154807304988.2406.229079645298067371.sendpatchset@octo>
In-Reply-To: <154807300302.2406.14245640502137089757.sendpatchset@octo>
References: <154807300302.2406.14245640502137089757.sendpatchset@octo>
Subject: [PATCH/RFC 05/06] arm64: dts: renesas: r8a77970: One IMP-X5 device for R-Car V3M
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add an IMP-X5 device node to the r8a77970 device tree source.

Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |    9 +++++++++
 1 file changed, 9 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77970.dtsi	2019-01-21 19:45:39.037788940 +0900
@@ -1169,6 +1169,15 @@
 			};
 		};
 
+		imp-x5@ff900000 {
+			compatible = "renesas,imp-x5";
+			reg = <0 0xff900000 0 0x300000>;
+			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 827>;
+			power-domains = <&sysc R8A77970_PD_A3IR>;
+			resets = <&cpg 827>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
