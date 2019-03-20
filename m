Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD20C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 16:20:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 196F92183E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 16:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="iU+1xoJM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbfCTQUv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 12:20:51 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40177 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbfCTQUv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 12:20:51 -0400
Received: by mail-lj1-f195.google.com with SMTP id q66so2789836ljq.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2019 09:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=aa1McXnpptnvJkR+ldm3CInXa712JglEOVQq8TXrcnc=;
        b=iU+1xoJMXR+uDQ7kPcPUel+gQTOCJ9FfSyU/0swhp0D0IRsrMyu3W6Fsqgkzre+v7P
         tfYU5qXwwhjcI6RS8vdpADgxLYtM33Oz6CAFw9xbA02Lvq2HHenmez9O+ehuULM7a7kR
         p9p1iveeTiLfHcGV/edyOlOc32RiFZQYk+EppA/+Ui4sj5KjH3UWOwV+knrY8SDDVlNz
         3N+Q/Nck1v+lKsEeWV7bCffOWO8zBwtT8pzUJ1rftOExH1dFWQi2a/Ri2BBYJaNHfEeN
         l5Vm+x9KooPs613S91OpVJVejpEC4+SOTk6FQxjdXyzXAlJeUMvTLMMOHAuxCyds30Ef
         T2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=aa1McXnpptnvJkR+ldm3CInXa712JglEOVQq8TXrcnc=;
        b=tsYyfEAAQ1nnoHG785Y+gxwCLcPedLHgB0CnYAav9N6tvCCQXsmtZmYBfZlxKH5maj
         JpCPHpdsEqBThmwqMgv5teW7oyCN6wa1DwmaXduWK7BMLv3VF9fKjfaqvcjvs4tvqRj7
         B5YffXcL4JLODnx34MchGJ1d9wTDks8sxnkSAB943dvIDoOXPAjxo+6wZ9DCLrt6Z0s5
         D1zec4zXmfpiP9ExNe3W2juiXCzqm9NGH7YtycaMVqDzDRmrbuRcVV1L5yjbxNINX7gI
         nPs+ClsvOZnTt5odJcQVDn+UFfFexSiIBW4iR9PVXezyoSP5RWXQA9nfspk1ZYhxWd0D
         5hmA==
X-Gm-Message-State: APjAAAVv6ueLGgUuJKzsHMRxvrqyzeOgxQ1jQMaJyyR8nve2TMrbce6K
        gwXJst/aicb2Z3HPGKGpKjDVlw==
X-Google-Smtp-Source: APXvYqzGfQrKjk/ayoy1uOn7+KC7JD9+9AjJIp83zGWA7VSkrYCyOrNlC4b3OLPM5r24AsPptcDplA==
X-Received: by 2002:a2e:9151:: with SMTP id q17mr14183252ljg.87.1553098848765;
        Wed, 20 Mar 2019 09:20:48 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id b26sm448993lfa.47.2019.03.20.09.20.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Mar 2019 09:20:48 -0700 (PDT)
Date:   Wed, 20 Mar 2019 17:20:47 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: riic: Add Runtime PM support
Message-ID: <20190320162047.GB11558@bigcity.dyn.berto.se>
References: <20190320103003.20107-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190320103003.20107-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-03-20 11:30:03 +0100, Geert Uytterhoeven wrote:
>   - Replace explicit clock handling by Runtime PM calls,
>   - Streamline Runtime PM handling in error paths,
>   - Enable Runtime PM in .probe(),
>   - Disable Runtime PM in .remove(),
>   - Make sure the device is runtime-resumed when disabling interrupts in
>     .remove().

Thanks for this change, it was educational for me to review.

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> I don't think it's worth splitting off the last bug fix in a separate
> (first) patch, using explicit clock handling, as that will be replaced
> immediately by Runtime PM calls.
> ---
>  drivers/i2c/busses/i2c-riic.c | 43 +++++++++++++++++++----------------
>  1 file changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index b75ff144b5704293..f31413fd9521ef9f 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -43,6 +43,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  
>  #define RIIC_ICCR1	0x00
>  #define RIIC_ICCR2	0x04
> @@ -112,12 +113,10 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  {
>  	struct riic_dev *riic = i2c_get_adapdata(adap);
>  	unsigned long time_left;
> -	int i, ret;
> +	int i;
>  	u8 start_bit;
>  
> -	ret = clk_prepare_enable(riic->clk);
> -	if (ret)
> -		return ret;
> +	pm_runtime_get_sync(adap->dev.parent);
>  
>  	if (readb(riic->base + RIIC_ICCR2) & ICCR2_BBSY) {
>  		riic->err = -EBUSY;
> @@ -150,7 +149,7 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  	}
>  
>   out:
> -	clk_disable_unprepare(riic->clk);
> +	pm_runtime_put(adap->dev.parent);
>  
>  	return riic->err ?: num;
>  }
> @@ -281,20 +280,18 @@ static const struct i2c_algorithm riic_algo = {
>  
>  static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
>  {
> -	int ret;
> +	int ret = 0;
>  	unsigned long rate;
>  	int total_ticks, cks, brl, brh;
>  
> -	ret = clk_prepare_enable(riic->clk);
> -	if (ret)
> -		return ret;
> +	pm_runtime_get_sync(riic->adapter.dev.parent);
>  
>  	if (t->bus_freq_hz > 400000) {
>  		dev_err(&riic->adapter.dev,
>  			"unsupported bus speed (%dHz). 400000 max\n",
>  			t->bus_freq_hz);
> -		clk_disable_unprepare(riic->clk);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto out;
>  	}
>  
>  	rate = clk_get_rate(riic->clk);
> @@ -332,8 +329,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
>  	if (brl > (0x1F + 3)) {
>  		dev_err(&riic->adapter.dev, "invalid speed (%lu). Too slow.\n",
>  			(unsigned long)t->bus_freq_hz);
> -		clk_disable_unprepare(riic->clk);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto out;
>  	}
>  
>  	brh = total_ticks - brl;
> @@ -378,9 +375,9 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
>  
>  	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
>  
> -	clk_disable_unprepare(riic->clk);
> -
> -	return 0;
> +out:
> +	pm_runtime_put(riic->adapter.dev.parent);
> +	return ret;
>  }
>  
>  static struct riic_irq_desc riic_irqs[] = {
> @@ -439,28 +436,36 @@ static int riic_i2c_probe(struct platform_device *pdev)
>  
>  	i2c_parse_fw_timings(&pdev->dev, &i2c_t, true);
>  
> +	pm_runtime_enable(&pdev->dev);
> +
>  	ret = riic_init_hw(riic, &i2c_t);
>  	if (ret)
> -		return ret;
> -
> +		goto out;
>  
>  	ret = i2c_add_adapter(adap);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	platform_set_drvdata(pdev, riic);
>  
>  	dev_info(&pdev->dev, "registered with %dHz bus speed\n",
>  		 i2c_t.bus_freq_hz);
>  	return 0;
> +
> +out:
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;
>  }
>  
>  static int riic_i2c_remove(struct platform_device *pdev)
>  {
>  	struct riic_dev *riic = platform_get_drvdata(pdev);
>  
> +	pm_runtime_get_sync(&pdev->dev);
>  	writeb(0, riic->base + RIIC_ICIER);
> +	pm_runtime_put(&pdev->dev);
>  	i2c_del_adapter(&riic->adapter);
> +	pm_runtime_disable(&pdev->dev);
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
