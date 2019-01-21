Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E403C7113B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 11:49:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D144B2085A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 11:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UscFfFnA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfAULth (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 06:49:37 -0500
Received: from mail-pl1-f181.google.com ([209.85.214.181]:39532 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbfAULth (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 06:49:37 -0500
Received: by mail-pl1-f181.google.com with SMTP id 101so9723616pld.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 03:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=HLkXhTif11mKrb6gMwxDHxuhbgH4xbDycsCwa2nILmo=;
        b=UscFfFnAhLwtls68tATAgW8bdSDpAJ7wgJcMiOyc+SAXE/4qgB347bAdhyszuFMDP0
         JJE1TyoL7s0FUxJetn/ajvrXfAmKrd8Vcg8EijqueOujx0dVIOnqe6olC8buGl5RXQa2
         YbRLGMkGsoJeYl2ZEUQXAIv+UCbBnUxbIn662z1e+quWX9/4v6cRFVvOctewNwb7aKOh
         Yr3TjFR44bQu0kGyQt7j3d6MSY7KekV0M/a9Zq7BgPOzTLA4mcA1xLzpvk66FBCQaAa3
         j1hemJng+ajkNfWwNUl6EJDMOt5TBu5sYpHrF3cdIykWubJk8tDu1dMNGixv5/kT0Da1
         jU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=HLkXhTif11mKrb6gMwxDHxuhbgH4xbDycsCwa2nILmo=;
        b=C0Oup92nrOAJzHIx1MzGac5OWOLYH+XckkZV1VFVo02R4eB8yuFLtWI1OKgiaVTM/C
         djN5dZs8LJIzh6OSGKtTFqll67n3CKYeUkNUI7fVeCRXFa1optDPRq3cFuIBpUJPwTqV
         taetnFQ+NJroxoZ5R1IJi6RE7PoXcJ6fhWDio9NgYqIbfGCid2QhWg/YK7Sdo7/CTSib
         zWETh39F2N36bcF+tFru0LqyC6j/QyGUl0L1BzwF3yaNOzLHZgKv5ZISlz/cSmsyQbtz
         dC1YdFTPxnGCTGyOuGAsMGI/vHheiMAGFd7ZVUCurdCgdAghTJm1lWqTXWBST+n4U1ML
         4LMA==
X-Gm-Message-State: AJcUukcxlnz6X2NG8o2rbwIuR/oNwu8F+e8L2784+4h1LLP/HD0KzW5c
        S5hA3M501MV1mrLbke25uLFog8fE
X-Google-Smtp-Source: ALg8bN619HDxAvC9N9PAw+WlhdTlwbNBeJ346NAj1DcVbs4LFawj0b8qgfiLbsrIFXvQMJR6spBV8g==
X-Received: by 2002:a17:902:e08b:: with SMTP id cb11mr16879448plb.263.1548071376590;
        Mon, 21 Jan 2019 03:49:36 -0800 (PST)
Received: from [127.0.0.1] (30.net042126252.t-com.ne.jp. [42.126.252.30])
        by smtp.gmail.com with ESMTPSA id q75sm23453260pfa.38.2019.01.21.03.49.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 03:49:35 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        geert+renesas@glider.be, Konstantin.Kozhevnikov@cogentembedded.com,
        sergei.shtylyov@cogentembedded.com
Date:   Mon, 21 Jan 2019 20:50:14 +0900
Message-Id: <154807141478.25511.5005581542672184648.sendpatchset@octo>
In-Reply-To: <154807139502.25511.1919986589060151108.sendpatchset@octo>
References: <154807139502.25511.1919986589060151108.sendpatchset@octo>
Subject: [PATCH/RFC 02/02] arm64: dts: renesas: r8a7796: Remove IMR-LX4 device nodes
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Get rid of undocumented IMR-LX4 device nodes for the r8a7796 SoC.

I would much prefer to have a proper driver with documented DT bindings
in upstream instead. However removing DT nodes seems better than this
current half-way state.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7796.dtsi |   20 --------------------
 1 file changed, 20 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7796.dtsi	2019-01-21 17:50:26.171358491 +0900
@@ -2470,26 +2470,6 @@
 			status = "disabled";
 		};
 
-		imr-lx4@fe860000 {
-			compatible = "renesas,r8a7796-imr-lx4",
-				     "renesas,imr-lx4";
-			reg = <0 0xfe860000 0 0x2000>;
-			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 823>;
-			power-domains = <&sysc R8A7796_PD_A3VC>;
-			resets = <&cpg 823>;
-		};
-
-		imr-lx4@fe870000 {
-			compatible = "renesas,r8a7796-imr-lx4",
-				     "renesas,imr-lx4";
-			reg = <0 0xfe870000 0 0x2000>;
-			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 822>;
-			power-domains = <&sysc R8A7796_PD_A3VC>;
-			resets = <&cpg 822>;
-		};
-
 		fdp1@fe940000 {
 			compatible = "renesas,fdp1";
 			reg = <0 0xfe940000 0 0x2400>;
