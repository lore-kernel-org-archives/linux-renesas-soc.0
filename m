Return-Path: <SRS0=txgz=PF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8D0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 28 Dec 2018 10:48:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AA6720855
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 28 Dec 2018 10:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="yaAckREz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731518AbeL1Ks1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 28 Dec 2018 05:48:27 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39801 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731564AbeL1Ks1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Dec 2018 05:48:27 -0500
Received: by mail-lj1-f193.google.com with SMTP id t9-v6so18398273ljh.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Dec 2018 02:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bevbyG5jgvnmzKSa0j7XgRc+8pFWLaW5pxBSf+MtZDg=;
        b=yaAckREzyfTJn6UdFrkZq9H2CuVxCipxnkcmsDQId0mD+ePlMnMv1oeAwOUZyXhjy9
         JmsVb/QgaR0w90dwRvs8fcUaYrfLMtGdSjWILyYCMJBgs2vqG/1N8o399d/ITX9WhsFT
         NhS0XMu6aCMULaA2CkzkCql2+X8ejhwIMX+oA2xHpBXAg8lbtzq64uPvXrYk9UZwQ87e
         LX+NDoX3CXU6UCfpiH8LOAyiWx+qDJnnfz9fypEYbLW1GRCwfKwLpgXj1gjGaAeTkSnp
         LdM2iBplrc0xyejVMUA0f9gAO6A8pxE8TgkOl+BTH1c3d9cgHZKP3xsO2Wm7lmz5YCNY
         hGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bevbyG5jgvnmzKSa0j7XgRc+8pFWLaW5pxBSf+MtZDg=;
        b=PYpDhwMHQtBglyWhiFc3+BRru7kIwdRv783pmfMeNjV6w2AZ0KBtuKTSfd3fSrJ3/J
         nXCrBl1qlIvlzgCjJxdBl7ykvG+oxl6Q2C2dr17dCrXhKNMRVfGxYIJ6SZv/+bSanO2o
         bc7SNPzpo+73GRRKebHDP8b2lax00HTFynpSNCsve3I/cgR40tC5qTclbpjktPdYkcBa
         OPJNnIS7/GTCuM8KUG02m/vRKKB5tGyQhcOJWZWBqQZYStMFFsfnANIvwD1EhWc3dVNA
         O6IZm1nk4xmGLbFnAi5Y5muW9BM5lJ6vII4DNGdSLFI2rkoB6XpX5FEz7sVHPze7mQax
         7Pjg==
X-Gm-Message-State: AA+aEWaUHJFyhrLKD/m8Md0GAA2/qxjLy/BEZ8KfoE7S4iChm4iSBUTi
        h+tmWxPvFLQXGBk+ijfTWMeko8QBvVo=
X-Google-Smtp-Source: ALg8bN6q+MS76rrW0Rad8XSczj/vS7uIJXUSmGsLZwwWmGQEkz9bJCKxk+GInaxNjiCzxkIcsuXlig==
X-Received: by 2002:a2e:9783:: with SMTP id y3-v6mr15511975lji.167.1545994104676;
        Fri, 28 Dec 2018 02:48:24 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.72])
        by smtp.gmail.com with ESMTPSA id i143sm8063012lfg.74.2018.12.28.02.48.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Dec 2018 02:48:24 -0800 (PST)
Subject: [PATCH 2/2] spi-renesas-rpc: add R8A77980 support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        Mason Yang <masonccyang@mxic.com.tw>
Cc:     linux-renesas-soc@vger.kernel.org
References: <72626acd-9d5f-14a1-6464-5fdeba17fece@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <ad4b9505-6362-ebcf-33c6-52039a0ae706@cogentembedded.com>
Date:   Fri, 28 Dec 2018 13:48:22 +0300
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

Add the R-Car V3H (R8A77980) SoC support to the Renesas RPC-IF SPI driver. 

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/spi/spi-renesas-rpc.c |    1 +
 1 file changed, 1 insertion(+)

Index: renesas/drivers/spi/spi-renesas-rpc.c
===================================================================
--- renesas.orig/drivers/spi/spi-renesas-rpc.c
+++ renesas/drivers/spi/spi-renesas-rpc.c
@@ -762,6 +762,7 @@ static int rpc_spi_remove(struct platfor
 }
 
 static const struct of_device_id rpc_spi_of_ids[] = {
+	{ .compatible = "renesas,r8a77980-rpc", },
 	{ .compatible = "renesas,r8a77995-rpc", },
 	{ /* sentinel */ }
 };
