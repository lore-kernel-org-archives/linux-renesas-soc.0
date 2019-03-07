Return-Path: <SRS0=HvZV=RK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B939C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 17:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD83120675
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 17:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="v4er+g9G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfCGRj2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Mar 2019 12:39:28 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38954 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfCGRj2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Mar 2019 12:39:28 -0500
Received: by mail-lf1-f65.google.com with SMTP id r123so12311850lff.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Mar 2019 09:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h21K5iWUtQFNTja8S3/XcFxPmCuv2pYHU5T8pw5EpLQ=;
        b=v4er+g9G6iyQvZplofzQafYb0ldxcWcsYSEd4kpWLTWtMUuhwa5tLAcvqCpZkzPmNo
         tnoY89OWZs8LanLqvyzgp2lhJ+FOpBRt8b4v/HKWeM9TNu3HmKNcG2VIDPz7G2YJNKj6
         o8iF1+JtoXfkQ11NeoX0wo0zvcTaIsRa/Qk/yz5iBwIddBIVKHEHaOepjKeWGc5PW1UQ
         1O221YS9QhQoUwgXls8yjBGWJwfHDd15M6NNDEVEMGyAWPITTjzJz4IiclsguBMNeKR2
         tx76GFhvAOQyVKHaHmd7wqLWlxp7DyaqYQ2/PF5Z/y6XN70I32fep44yf5wxAQdBFeRZ
         tBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=h21K5iWUtQFNTja8S3/XcFxPmCuv2pYHU5T8pw5EpLQ=;
        b=ncEdodPp7tZJcViHdk6nVLT+EE7cxZgnITOUFrT3Ug7842MB7bwg092zF6mreaZtmu
         LgAyuHIdcMEK2AAEBdeGCAoR3lSyEQe0HPzHuEQ+Z7gPXjnR/sG22WIdPgAPH+9rEgSH
         kXzxch/C4/SFzqz7otVO3yh00LCc62Z0QHRvbXMrWo7s6eRr0746w3VWDiq+X0pmLKu8
         Yzl7ZEW5u/n7nm3hi37a+2omTy2J8RObd0c8bLiXkCdz0oUqzj3nN7wXm/MdFjR6hCwu
         pcTX91G9lmtgM9lFOJqwKofiFkSYnrljY0GVlOGBWqIXcDGd7DzY2CYRhqCDCYCt7FAI
         IH+g==
X-Gm-Message-State: APjAAAWr8Xn902WoatRwrpmUtWKKhV8xk2cKRQDsE4LKyzsRMMKzItkT
        dyoAV2aqo/r3D2qLCSPQMTGv5A==
X-Google-Smtp-Source: APXvYqzjJtWDOUnS4fT0hkiwRAZlBPjYToZeM3mq6fn7eyI7zRopm/kdcIkgTdS9ZZ0e+pQo+jsJZQ==
X-Received: by 2002:a19:7614:: with SMTP id c20mr7825494lff.61.1551980365981;
        Thu, 07 Mar 2019 09:39:25 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.80.179])
        by smtp.gmail.com with ESMTPSA id l10sm950698lfk.26.2019.03.07.09.39.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Mar 2019 09:39:25 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH net] ravb: Decrease TxFIFO depth of Q3 and Q2 to one
To:     Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20190307102447.1205-1-horms+renesas@verge.net.au>
Organization: Cogent Embedded
Message-ID: <da3811c8-4614-6e0e-43f3-bb2e36b88a43@cogentembedded.com>
Date:   Thu, 7 Mar 2019 20:39:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190307102447.1205-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 03/07/2019 01:24 PM, Simon Horman wrote:

> From: Masaru Nagai <masaru.nagai.vx@renesas.com>
> 
> Hardware has the CBS (Credit Based Shaper) which affects only Q3
> and Q2. When updating the CBS settings,

   We seem to only write the defaults into TCG, not update them below...
Do we really use TX queues 2/3? I though the driver only uses TX queues
0/1...

> even if the driver does so
> after waiting for Tx DMA finished, there is a possibility that frame
> data still remains in TxFIFO.
> 
> To avoid this, decrease TxFIFO depth of Q3 and Q2 to one.
> 
> This patch has been exercised this using netperf TCP_MAERTS, TCP_STREAM
> and UDP_STREAM tests run on an Ebisu board. No performance change was
> detected, outside of noise in the tests, both in terms of throughput and
> CPU utilisation.

> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Signed-off-by: Masaru Nagai <masaru.nagai.vx@renesas.com>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> [simon: updated changelog]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index d28c8f9ca55b..8154b38c08f7 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -458,7 +458,7 @@ static int ravb_dmac_init(struct net_device *ndev)
>  		   RCR_EFFS | RCR_ENCF | RCR_ETS0 | RCR_ESF | 0x18000000, RCR);
>  
>  	/* Set FIFO size */
> -	ravb_write(ndev, TGC_TQP_AVBMODE1 | 0x00222200, TGC);
> +	ravb_write(ndev, TGC_TQP_AVBMODE1 | 0x00112200, TGC);

   Looks harmless... and DaveM has already merged it anyway. :-)

MBR, Sergei
