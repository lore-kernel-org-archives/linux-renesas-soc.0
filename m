Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52BAC7113B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 11:49:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 727842085A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 11:49:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+hS4le0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbfAULt1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 06:49:27 -0500
Received: from mail-pg1-f174.google.com ([209.85.215.174]:40314 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbfAULt1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 06:49:27 -0500
Received: by mail-pg1-f174.google.com with SMTP id z10so9392776pgp.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 03:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=4Kl9o7uELuiQOR0QddgR/y2O4HM4u/qpQbodApOQKRM=;
        b=V+hS4le0gDmTYKfIl0CsSSCGUeO9SmeqqBxAfYbE6mCmUdH7bNyQwsUCmw18btewKW
         nIbextq+TfuyzIKmjoRwf8yKgJ2rt4vJ66MpftWBXW2vvJHPQ2C1f5srUAQITE7AaOGE
         P5UQkAXxriEhuCWo3efLuIlh582FyUifOdm+UDZizRfkAnX/oTnyT4sXP8WD6h9eoOXe
         OGdyD2I7WHTQBzJ5BGSSCauSPuYu9k0XPiyDuAQJuDAOP6MHLGdE3MGYjVzW+s/vkdjT
         XmBNqaVSq43ptHDeOA59Q9igExd1id60y3bJlHa+k0uMH9uuGbOVKRg7NcLbK9gQqO4S
         H6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=4Kl9o7uELuiQOR0QddgR/y2O4HM4u/qpQbodApOQKRM=;
        b=PIYcA5gxRas6Cz8K6CXCypCnWVjrBlr4A72EI5IJ3skloX0mF6RUYItwRPBm/+WPIT
         flB8m1JwhTjlJQh7D9yFgnwmZ8P26NGlNOMSjWbYdeypkCVyGO64dEhOFek+zKI7YYvE
         MtpNcNXbFXgOpeNhwYig4f5gJQkRxz5B5cGzsfkBxDbhrButLjIfX9tGfFOkdxCVb7qF
         X1Jh1g78zD6MYe73RD4EBpEH5A3yTUOtt5XUtonbdxbKmSTMcylaVcpQEftptZadZPvA
         6P6uxxedoTxIpxxZD26u49jt5dWJsuVKq8Zjukphru0Vg4s+2FnFO/87BxzhUSOuc8nU
         suzw==
X-Gm-Message-State: AJcUukdPxG78Z9iPNSq3smUoR0fDnmArWU5ncko2dWTvHVYaEh4Ht3nB
        v8fg63iOkrccc9peVk6+MjGXXQvl
X-Google-Smtp-Source: ALg8bN5P3t+YQT/NDod+ct5U5nOkYGNB1SpcAy0Dqmgs0JO6Xhdrs/kXJJxk05rJl0LB40shmzCbrA==
X-Received: by 2002:a62:1043:: with SMTP id y64mr29790651pfi.78.1548071365691;
        Mon, 21 Jan 2019 03:49:25 -0800 (PST)
Received: from [127.0.0.1] (30.net042126252.t-com.ne.jp. [42.126.252.30])
        by smtp.gmail.com with ESMTPSA id s9sm18853658pgl.88.2019.01.21.03.49.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 03:49:24 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        sergei.shtylyov@cogentembedded.com,
        Konstantin.Kozhevnikov@cogentembedded.com, geert+renesas@glider.be
Date:   Mon, 21 Jan 2019 20:50:05 +0900
Message-Id: <154807140504.25511.16758316156851099392.sendpatchset@octo>
In-Reply-To: <154807139502.25511.1919986589060151108.sendpatchset@octo>
References: <154807139502.25511.1919986589060151108.sendpatchset@octo>
Subject: [PATCH/RFC 01/02] arm64: dts: renesas: r8a7795: Remove IMR-LX4 device nodes
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Get rid of undocumented IMR-LX4 device nodes for the r8a7795 SoC.

I would much prefer to have a proper driver with documented DT bindings
in upstream instead. However removing DT nodes seems better than this
current half-way state.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   40 ------------------------------
 1 file changed, 40 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2019-01-21 17:48:16.337551506 +0900
@@ -2607,46 +2607,6 @@
 			status = "disabled";
 		};
 
-		imr-lx4@fe860000 {
-			compatible = "renesas,r8a7795-imr-lx4",
-				     "renesas,imr-lx4";
-			reg = <0 0xfe860000 0 0x2000>;
-			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 823>;
-			power-domains = <&sysc R8A7795_PD_A3VC>;
-			resets = <&cpg 823>;
-		};
-
-		imr-lx4@fe870000 {
-			compatible = "renesas,r8a7795-imr-lx4",
-				     "renesas,imr-lx4";
-			reg = <0 0xfe870000 0 0x2000>;
-			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 822>;
-			power-domains = <&sysc R8A7795_PD_A3VC>;
-			resets = <&cpg 822>;
-		};
-
-		imr-lx4@fe880000 {
-			compatible = "renesas,r8a7795-imr-lx4",
-				     "renesas,imr-lx4";
-			reg = <0 0xfe880000 0 0x2000>;
-			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 821>;
-			power-domains = <&sysc R8A7795_PD_A3VC>;
-			resets = <&cpg 821>;
-		};
-
-		imr-lx4@fe890000 {
-			compatible = "renesas,r8a7795-imr-lx4",
-				     "renesas,imr-lx4";
-			reg = <0 0xfe890000 0 0x2000>;
-			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 820>;
-			power-domains = <&sysc R8A7795_PD_A3VC>;
-			resets = <&cpg 820>;
-		};
-
 		fdp1@fe940000 {
 			compatible = "renesas,fdp1";
 			reg = <0 0xfe940000 0 0x2400>;
