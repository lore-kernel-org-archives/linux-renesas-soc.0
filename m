Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB39C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 17:39:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D093D20879
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 17:39:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="a5r7RGGO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfDHRjV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 13:39:21 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34051 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbfDHRjT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 13:39:19 -0400
Received: by mail-lf1-f66.google.com with SMTP id o199so3039763lfo.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Apr 2019 10:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9PQRSWpNhVaQ6UdJRNny5nsFt61xhtCAMsMxoXKZI2s=;
        b=a5r7RGGOHEe38kml9YKAEQ+4ddVZLiyH+BrZ6CkVU2zrVW0V13cEXdcmAQJcQaxYFz
         dOlKeaDUeJD1yUjc9oaZ4G+2j0zGrGoXyAEBDiTwT7W4AxTng/Q0xatxN55gzuN9aBxo
         DJ/1NGyLXFrYw5ZP23uswySsWpDqQs59ZkXDtj0JQ/4+c4vQwKWl38YFPj+ZbiHfcTVy
         vv1WqH0q+awZRTLInI2uB7iJ8t0tB+243/RtZSwZDaBKWqkPqKKAzsmbbEDRunV8vABS
         FK9+2FVe+hMeyjTaO3Y8dx+HT1RUldeHKeqwWI9pSnDnwijqfyhBAAnVL7KfM9UlqCR+
         6pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9PQRSWpNhVaQ6UdJRNny5nsFt61xhtCAMsMxoXKZI2s=;
        b=PIuZamLI9a84y1gyGnHc3nc1ZUDF2jw9F9oDpKKMUVHKlTkWykoBWfdhKybzVYzKIH
         zBfqStzVm5qADIMZKLqeEHD0N46sRddz90SIt1dePT4HAHFKMS/IeXvvEZeQG8rXEUaB
         EmgCGBbYyPe9OzLSQIt0l3PFM7pbCvUPZ7wNEDykPnifzs4WxtrZxQv9mjA74X0RXF7s
         mW3z9ZzILEfIQPVxOeX5dz9OOFD7gEnSL2UdRSF2Q6yYtyHAA4G6ovoL/vYrqb6aR2BZ
         jXcMHyMy0qgp0wav8ALCYWE2rjIcnScLXDfAfvQlLJHOi15GYz7XJ60+Fp/pl5HjmXVM
         6zig==
X-Gm-Message-State: APjAAAW8WdfG+SitTnk4ycsDkPAp+wylyiJ2lK2DMGGav53cbfUjZbs5
        K+hs/8FCs3zixNdScXC78BjIvQ==
X-Google-Smtp-Source: APXvYqyoAqDEEB29v36zaQJ32rs73uwQ2squNuCDh2NOOJGlyh4SWxxZgsl/BxtCCCvha/YtCvBOUQ==
X-Received: by 2002:ac2:5bde:: with SMTP id u30mr4218642lfn.6.1554745156716;
        Mon, 08 Apr 2019 10:39:16 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.87.219])
        by smtp.gmail.com with ESMTPSA id x3sm6093764lfn.64.2019.04.08.10.39.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 10:39:15 -0700 (PDT)
Subject: Re: [PATCH/RFC net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
To:     Simon Horman <horms+renesas@verge.net.au>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20190408082928.22840-1-horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <12616e19-9127-39db-4346-be642c87b596@cogentembedded.com>
Date:   Mon, 8 Apr 2019 20:39:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190408082928.22840-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 04/08/2019 11:29 AM, Simon Horman wrote:

> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> August 24, 2018,

   Rummaged in Cogent's archives but was unable to find that errata...

> the TX clock internal delay mode isn't supported
> on R-Car E3 (r8a77990) and D3 (r8a77995).
> 
> Based on work by Kazuya Mizuguchi.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 4f648394e645..be8af4a382cf 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1969,6 +1969,12 @@ static void ravb_set_config_mode(struct net_device *ndev)
>  	}
>  }
>  
> +static const struct soc_device_attribute ravb_delay_mode_quirk_match[] = {
> +	{ .soc_id = "r8a77990", .revision = "ES1.*" },
> +	{ .soc_id = "r8a77995", .revision = "ES1.*" },
> +	{ /* sentinel */ }
> +};

   I'm OK with this approach (modulo the revisions)...

[...]
> @@ -1979,8 +1985,9 @@ static void ravb_set_delay_mode(struct net_device *ndev)
>  	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_RXID)
>  		set |= APSR_DM_RDM;
>  
> -	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
> -	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
> +	if ((priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
> +	     priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) &&
> +	    !soc_device_match(ravb_delay_mode_quirk_match))

   But don't we need to error out of the probing as we can't set the delay mode
requested?

>  		set |= APSR_DM_TDM;
>  
>  	ravb_modify(ndev, APSR, APSR_DM, set);

MBR, Sergei
