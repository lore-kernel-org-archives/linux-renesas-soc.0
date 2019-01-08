Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA33C43612
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 19:56:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CBCE2064C
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 19:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="xe3w8hDa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729571AbfAHT4z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 14:56:55 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38246 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730576AbfAHT4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 14:56:55 -0500
Received: by mail-lf1-f68.google.com with SMTP id a8so3870326lfk.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Jan 2019 11:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q/bnjJO088heWwu1fEX/FVYCV5yB1DPdDlAS4yBOb7I=;
        b=xe3w8hDag5AALgzM0R/GhgesDxKeb3a/4SMUvWJiJHwmpaxsITez0/onoBOgzw1lhA
         WshagHYzv8oVnsKyLtpGX3KcolWExv3zh1XCCKqEozrUIymI6V4ghWKBAZ5znfbnb99X
         IQxWiCZkkmnNBkI898N4lnQX0Uy4eUb0W4j+2fSyhTwj5l0kKHawExXFCFZSvRtSlPEC
         smZodbYqH38YwLyXhwbRrVsGnj/KeZqBPoOYq1j3yqD7nmIw2mEgGQcgWj8SlUZDz/zI
         coArY2KznBN3tC5YNr6nUDp4EEDRfoUipWeNdO3GXmh+sfsWLG0nYJxz8ec1DQpcdh63
         efoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Q/bnjJO088heWwu1fEX/FVYCV5yB1DPdDlAS4yBOb7I=;
        b=m0EG1kaUXk4XWewpvom8iUp+kx6LPZMmfRdjEKcF2SeOvPVFzZxWks2Z6xMhheyv9m
         O1SmtDDp6ZhbJmTrL6yUXJlx+0pzxq2Ke9gT8n/wisuAgMLjdTH3d2qycOAsGJsiuW61
         l90oIWF7aMeE7HwQjRc/ImohpBdlrQ7SasAyfHmvYnh1UpltvFwNOdiKYU7a7F5qrnas
         3CR5ytyxrbhjJE/pw6GTguyrvZoMDbQau9VkLeRLfBqzL2RJxTdVBQ9EWf9o6gtAco0i
         0ajo42CeGMC8qj1YTaj5BekPQbUW8ofuuhuGu1jpXHDASmN5GucxyQtzLLrD1egfEwFt
         6drg==
X-Gm-Message-State: AJcUukdYPC5mHtGbD0Cme0EfRCYIqPd54k9LhgM0vtF6ZODQwNUyEl2M
        PpgYdcJ05DMOmdFgdaDzxhc1jQ==
X-Google-Smtp-Source: ALg8bN5xf1z091KhOUO02Je2OvpMGVhM7+DAjp0/eDlBJ2ekBB4sTkfOpfC5X8bGpTbLVjFJpuxX+g==
X-Received: by 2002:a19:5f1e:: with SMTP id t30mr1749357lfb.76.1546977412727;
        Tue, 08 Jan 2019 11:56:52 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.198])
        by smtp.gmail.com with ESMTPSA id l63sm13512091lfl.76.2019.01.08.11.56.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jan 2019 11:56:51 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: v3msk: specify EtherAVB PHY IRQ
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
References: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <f9c6b067-80ba-c3c6-abcb-57d9524972fc@cogentembedded.com>
Date:   Tue, 8 Jan 2019 22:56:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Specify EtherAVB PHY IRQ in the V3M Starter Kit board's device tree, now
that we have the GPIO support (previously phylib had to resort to polling).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'renesas-devel-20190107-v5.0-rc1' tag of Simon
Horman's 'renesas.git' repo...

 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts |    2 ++
 1 file changed, 2 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -108,6 +108,8 @@
 	phy0: ethernet-phy@0 {
 		rxc-skew-ps = <1500>;
 		reg = <0>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
