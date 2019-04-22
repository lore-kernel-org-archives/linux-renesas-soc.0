Return-Path: <SRS0=1BOO=SY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BC4C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 22 Apr 2019 18:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D53B20896
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 22 Apr 2019 18:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="OYjpxqmZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbfDVScu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 22 Apr 2019 14:32:50 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45610 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727373AbfDVScu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Apr 2019 14:32:50 -0400
Received: by mail-lj1-f193.google.com with SMTP id y6so11097229ljd.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2019 11:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RUCt3VnNVSlsRuUbpNRCWirIHICmh5VTYp71WQCjflY=;
        b=OYjpxqmZHh9QYZgokxG4SH7GIicpDksstNVoefMHs5PWuZdKiayYLFxNuNasKqLjjr
         DhzRoaYlmiNLPRz6MMj45e+8ELMBoHmII+ikNYTCoaARIoU9UglrGr+7gNVIulGhrEM7
         yGLSAFjOWYUFdn9ip5eiDa4J50XsevboEFpsVupm7eM1nIbhtBypPIM8RYIIPWItfpdD
         ysIntXew5y9zIMWUAN24tKTjtKyax4Wb+pVxYBmdDmKai2Rm/WsawNge8PzNWODZB6D8
         XYZfJ3MAxYPpGXypHl6Wbf9f/KABTTuOg5ba+PI4NfeFLPIFoJ9KOLe9Pm2exyDihUQO
         gqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RUCt3VnNVSlsRuUbpNRCWirIHICmh5VTYp71WQCjflY=;
        b=rGP6YtZ5BxpnoNNjk3CvCwEMpfdN+SQ6ULxJLuy4vBHU6RgTKwJuk98fy0v5VP4AsO
         cPibU9hBHgmxrwFdB/6UTJ4CyZufL4L13IuzYaLv+pzBazn2IQeGwv2/mWzpiyT99jQ8
         yF5BMPA63R2Lfaq5wDIBPTgXrqCZlPmnZ5HE7Drwk8TwvxgTWpoHSKqnBcMcMVQlFZtc
         OSBk/+5dzi9lbko/5ggGSIxCTydQuBhp0x6t4ZcSlGtoVxGu7J2nNY3z2EaVQ7Oi8HT/
         9jCR/788aysw6GiJynXwK9YZijQNVkW5FL2hOCiObpzxNeImBSaU85GSXb9diWg/7zo+
         S2vw==
X-Gm-Message-State: APjAAAUujQpp3RFXtqQIJUPmAkb+zZXoF8HaxpFxGxnPuCBmyPaxljfS
        z/+h190SPKNobVi5s2byojPmqw==
X-Google-Smtp-Source: APXvYqzRa33fVbEdzoDY5qMP2l8YrBxVxcUbXvxn9OdGollupqDKx+w+vF2BAV4KOAlOzJl0Op+jfA==
X-Received: by 2002:a2e:292:: with SMTP id y18mr11146906lje.52.1555957968898;
        Mon, 22 Apr 2019 11:32:48 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.82.98])
        by smtp.gmail.com with ESMTPSA id l22sm2813750lja.97.2019.04.22.11.32.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Apr 2019 11:32:47 -0700 (PDT)
Subject: Re: [PATCH v11 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
 driver
To:     Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, bbrezillon@kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc:     juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw
References: <1555903925-15292-1-git-send-email-masonccyang@mxic.com.tw>
 <1555903925-15292-3-git-send-email-masonccyang@mxic.com.tw>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <d2a7a471-2847-b774-42b1-9feb8f4c69f3@cogentembedded.com>
Date:   Mon, 22 Apr 2019 21:32:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1555903925-15292-3-git-send-email-masonccyang@mxic.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 04/22/2019 06:32 AM, Mason Yang wrote:

> Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

  Do dote that I'm opposed to the driver separation as it's presented in
this patches, and I have a large patch reworking both MFD and SPI drivers
in the works.

> diff --git a/drivers/spi/spi-renesas-rpc.c b/drivers/spi/spi-renesas-rpc.c
> new file mode 100644
> index 0000000..634222d
> --- /dev/null
> +++ b/drivers/spi/spi-renesas-rpc.c
> @@ -0,0 +1,571 @@
[...]
> +static int rpc_spi_probe(struct platform_device *pdev)
> +{
> +	struct spi_controller *ctlr;
> +	struct rpc_mfd *rpc_mfd = dev_get_drvdata(pdev->dev.parent);
> +	struct rpc_spi *rpc;
> +	int ret;
> +
> +	ctlr = spi_alloc_master(&pdev->dev, sizeof(*rpc));
> +	if (!ctlr)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, ctlr);
> +
> +	rpc = spi_controller_get_devdata(ctlr);
> +
> +	rpc->mfd = rpc_mfd;
> +	ctlr->dev.of_node = pdev->dev.parent->of_node;
> +
> +	pm_runtime_enable(&pdev->dev);
> +	ctlr->auto_runtime_pm = true;
> +
> +	ctlr->num_chipselect = 1;
> +	ctlr->mem_ops = &rpc_spi_mem_ops;
> +	ctlr->transfer_one_message = rpc_spi_transfer_one_message;
> +
> +	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
> +	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_TX_QUAD | SPI_RX_QUAD;
> +
> +	pm_runtime_get_sync(&pdev->dev);
> +	rpc_spi_hw_init(rpc);
> +	pm_runtime_put(&pdev->dev);
> +
> +	ret = spi_register_controller(ctlr);
> +	if (ret) {
> +		dev_err(&pdev->dev, "spi_register_controller failed\n");
> +		goto err_put_ctlr;
> +	}
> +
> +	return 0;

   Previous formatting was better, shouldn't have moved the empty line above
*return*...

> +err_put_ctlr:
> +	spi_controller_put(ctlr);
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
[...]

MBR, Sergei

