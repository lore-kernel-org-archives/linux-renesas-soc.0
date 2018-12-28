Return-Path: <SRS0=txgz=PF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905B9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 28 Dec 2018 10:47:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 587BB20879
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 28 Dec 2018 10:47:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="nF6DiesM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731620AbeL1KrN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 28 Dec 2018 05:47:13 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44784 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731566AbeL1KrN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Dec 2018 05:47:13 -0500
Received: by mail-lf1-f68.google.com with SMTP id z13so14300623lfe.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Dec 2018 02:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0ZCl6ZG0yrPBJNzXP8/AjkaIley30btquvTw03eZwtQ=;
        b=nF6DiesM1y72tuOLqo2Wt1LvFRArQg82/XtHFdlGSO5Vp2Mxv9odZtg9fBquHf6Lpn
         TIrMxUGVP8hswbaAIWdBTFaReFXnemWlpS+/XTWIjUcDgcAql1M8HyW3nCnWyCj+Z8BI
         dQVxWn9jV9vm3kPW96tCyWLK31OoRJUTrxiUTYwKn+9tvF2h/EVZghdS/QiAsMQIWDez
         W+vcsHAKr967dxTWAboZi6f4DFkgml6nn6ecZbA4zYWhKlJLUKMpQSlh6msgQJNyBx2E
         RHDm/xWM6f1qKMmFLIELdKWW2UxEaCC78Ii4ecxUqWR/4gXJhkSIWD/0+uzrUh58HiFj
         RRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0ZCl6ZG0yrPBJNzXP8/AjkaIley30btquvTw03eZwtQ=;
        b=PK1b0fBthEVUZQg8OC3iJ8f8oGgbew3dGZZ4PS80esw4vzw/Jgi0449oJ5cRhya4si
         YD2Z3zywEI+bdu/o3vzqDotq6ug2m+YcuN6ZUQCb/jEDG45b7iXmzviX/h1i3vNQlAA3
         sadcMCj1icrOK2xzDAYNY4DI+US79vAEvFfH/i0Aojg55u8jOTPZHa6RLxUH90f7+uqe
         HtYxl5nad87AUi80JPjPT2o7rAmqy2m6+q6E8qU+Er6QQqB5k61+CU77iHNDpWm1V6HG
         6IBMFeWpdTQe9DOBUnZoIAjrxyAFHCwqRWh3YxSMWsFQii3cYIPq1o/jdFO2HE0XcTI2
         5Ftw==
X-Gm-Message-State: AA+aEWYvnQb2OMODsUAHsjmpTCrmxSU9ELBcbNAYDssZqTcVlXyyAHHI
        vIMZ2AZhq53mqtXa7XTBsK28Wg==
X-Google-Smtp-Source: AFSGD/UH97j0gNXWC+a7K8ysEfYj35rNdyVvJhKNRy890e0s97WPNgf9Dii5iCfkwD73AJxxZA4nBA==
X-Received: by 2002:a19:a9d2:: with SMTP id s201mr13161007lfe.154.1545994031007;
        Fri, 28 Dec 2018 02:47:11 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.72])
        by smtp.gmail.com with ESMTPSA id s127sm8070677lfe.8.2018.12.28.02.47.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Dec 2018 02:47:10 -0800 (PST)
Subject: [PATCH 1/2] dt-bindings: spi: renesas-rpc: document R8A77980 bindings
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        Mason Yang <masonccyang@mxic.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
References: <72626acd-9d5f-14a1-6464-5fdeba17fece@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <08a3ff4d-3ee3-91dd-c048-55a09b6dfc63@cogentembedded.com>
Date:   Fri, 28 Dec 2018 13:47:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <72626acd-9d5f-14a1-6464-5fdeba17fece@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the R-Car V3H (R8A77980) SoC in the Renesas RPC-IF bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: renesas/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
+++ renesas/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
@@ -2,7 +2,8 @@ Renesas R-Car Gen3 RPC controller Device
 ------------------------------------------------------
 
 Required properties:
-- compatible: should be "renesas,r8a77995-rpc"
+- compatible: should be "renesas,r8a77980-rpc" or
+  	      	        "renesas,r8a77995-rpc"
 - #address-cells: should be 1
 - #size-cells: should be 0
 - reg: should contain 2 entries, one for the registers and one for the direct
