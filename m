Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:49280 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751666AbcGFUk2 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 6 Jul 2016 16:40:28 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC v3 1/6] mmc: sh_mobile_sdhi, tmio: make dma more modular
Date: Wed, 06 Jul 2016 22:43:26 +0200
Message-ID: <3888420.7E5mgG7hxa@wuerfel>
In-Reply-To: <1467836610-18539-2-git-send-email-horms+renesas@verge.net.au>
References: <1467836610-18539-1-git-send-email-horms+renesas@verge.net.au> <1467836610-18539-2-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, July 6, 2016 10:23:25 PM CEST Simon Horman wrote:
> 
> +static struct tmio_mmc_dma_ops tmio_dma_ops;
> +
> +void tmio_set_dma_ops(const struct tmio_mmc_dma_ops *ops)
> +{
> +       tmio_dma_ops = *ops;
> +}
> +EXPORT_SYMBOL(tmio_set_dma_ops);
> +
> 

Having a global instance of this pointer seems wrong, why not
store the pointer per device in struct tmio_mmc_host?

It's unlikely to ever clash between two devices in the same system,
but we generally try not to rely on that.

	Arnd
