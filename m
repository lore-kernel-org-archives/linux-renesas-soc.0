Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40699 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932578AbcG1AMT (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Jul 2016 20:12:19 -0400
Date: Thu, 28 Jul 2016 09:12:14 +0900
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/4] mmc: sh_mobile_sdhi: Add tuning support
Message-ID: <20160728001214.GA16587@verge.net.au>
References: <1469592803-13842-1-git-send-email-horms+renesas@verge.net.au>
 <1469592803-13842-4-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1469592803-13842-4-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 27, 2016 at 01:13:22PM +0900, Simon Horman wrote:
> Add tuning support for use with SDR104 mode
> This includes adding support for the sampling clock controller (SCC).
> 
> Based on work by Ai Kyuse.
> 
> Cc: Ai Kyuse <ai.kyuse.uw@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

...

> +static void sh_mobile_sdhi_hw_reset(struct tmio_mmc_host *host)
> +{
> +	struct sh_mobile_sdhi *priv;
> +
> +	if (host->mmc->caps & MMC_CAP_UHS_SDR104)
> +		return 0;

The above line should be:

		return;
