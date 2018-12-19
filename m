Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECF4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:26:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F73721850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:26:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUwe20Jw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbeLSK0y (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 05:26:54 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45366 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbeLSK0y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 05:26:54 -0500
Received: by mail-pl1-f193.google.com with SMTP id a14so9262693plm.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Dec 2018 02:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=7wiTZ9DFRLQXNvZ4Jd38Cuuqw5WvDYklxXNND5g6/h8=;
        b=hUwe20JwlqMSalno94oUCaqgV5gdh4WW/MJOCnDks8tXKI4DX+w8LUvGBTv1fpPeDM
         z4MmaQJmQ9pL0eV6vqxWOVZEJuEsG5kJy1PWr4S60qdESquHQNnGqQ5Iza4oiSUXoycl
         XQDzabW3QMp+/xYj978rxmaIFr/rKRD3CipynjeoBCXaiu6JKCR311aZbmk5B3/K05YI
         IyQTvOQ8ZmSKi4mG536JZiIcA6ZA1DGuYj4A5nhcozBGyxb6TNnuqyoXfjhNdsdXszc/
         BZdL8vhNpiiloFvrLhXmCDS/Vms/QL08cp7pj/fcIDLHHMOBx6UTop7DxYzWSyaxyJfa
         6zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=7wiTZ9DFRLQXNvZ4Jd38Cuuqw5WvDYklxXNND5g6/h8=;
        b=pVy3o2ehQj+CX9eZfQuDtGKOvGgEmTV1LkvJMitgUTkYWvFs8EfF/M/607KY7aQyMk
         buarel6ayLBI1PYSd2SJtl9nSV7aJVVONunZJoS5rodryTzmSulWnuBhiF/sdl5E/LX/
         /QVh2L2SyD1JFwMSdc8BU9rUmQDRxvrbmCMK/RnU767kimI02nmiGzGs51uq0rOKC0IV
         3zga62Au9UXgSGZkujXR6UWWrPMV9UsBFzu3jUihZdud/PVwsWHU5xa+cwCVI7PkLuck
         TXwSuIqa+IohhbXYIfeyREzyQllSNo1lfCSQs6XcG5ZbjfR0rtFcQ4CmayMD5rnTfZvR
         b6wA==
X-Gm-Message-State: AA+aEWaIBi5OFXCN2M1pfN3uWQBYMo+xt1XgXWSbg3g236CjMzLXO0IO
        KuS6PnXmTm71zelC+mHGx58oqr2D
X-Google-Smtp-Source: AFSGD/XYn2d+8bJwywcowibMw6ELLvK30+kh60+SQbCuIKT53tAKor8/z0DT/QVzU8+A6BL1ZboNoA==
X-Received: by 2002:a17:902:9897:: with SMTP id s23mr18855853plp.69.1545215213275;
        Wed, 19 Dec 2018 02:26:53 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id f67sm39655027pff.29.2018.12.19.02.26.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Dec 2018 02:26:52 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 19 Dec 2018 19:27:21 +0900
Message-Id: <154521524096.7290.12256850104758543154.sendpatchset@octo>
In-Reply-To: <154521516632.7290.5245227863765109428.sendpatchset@octo>
References: <154521516632.7290.5245227863765109428.sendpatchset@octo>
Subject: [PATCH 08/09] arm64: dts: renesas: r8a77990: One IMR-LX4 device for R-Car E3
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Introduce a single IMR-LX4 device to the r8a77995 dtsi file.

Not for upstream merge.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77995.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77995.dtsi	2018-12-19 16:02:21.065530497 +0900
@@ -936,6 +936,16 @@
 			resets = <&cpg 408>;
 		};
 
+		imr-lx4@fe860000 {
+			compatible = "renesas,r8a77995-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe860000 0 0x2000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 823>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 823>;
+		};
+
 		vspbs: vsp@fe960000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfe960000 0 0x8000>;
