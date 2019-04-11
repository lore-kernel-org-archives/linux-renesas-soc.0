Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9930C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 19:45:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 867252070D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 19:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="TvCyXazw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbfDKTpF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 15:45:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46556 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726588AbfDKTpE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 15:45:04 -0400
Received: by mail-lj1-f196.google.com with SMTP id h21so6612636ljk.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Apr 2019 12:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fqYotYfW1OFscv2kEeguZ0toHoRM4i7s3xPR45L6huY=;
        b=TvCyXazwHcT/FveYpjlI7PtDJsaSznq3mdo6Yft5cnc7Ql1Zc3iLx2Rxq+4WFjZiru
         frIsD0gmbrGQz4vrAG13T4eLriYrwBwsl/Y+SWC8UUcGZ/7Qe1hYcfH7m7i6dkAUTmx9
         NIe5QVvn9K95+gw0t4hJZXxpR1STbRjSJLxF3frZfvIDt8S6uI9U99h4fm/B/QFLh+x1
         +id3bZK82GvwZcU4Digzc09iDT+mkF6jJnglQqHX8t/t+rMU6xUOkeboiyOPkUgFlwba
         +XSiDfAG9ZA9xwhN9dHi+p6+7ypKn1JBQnhdtnGZkT8inX/n2BMSZ6w1ca3evx+SSWh7
         0zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fqYotYfW1OFscv2kEeguZ0toHoRM4i7s3xPR45L6huY=;
        b=ncgtUbkdM2SygyQbNsVFuRtK66TkTVw6/n8jmENDnjYovcytxQGo+kr0PDKe39LqYR
         3bThlr8x96g4xqTHcEi+HKa++i1zzR06GcwnJdgupbLYEV+Qrxi5xznZKAd8WQZrtoTM
         wRGIrmyb0sMyypUE/jxkD0QkQm+c6DB69G77ExQ+CdsnKeiesLW4NT2aCiXUCy483dj1
         Ha1NEfLJitGtnvbIcjAhBFJFp90ix6TydcZBQjkr/ss5EhsgsVTumKEpxaNS5LxoxacJ
         HU8y9eIEsqX8fR8oLLzyq3cQx0QQOeDV+P3/y/IYynNTrw6j6Z7R9n0ipCl11T+67Zva
         hHdA==
X-Gm-Message-State: APjAAAXEBEeFnY/cg3in1UYIoljhO6uSJDPSO25omh9jP2i9d0tKWXuK
        rDl0qzZCkTlpey5qtl2SVw1Lig==
X-Google-Smtp-Source: APXvYqy+fvYUdRmNuDNj3QHiT7zwvnMDD92Ru7mpy1/xWwyYxCmKOUT0NARN+pt0zEspseq15jS/zg==
X-Received: by 2002:a2e:219:: with SMTP id 25mr27298648ljc.34.1555011903069;
        Thu, 11 Apr 2019 12:45:03 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id u2sm7900957lje.74.2019.04.11.12.45.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 12:45:01 -0700 (PDT)
Date:   Thu, 11 Apr 2019 21:45:00 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        wsa@sang-engineering.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [v2 PATCH] thermal: rcar_gen3_thermal: Add Standby/Reset Mode
 support
Message-ID: <20190411194500.GG30887@bigcity.dyn.berto.se>
References: <1541484506-30736-1-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1541484506-30736-1-git-send-email-na-hoan@jinso.co.jp>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hoan,

Thanks for your work.

Sorry for very late review, somehow this got lost in my inbox.

On 2018-11-06 15:08:26 +0900, Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> According to the hardware manual, Gen3 supports Standby/Reset mode.
> Add this function, and we should use this function while suspend
> to reduce the energy consumption.
> 
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Nice clean commit and matches the datasheet,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Interrupts fire both before and after suspending as expected,

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/thermal/rcar_gen3_thermal.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 7aed533..e654519 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -447,11 +447,32 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static int rcar_gen3_thermal_reset(struct rcar_gen3_thermal_priv* priv)
> +{
> +	unsigned int i;
> +	u32 reg_val;
> +
> +	for (i = 0; i < priv->num_tscs; i++) {
> +		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
> +
> +		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, 0);
> +		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
> +
> +		reg_val = rcar_gen3_thermal_read(tsc, REG_GEN3_THCTR);
> +		rcar_gen3_thermal_write(tsc, REG_GEN3_THCTR, reg_val & ~THCTR_THSST);
> +	}
> +
> +	usleep_range(1000, 2000);
> +
> +	return 0;
> +}
> +
>  static int __maybe_unused rcar_gen3_thermal_suspend(struct device *dev)
>  {
>  	struct rcar_gen3_thermal_priv *priv = dev_get_drvdata(dev);
>  
> -	rcar_thermal_irq_set(priv, false);
> +	/* Reset to enter standby mode */
> +	rcar_gen3_thermal_reset(priv);
>  
>  	return 0;
>  }
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
