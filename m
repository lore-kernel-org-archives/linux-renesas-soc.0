Return-Path: <SRS0=jiO1=QR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7712BC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 10 Feb 2019 13:39:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C34E2145D
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 10 Feb 2019 13:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="B4hUS4PF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfBJNja (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 10 Feb 2019 08:39:30 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45255 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfBJNja (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Feb 2019 08:39:30 -0500
Received: by mail-lf1-f66.google.com with SMTP id b20so5742558lfa.12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Feb 2019 05:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Ia8UKabONkDynIxrOf/HTuW6A8wO/OE8Cn2w7uvOhLU=;
        b=B4hUS4PFXhMaWQkNYOgxIjhdPQcsbOoVmlYe33HznRjg2AZ7ETQYPC/lzCo3EJ8b5t
         YeuZmIQmuV5gmk/4xsUVTtghBjAuxy2/RHueA8CpIgzC2YXo5rOn8nZ0K9kHmWbBZMyB
         shrSpmKO8A+xfqHxYUhSljKEfYnlUPSadjOombOWSDkC1GqbIOrmS0c1h03JNxzt3TG3
         Ip5831fCQ/dtpUbfB1A96QP/TLIwuq8nCVMsWkVkSJBrovXOpILkimpzYhglGi9rB2O9
         CgILQh9r8oTpkOjrtkg7CR5BMCVed8GYiKUdo5SU6SqGIfnMjF9hzZKv3rcazM2fz1fO
         ny4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Ia8UKabONkDynIxrOf/HTuW6A8wO/OE8Cn2w7uvOhLU=;
        b=aq49HWk69TfVMiMkJagfXacOomMa7/67OJ2An1+dRIcddG0lIzz8CTrapm1u5rNt4P
         OqRGHytR/Ak6cQqfaIAIE8ZBZmlo7ipqp6LQAgs/eAz1fD1zuT/Ol6z0E/MXdq7cP9Tm
         bzcrUivT0qVDgT+y+pLD71rTdDq26/gTuAsPqRgjBSv0/KpB8IX/ArYhn/w3AX027RlB
         GmbEZtLf7xvXDyWIESMQUVcErTo5vI8fFqdxXt+YPO47wBTGebhVREuE00tGay45DzTL
         4GNAdV/lRqiyfOrWxI++mXFoBRLtLMzF6GQKiyFTsAteocSy+V8s4/85oIzWjZ9pO0Rb
         UGzA==
X-Gm-Message-State: AHQUAubeyBo++bnUz14/9ZiCRb/g8UTHHsQQiTpYzyBpsR91BV1ZoMAz
        LB7sWPKvEuI6eVC0Tmzejfe/bg==
X-Google-Smtp-Source: AHgI3IYK/TjZL8Mk0wjcVcQ+DBdKELF1rx6qX0X8zeg4Nm/ikXWZ+LlTBAFKPEnqa5md8C2WDamLrg==
X-Received: by 2002:a19:9813:: with SMTP id a19mr19190210lfe.103.1549805967340;
        Sun, 10 Feb 2019 05:39:27 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id m12sm1654602lfc.30.2019.02.10.05.39.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Feb 2019 05:39:26 -0800 (PST)
Date:   Sun, 10 Feb 2019 14:39:26 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Change HW adjustment register
 according to speed mode
Message-ID: <20190210133926.GD31044@bigcity.dyn.berto.se>
References: <20190208193002.16915-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190208193002.16915-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2019-02-08 20:30:02 +0100, Wolfram Sang wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
> 
> SCC is used for SDR104/HS200/HS400. We need to change SCC_DT2FF
> according to the mode. If it is inappropriate, CRC error tends to occur.
> 
> This adds variable "tap_hs400" for HS400 mode and configures SCC_DT2FF
> as needed.
> 
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: rebased to upstream and updated commit message]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I think this looks good.

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

> ---
> 
> I don't have a testcase currently, so I don't think this is stable material. If
> this ever changes, we can have it added to stable later. But I am open for
> other opinions here. Tested on Salvator-XS with Renesas R-Car M3N, no
> regressions in both detecting HS400 and transferring large files.
> 
>  drivers/mmc/host/renesas_sdhi.h               | 2 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 8 ++++++++
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  3 files changed, 11 insertions(+)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index da1e49c45bec..8394a7bb1fc1 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -15,6 +15,7 @@
>  struct renesas_sdhi_scc {
>  	unsigned long clk_rate;	/* clock rate for SDR104 */
>  	u32 tap;		/* sampling clock position for SDR104 */
> +	u32 tap_hs400;		/* sampling clock position for HS400 */
>  };
>  
>  struct renesas_sdhi_of_data {
> @@ -49,6 +50,7 @@ struct renesas_sdhi {
>  	struct pinctrl_state *pins_default, *pins_uhs;
>  	void __iomem *scc_ctl;
>  	u32 scc_tappos;
> +	u32 scc_tappos_hs400;
>  };
>  
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 7e2a75c4f36f..71e13844df6c 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -337,6 +337,10 @@ static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
>  	/* Set HS400 mode */
>  	sd_ctrl_write16(host, CTL_SDIF_MODE, 0x0001 |
>  			sd_ctrl_read16(host, CTL_SDIF_MODE));
> +
> +	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF,
> +		       priv->scc_tappos_hs400);
> +
>  	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
>  		       (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
>  			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
> @@ -396,6 +400,9 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
>  	/* Reset HS400 mode */
>  	sd_ctrl_write16(host, CTL_SDIF_MODE, ~0x0001 &
>  			sd_ctrl_read16(host, CTL_SDIF_MODE));
> +
> +	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
> +
>  	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
>  		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
>  			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
> @@ -786,6 +793,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  			if (taps[i].clk_rate == 0 ||
>  			    taps[i].clk_rate == host->mmc->f_max) {
>  				priv->scc_tappos = taps->tap;
> +				priv->scc_tappos_hs400 = taps->tap_hs400;
>  				hit = true;
>  				break;
>  			}
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 92c9b15252da..9dfafa2a90a3 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -81,6 +81,7 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
>  	{
>  		.clk_rate = 0,
>  		.tap = 0x00000300,
> +		.tap_hs400 = 0x00000704,
>  	},
>  };
>  
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas Söderlund
