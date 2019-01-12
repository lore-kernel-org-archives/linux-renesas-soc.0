Return-Path: <SRS0=Lk/a=PU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6414C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 12 Jan 2019 17:43:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D05C2084C
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 12 Jan 2019 17:43:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Q/LQeiaA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfALRnm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 12 Jan 2019 12:43:42 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41508 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfALRnl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Jan 2019 12:43:41 -0500
Received: by mail-lf1-f65.google.com with SMTP id c16so12982644lfj.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Jan 2019 09:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2z/r262fqM1eWLKOzAcjl6EirWYW8EoTiXy6sHT7aJE=;
        b=Q/LQeiaAoz+2GEVh0UEb2Jqf41YiiuThGgwJX4Hjy3aC4dk52IZMcUBtMTdD/VTNaJ
         dT/C3jyRLUPqqPRLGeRjImxTbCtBjsDw3Y9BJ89/0cgWATGjDFQqYOlRD2XbyKDDZzJX
         UNn1YhZoM63MCyl6/o9ymjXE166dmu/RjK/hgjtsYJXg8aZKSDkxchPa0bPojlAXr00z
         p0LCKNGd6sZz6tdGLM/Ac8Tk+Pj4TEgpbv0uq+JZ+b0ixMP5Xktzy+NIMaoX4P1P5Ah7
         OHfRH7qNxmwt+8OfH7ly0cp1HXQDDH74s9ETunnx6L7NWVrxzTKmvBJyss5IvewG4xDc
         tY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2z/r262fqM1eWLKOzAcjl6EirWYW8EoTiXy6sHT7aJE=;
        b=bMKr6v3kuizLPHxyIQaa4aJawF8+iAcgi1Pt10v8OLutpLW4Xs794bL7TXS7pNAgAx
         2vWk98pdGHvvq19sMTWiMqziFBO1jYT7jZXE6VuSU/WsTDxHNGalmMJk5rf18IfEi86p
         N+l5/8zn3n8OG2Y2woSBdplebTKsqiLv3an/uGeJuRb4HhrRuDvmWWiqA4Im4WLwDvi4
         9sm6PzUU807Ez178DwezPHo1SBAr91J7IGIc3Y5hPXg1S+4llTRyTTWaMzYeewSfnbSc
         PGPbIwSyLUjLPYhjdmMXB54DidOIxydmCstM3qkgxc1mAUtNo6R8DFC3jwWN2MxUl4Hy
         Ij5A==
X-Gm-Message-State: AJcUukeIkUE970F81uOfBp807IJ3H+ivaAxY9cJ2gTOE0yjzCeH9xRh9
        2fl9BpRbfBJyt+ZDVkCn9M638g==
X-Google-Smtp-Source: ALg8bN5PMPgIoa9/wRl35myKK+pGiYNQ0PcXtduBQteoUireS6k9wYGg78BMTWF6OkU59Fc6ethsKg==
X-Received: by 2002:a19:a58d:: with SMTP id o135mr10802095lfe.97.1547315019403;
        Sat, 12 Jan 2019 09:43:39 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.81.102])
        by smtp.gmail.com with ESMTPSA id h21sm15567963lfk.41.2019.01.12.09.43.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Jan 2019 09:43:38 -0800 (PST)
Subject: [PATCH RFC 1/3] arm64: dts: renesas: r8a779{7|8}0: add RPC-IF support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
References: <4b74a2a5-6b3b-9b06-6a8f-fce39124ec59@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <c2a18d73-b9c2-f228-0306-e39dc1b54bc5@cogentembedded.com>
Date:   Sat, 12 Jan 2019 20:43:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <4b74a2a5-6b3b-9b06-6a8f-fce39124ec59@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe RPC-IF in the R8A779{7|8}0 device trees.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   15 +++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   15 +++++++++++++++
 2 files changed, 30 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1038,6 +1038,21 @@
 			status = "disabled";
 		};
 
+		rpc: rpc@ee200000 {
+			compatible = "renesas,r8a77970-rpc";
+			reg = <0 0xee200000 0 0x8100>,
+			      <0 0x08000000 0 0x4000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1325,6 +1325,21 @@
 			status = "disabled";
 		};
 
+		rpc: rpc@ee200000 {
+			compatible = "renesas,r8a77980-rpc";
+			reg = <0 0xee200000 0 0x8100>,
+			      <0 0x08000000 0 0x4000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
