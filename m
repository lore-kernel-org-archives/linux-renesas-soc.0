Return-Path: <SRS0=uxQs=OU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A276AC5CFFE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 19:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FACB20879
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 19:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="RORL+k6C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FACB20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbeLKTpd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 14:45:33 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33657 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbeLKTpd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 14:45:33 -0500
Received: by mail-lf1-f65.google.com with SMTP id i26so11719643lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Dec 2018 11:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jikI26sd6oTgWeXyOwyGMkr6RXQ0K0RYCFbgY70rXG8=;
        b=RORL+k6C8HGdYhtF8OBNQrZ2qkt9NwV1Yi3GUrM5c/uxDE9tbtBd8yD2ViyCTrGQa1
         ekTQ5sDU+1ggJJMUQVe0u590oi3SxtClcxytmONBW2RyrkwxxU64BNNuic7IZOTZqR3Y
         ylnuFs3+LZs64Vqehwh4BCqSDQz/rhy7Wh3VDN/WFSKj6p1mTPTopyAzPIx0BdP/F6nw
         VlOTHiq6I9yY3/7AegxeKqoK9PlT616TkLVoZ//ZleVL8l9fqmCYuRXLSN/T2k4U+qd4
         yhDaWQozzYpWP4Yr4G8wi0k5YelBiVO+WdpLSxZCK5TwcYRZk3lnvLhrZc76oBmvlyY3
         AmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jikI26sd6oTgWeXyOwyGMkr6RXQ0K0RYCFbgY70rXG8=;
        b=WOEnsKuotSnEudnjG96lZimSd7MYHlMvEXIvnw/bG6ldKYQSzubbJJTsejtR49vBW6
         COTwPd/CIRMm+bEsnTcvw0nHpEHC3+bn2Jd+eQv9Oi6tKxh3ui9x0LVFTKhuz9vlGLT4
         3RLhLmogdNt8cZSdgoa1OHfDlnXZBPqKnr6PLY5B4Fn0MQkWtWOYMYqW8NWs6oh6zk01
         gpW5K8n0UXQT+g7IjSwCBpYE577NitQKZILVv2nhpqM7fLzE8CHRTYuBJpsRtj+589F8
         CBmoK1UalYdh/aRaXoCZCWuStXhc7Kfj4fc682aDJ/o/dgPaR7Su1Nn6QLatywpRdB3U
         Akfw==
X-Gm-Message-State: AA+aEWaBwb/wEyvoEq6DNAxit9ozAi9UABr2uTGpARVemzK/VKKDgHG5
        fGzEis4s0vdA4BiM/bgMliV87A==
X-Google-Smtp-Source: AFSGD/UibA0dDZJ4efJB1p2aOG3ImOXAvS89SjWI3KeTc41xZPgjqqzj0D0x+N4/SQhKfwPdSmUPDg==
X-Received: by 2002:a19:5a05:: with SMTP id o5mr10929365lfb.140.1544557531468;
        Tue, 11 Dec 2018 11:45:31 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.85.248])
        by smtp.gmail.com with ESMTPSA id h3sm2727086lfj.25.2018.12.11.11.45.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 11:45:30 -0800 (PST)
Subject: Re: [PATCH v3 1/2] spi: Add Renesas R-Car Gen3 RPC SPI controller
 driver
To:     Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, boris.brezillon@bootlin.com,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw
References: <1544181199-3373-1-git-send-email-masonccyang@mxic.com.tw>
 <1544181199-3373-2-git-send-email-masonccyang@mxic.com.tw>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <b638fedc-551a-63e4-9654-f9fed8d0e292@cogentembedded.com>
Date:   Tue, 11 Dec 2018 22:45:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1544181199-3373-2-git-send-email-masonccyang@mxic.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/07/2018 02:13 PM, Mason Yang wrote:

> Add a driver for Renesas R-Car Gen3 RPC SPI controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
[...]
> diff --git a/drivers/spi/spi-renesas-rpc.c b/drivers/spi/spi-renesas-rpc.c
> new file mode 100644
> index 0000000..cec5669
> --- /dev/null
> +++ b/drivers/spi/spi-renesas-rpc.c
> @@ -0,0 +1,776 @@
[...]
> +static const struct soc_device_attribute r8a7795es1[] __initconst = {

   This __initconst shouldn't be there, it causes a build warning.

> +	{ .soc_id = "r8a7795", .revision = "ES1.*" },

   Wait, the driver doesn't really probe on R8A7795 yet!

> +	{ /* sentinel */ }
> +};
> +
> +static void rpc_spi_hw_init(struct rpc_spi *rpc)
> +{
> +	int strtim;
> +	/*
> +	 * NOTE: The 0x260 are undocumented bits, but they must be set.
> +	 *	RPC_PHYCNT_STRTIM is strobe timing adjustment bit,
> +	 *	0x0 : the delay is biggest,
> +	 *	0x1 : the delay is 2nd biggest,
> +	 *	On H3 ES1.x, the value should be 0, while on others,
> +	 *	the value should be 6.
> +	 */
> +	if (soc_device_match(r8a7795es1))
> +		strtim = 0;
> +	else
> +		strtim = 6;
[...]
> +static const struct of_device_id rpc_spi_of_ids[] = {
> +	{ .compatible = "renesas,r8a77995-rpc", },

   We only support R8A77995 now.

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rpc_spi_of_ids);
[...]

MBR, Sergei
