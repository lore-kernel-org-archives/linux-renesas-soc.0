Return-Path: <SRS0=mOvU=PH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC85C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 30 Dec 2018 17:24:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5152A20866
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 30 Dec 2018 17:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ZNLJE6H3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbeL3RYH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 30 Dec 2018 12:24:07 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33931 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbeL3RYH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Dec 2018 12:24:07 -0500
Received: by mail-lj1-f196.google.com with SMTP id u89-v6so22361749lje.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Dec 2018 09:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kcJDyjkX8hGnoEkUlJCs6ipBOL77klfK0W6Cm0EPSOY=;
        b=ZNLJE6H33qqaUa1CoELPIkIDmJmD0xGKIgmx31zqjo8fMN2+Kze464CTt4/9vq7YEl
         wZE4k88s53ns0JkKZ49bxI1Qw4Ewq3/RLNrlf/yhLQDdJ+nSr5XISaIC6K3URCXPzmIS
         2ZzNmj0D7NzMjTTqsMEuAQepmsTZKeO5QKgpY0uljtUkmcGjp0xFMWNnPSKLu3W3DhWZ
         I09vAlNgE0eRPdqeQHBF0kZcVCAHD+45UTDFRDEKFH9YBinXTaHy4a15YYwqQiwNQLPw
         eF/EPOaOQG249qLsqrYDoWChxgvf+N1ThwRuSIRIyNnd4IJF8fPySOdwCdeWgqGMV4Kf
         jGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kcJDyjkX8hGnoEkUlJCs6ipBOL77klfK0W6Cm0EPSOY=;
        b=WPQVZbMhTy9ZtZHOps3s6lijzQkaaCJfTOQQBgzFzbHWk12VPCv9YwjUQr/16CQfp7
         46aDHFfUbsPfVFH0YdYgUnKthQHkFn9b00McmF4HuUl+KSgYZcS9gbu8BHPlisFqE26x
         DHlv/nEcTP17jLkAvhACSzqQdDX7BLFDapNSs2qJYb1jOmFIbV8LoDPsd7HljK4mEKIr
         va4WS2xnwm9Mxryv3U4z8OiIuz4NbNH2N7lVa/BeWPZlng2cIsOp7Zmq8FPQffZZmZn3
         6r352n4W6liOPWsGrf/BF+RndepuV6WJeJrm5+B6OXr+GYIhN2icgbE1zp4L4+XHY2Og
         /BhA==
X-Gm-Message-State: AA+aEWbAMf8Q17zoYKWNP3yPbSoxc6yUpnSeCtlasROVsEE4vJjdoir5
        hSdcARLiSnekx9LvrT/YakavLZSX/nQ=
X-Google-Smtp-Source: AFSGD/XVWumzi76LVCBP71nxYDA1Q8p5D2bHXWnNx09l45eNHZy5POn6B8e+1+GWoIO94GEKkFlSeQ==
X-Received: by 2002:a2e:914b:: with SMTP id q11-v6mr19389571ljg.164.1546190645333;
        Sun, 30 Dec 2018 09:24:05 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.115])
        by smtp.gmail.com with ESMTPSA id m63-v6sm10833349lje.81.2018.12.30.09.24.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Dec 2018 09:24:04 -0800 (PST)
Subject: Re: [PATCH v2 3/3] sh_eth: add R8A77980 support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
References: <f30c98ff-f6da-9e7f-c637-49076a428885@cogentembedded.com>
 <a0dec765-3196-c09d-b41c-c1eb3025a8ad@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <1a075eb3-0575-5df9-c49d-7642930360c1@cogentembedded.com>
Date:   Sun, 30 Dec 2018 20:24:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a0dec765-3196-c09d-b41c-c1eb3025a8ad@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05/18/2018 09:32 PM, Sergei Shtylyov wrote:

> Finally, add support for the DT probing of the R-Car V3H (AKA R8A77980) --
> it's the only R-Car gen3 SoC having the GEther controller -- others have
> only EtherAVB...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
[...]
> Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
> ===================================================================
> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
> +++ net-next/drivers/net/ethernet/renesas/sh_eth.c
> @@ -753,6 +753,49 @@ static struct sh_eth_cpu_data rcar_gen2_
>  	.rmiimode	= 1,
>  	.magic		= 1,
>  };
> +
> +/* R8A77980 */
> +static struct sh_eth_cpu_data r8a77980_data = {
> +	.soft_reset	= sh_eth_soft_reset_gether,
> +
> +	.set_duplex	= sh_eth_set_duplex,
> +	.set_rate	= sh_eth_set_rate_gether,
> +
> +	.register_type  = SH_ETH_REG_GIGABIT,
> +
> +	.edtrr_trns	= EDTRR_TRNS_GETHER,
> +	.ecsr_value	= ECSR_PSRTO | ECSR_LCHNG | ECSR_ICD | ECSR_MPD,
> +	.ecsipr_value	= ECSIPR_PSRTOIP | ECSIPR_LCHNGIP | ECSIPR_ICDIP |
> +			  ECSIPR_MPDIP,
> +	.eesipr_value	= EESIPR_RFCOFIP | EESIPR_ECIIP |
> +			  EESIPR_FTCIP | EESIPR_TDEIP | EESIPR_TFUFIP |
> +			  EESIPR_FRIP | EESIPR_RDEIP | EESIPR_RFOFIP |
> +			  EESIPR_RMAFIP | EESIPR_RRFIP |
> +			  EESIPR_RTLFIP | EESIPR_RTSFIP |
> +			  EESIPR_PREIP | EESIPR_CERFIP,
> +
> +	.tx_check       = EESR_FTC | EESR_CD | EESR_RTO,
> +	.eesr_err_check = EESR_TWB1 | EESR_TWB | EESR_TABT | EESR_RABT |
> +			  EESR_RFE | EESR_RDE | EESR_RFRMER |
> +			  EESR_TFE | EESR_TDE | EESR_ECI,
> +	.fdr_value	= 0x0000070f,
> +
> +	.apr		= 1,
> +	.mpr		= 1,
> +	.tpauser	= 1,
> +	.bculr		= 1,
> +	.hw_swap	= 1,
> +	.nbst		= 1,
> +	.rpadir		= 1,
> +	.rpadir_value   = 2 << 16,
> +	.no_trimd	= 1,
> +	.no_ade		= 1,
> +	.xdfar_rw	= 1,
> +	.hw_checksum	= 1,

   Ugh, the "intelligent" checksum is not actually supported, just a simplistic
checksum (from byte 14). I'll send a fix.

> +	.select_mii	= 1,
> +	.magic		= 1,
> +	.cexcr		= 1,
> +};
>  #endif /* CONFIG_OF */
>  
>  static void sh_eth_set_rate_sh7724(struct net_device *ndev)
[...]

MBR, Sergei
