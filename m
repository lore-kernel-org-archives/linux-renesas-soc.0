Return-Path: <SRS0=HvZV=RK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DECC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 17:50:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB72620661
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 17:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="dsEIyU5H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfCGRut (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Mar 2019 12:50:49 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37007 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbfCGRum (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Mar 2019 12:50:42 -0500
Received: by mail-lf1-f65.google.com with SMTP id u2so5388466lfd.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Mar 2019 09:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nZoviCFVsTrCX9IAb32HfyhhfC36KNP7zZS1oreaM4w=;
        b=dsEIyU5HeO9ZMz1GCrF7yggqbQtLDND6+HjB3ncGRNtiHMUWJZwmGnKgbZ8sIutHcR
         dskHBpHMPXa2sSYmZEnkX0gS96MiVZJiRTIdPlyWMMQU37mfsWhpqPqWcZhcLWE1PMLZ
         s1zprCq/IXOTT3hyPthhx1cUgeSpE4Qp4aiqemSZVn7Cg8L2RNM2pxx9HtP77T+C5EBC
         Q9nO9hSyonc4uEdkiEY7d5CKbhC+OCGAFmC5EgI29oh+Vg2jT4A/6Z5nzXq/XpBwXIvV
         IEKs6gz35mlMXED+kdBcuv6DXarPEhdZqdxWhIaPHTlItk1pYrQGxqbwcLpmSI8ZHAhp
         p9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=nZoviCFVsTrCX9IAb32HfyhhfC36KNP7zZS1oreaM4w=;
        b=Ka6Z712Nr738hZjJuf7GgRQHIqMaAgcsOnypKIzubJosYDPK9iY+8OWvuXAp3pnKr/
         h+RILmvtdMST78aTFHuRW8wECszCjSEKMJuY4erYqwY8GyMl5UV3sMzs/F15ybbvsvoQ
         SF2ZvTtXOvXhtnKqeA8ErYScYXSfBa6BrulC3fM9nLq/7JLOa/j3t2cEYZ7B8h7jSYgk
         Q+CvABgvto+moxV7sRQYjlMCEValNZYpOLCurOJwleOxHojVp9eovrrJ9OoOHagZRQjV
         tMkIHmWEptwPvDA9kAJxloB2Hu73VJQcQmjtvR+Y04ayHz2wCNYoF8n82l0yiFI1Y7VC
         +k5A==
X-Gm-Message-State: APjAAAU5aUX4UFCybPypbfvuWoVy+TSc/9LE+kH611zVfQDetXTQHsNK
        bw6vd9axCuSo5FJ+QZ+3bOdeXg==
X-Google-Smtp-Source: APXvYqwUfdL2B64HMbbv5KUItpYvJNq/QxaitnDeZpbDUyRlf6uJr2ZbbBn53anXL8Fkun1YIUI7qQ==
X-Received: by 2002:a19:4d08:: with SMTP id a8mr7725404lfb.14.1551981039808;
        Thu, 07 Mar 2019 09:50:39 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.80.179])
        by smtp.gmail.com with ESMTPSA id z22sm958466lfb.66.2019.03.07.09.50.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Mar 2019 09:50:39 -0800 (PST)
Subject: Re: [PATCH v8 1/2] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
 driver
To:     Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, bbrezillon@kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw
References: <1548658158-5460-1-git-send-email-masonccyang@mxic.com.tw>
 <1548658158-5460-2-git-send-email-masonccyang@mxic.com.tw>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <0c54ee2c-016a-bc8e-33ae-fbd04191cc49@cogentembedded.com>
Date:   Thu, 7 Mar 2019 20:50:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1548658158-5460-2-git-send-email-masonccyang@mxic.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 01/28/2019 09:49 AM, Mason Yang wrote:

> Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]
> diff --git a/drivers/spi/spi-renesas-rpc.c b/drivers/spi/spi-renesas-rpc.c
> new file mode 100644
> index 0000000..ea12017
> --- /dev/null
> +++ b/drivers/spi/spi-renesas-rpc.c
> @@ -0,0 +1,804 @@
[...]
> +static void rpc_spi_hw_init(struct rpc_spi *rpc)
> +{
> +	//
> +	// NOTE: The 0x260 are undocumented bits, but they must be set.
> +	//	RPC_PHYCNT_STRTIM is strobe timing adjustment bit,
> +	//	0x0 : the delay is biggest,
> +	//	0x1 : the delay is 2nd biggest,
> +	//	On H3 ES1.x, the value should be 0, while on others,
> +	//	the value should be 6.
> +	//
> +	regmap_write(rpc->regmap, RPC_PHYCNT, RPC_PHYCNT_CAL |
> +				  RPC_PHYCNT_STRTIM(6) | 0x260);
> +
> +	//
> +	// NOTE: The 0x1511144 are undocumented bits, but they must be set
> +	//       for RPC_PHYOFFSET1.
> +	//	 The 0x31 are undocumented bits, but they must be set
> +	//	 for RPC_PHYOFFSET2.
> +	//
> +	regmap_write(rpc->regmap, RPC_PHYOFFSET1, RPC_PHYOFFSET1_DDRTMG(3) |
> +		     0x1511144);
> +	regmap_write(rpc->regmap, RPC_PHYOFFSET2, 0x31 |
> +		     RPC_PHYOFFSET2_OCTTMG(4));
> +	regmap_write(rpc->regmap, RPC_SSLDR, RPC_SSLDR_SPNDL(7) |
> +		     RPC_SSLDR_SLNDL(7) | RPC_SSLDR_SCKDL(7));
> +	regmap_write(rpc->regmap, RPC_CMNCR, RPC_CMNCR_MD | RPC_CMNCR_SFDE |
> +		     RPC_CMNCR_MOIIO_HIZ | RPC_CMNCR_IOFV_HIZ |
> +		     RPC_CMNCR_BSZ(0));
> +}

   We clearly need runtime PM get/put() calls around this code. Otherwise,
we're dependant on U-Boot leaving the clocks enabled...

[...]

MBR, Sergei
