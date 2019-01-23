Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B492FC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 18:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B72921855
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 18:04:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Lpg3V3zO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbfAWSEc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 13:04:32 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37391 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfAWSEc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 13:04:32 -0500
Received: by mail-lj1-f194.google.com with SMTP id t18-v6so2780190ljd.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jan 2019 10:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l6zEXssNlGT1HWDNuFNUCJZIK/aDeBC6op2m8ToZv4E=;
        b=Lpg3V3zO6brwyDW140XtZPrpVgWNlJ8HeWr3l5lfzFOOZRwhHF96WTkXloFaWAsu8j
         DlhgLOGDgNgkJbJRRCgfwiZKhzfsDyfH8/bkEoBsEgsuQPLbOagQC1jEDks/uaZLQoWv
         NDH/qdCfIsJm62ZKSRKqxE89braxGkwHXNDTxApkQ2Sym9/erK2YS3GSFlkC0L6vnqWq
         /YFTNPyorP/SoT0I8hbRgqh1SF3nx/Te9e9hP1FabWExvnx7kNBQxrpKfCZFiRNCaHt8
         Nf+Ey+KvpPZyMzmc4GeMtfPsIDB17vuLdCB09prvis6zDx6Yu+x89LliPGfQfqN+pWy0
         p3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=l6zEXssNlGT1HWDNuFNUCJZIK/aDeBC6op2m8ToZv4E=;
        b=lUfHlrNxaWDuGSkymf+Kj4NgBgfET3UrOTe46TEaJSgS3pmL6Oa2k3VzFolRVszBvJ
         LcZppW4Dij+5/lUVQDb9Wk7tt3nUtKnJCUVGOvn1bFZ7U5Et23XtKdDO/dOgJBmwVq4P
         8Te+FGWYJrbKbVk8y3V4BBj9ScDzbG0loAKJl57mylOXevrIIURV525N+z8l2qxfNLe/
         xpPZ15DDlf4eLMbnryjnxBuPtrSAoyCquNUzH6Y5BqRgdB8Kb3UvviLGvhtRuXyRKW1y
         3eZGaEn4S/wHYWDLFTrRkeHirqxl0VCeOllu/odZCnTrkPrGFfqHfNDbO91pPlrlbeTt
         ZaZg==
X-Gm-Message-State: AJcUukcCsg+hiw7mPcKVDFURIaTpjLdY1o8t/qzkVjlddX801oc8ydVn
        y96xF9QxYZwIISKcH+9G65dzaA==
X-Google-Smtp-Source: ALg8bN7V9WSRw2sA540roKgZCoJSH6x6Web6kRUZ2jqbXXdHBAJMe6DwhfnVKZgHDI0WF+K4+sK3Dg==
X-Received: by 2002:a2e:2246:: with SMTP id i67-v6mr2890912lji.154.1548266670222;
        Wed, 23 Jan 2019 10:04:30 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.180])
        by smtp.gmail.com with ESMTPSA id x24-v6sm676916ljc.54.2019.01.23.10.04.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Jan 2019 10:04:29 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v7 1/2] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
 driver
To:     Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, bbrezillon@kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw
References: <1548227352-14910-1-git-send-email-masonccyang@mxic.com.tw>
 <1548227352-14910-2-git-send-email-masonccyang@mxic.com.tw>
Organization: Cogent Embedded
Message-ID: <12af2632-491d-0e01-66c9-0ead4f9d985a@cogentembedded.com>
Date:   Wed, 23 Jan 2019 21:04:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1548227352-14910-2-git-send-email-masonccyang@mxic.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 01/23/2019 10:09 AM, Mason Yang wrote:

> Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]
> diff --git a/drivers/spi/spi-renesas-rpc.c b/drivers/spi/spi-renesas-rpc.c
> new file mode 100644
> index 0000000..0127f25
> --- /dev/null
> +++ b/drivers/spi/spi-renesas-rpc.c
> @@ -0,0 +1,805 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (C) 2018 ~ 2019 Renesas Solutions Corp.
> +// Copyright (C) 2018 Macronix International Co., Ltd.
> +//
> +// R-Car Gen3 RPC-IF SPI/QSPI/Octa driver

   Do we really support Octa?

> +//
> +// Authors:
> +//	Mason Yang <masonccyang@mxic.com.tw>
> +//
[...]
> +#include <asm/unaligned.h>
[...]
> +	} else if (rx_buf) {
> +		//
> +		// RPC-IF spoils the data for the commands without an address
> +		// phase (like RDID) in the manual mode, so we'll have to work
> +		// around this issue by using the external address space read
> +		// mode instead.
> +		//
> +		if (!(smenr & RPC_SMENR_ADE(0xf))) {
> +			regmap_update_bits(rpc->regmap, RPC_CMNCR,
> +					   RPC_CMNCR_MD, 0);
> +			regmap_write(rpc->regmap, RPC_DRCR,
> +				     RPC_DRCR_RBURST(32) | RPC_DRCR_RBE);
> +			regmap_write(rpc->regmap, RPC_DREAR, RPC_DREAR_EAC(1));
> +			regmap_write(rpc->regmap, RPC_DRCMR, rpc->cmd);
> +			regmap_write(rpc->regmap, RPC_DRDMCR, rpc->dummy);
> +			regmap_write(rpc->regmap, RPC_DROPR, 0);
> +			regmap_write(rpc->regmap, RPC_DRENR, smenr);
> +			memcpy_fromio(rx_buf, rpc->dirmap, rpc->xferlen);

   Just noticed: if rpc->dirmap is NULL (which is now allowed), we have a kernel oops
here. :-(

[...]
> +static int rpc_spi_probe(struct platform_device *pdev)
> +{
> +	struct spi_controller *ctlr;
> +	struct resource *res;
> +	struct rpc_spi *rpc;
> +	struct device_node *rpc_if;

   Don't think that's a good name. Why not call it 'flash'?

> +	int ret;
> +
> +	rpc_if = of_get_next_child(pdev->dev.of_node, NULL);
> +	if (!rpc_if) {
> +		dev_warn(&pdev->dev, "no spi-nor device node found\n");

   How about "no flash node found"?

> +		return -ENODEV;
> +	}
> +
> +	ret = of_device_is_compatible(rpc_if, "jedec,spi-nor");
> +	if (!ret) {
> +		dev_warn(&pdev->dev, "no compatible spi-nor device found\n");

   "no SPI-NOR device found"?

[...]
> +	ret = spi_register_controller(ctlr);
> +	if (ret) {
> +		dev_err(&pdev->dev, "spi_register_controller failed\n");
> +		goto err_put_ctlr;
> +	}
> +	return 0;
> +
> +err_put_ctlr:
> +	spi_controller_put(ctlr);
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
[...]
> +static const struct of_device_id rpc_spi_of_ids[] = {
> +	{ .compatible = "renesas,r8a77995-rpc", },

   Why (if it has no differences with the generic gen3 value below)?
Please remove.

> +	{ .compatible = "renesas,rcar-gen3-rpc", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rpc_spi_of_ids);
[...]

MBR, Sergei
