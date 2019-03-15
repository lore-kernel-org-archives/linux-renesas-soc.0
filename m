Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15858C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:07:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4DF920854
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:07:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="QTjTF65t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbfCOMH4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 08:07:56 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35800 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728916AbfCOMH4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 08:07:56 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 69FD725B76D;
        Fri, 15 Mar 2019 23:07:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552651673; bh=nG2NK5jmeAO1Z0vMAaay3K5yqcpBR6WoFKOtL7uQh3Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QTjTF65tA/bhbipHeRLXU8/CMsCUZu1x42oGJ+cBEQP9UAYIgo17/JiXtlzXzyW3W
         sITOx4zdAtwPERl2tNYBmY3LPxdHX/oiYCG/PrtepS9VrLwUitp5jyJtlDf+G8G8nc
         9bwbv7WRqbs1Cpb/9ImWmUPuZ8LrrJEQdjPhHRFU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CF8239403F2; Fri, 15 Mar 2019 13:07:51 +0100 (CET)
Date:   Fri, 15 Mar 2019 13:07:51 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH RFC] mmc: renesas_sdhi: update copyright information
Message-ID: <20190315120751.aowwvu4hsnpkb62u@verge.net.au>
References: <20190314225441.310-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190314225441.310-1-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 14, 2019 at 11:54:41PM +0100, Wolfram Sang wrote:
> Mostly year updates, but one addition as well.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> I checked the git history to back up these changes to the best of my knowledge.
> I chose to not modify the copyright information of other people but give them
> here the chance to speak up :)

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

>  drivers/mmc/host/renesas_sdhi.h               | 2 +-
>  drivers/mmc/host/renesas_sdhi_core.c          | 4 ++--
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 ++-
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 4 ++--
>  drivers/mmc/host/tmio_mmc.h                   | 4 ++--
>  drivers/mmc/host/tmio_mmc_core.c              | 4 ++--
>  6 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 8394a7bb1fc1..c0504aa90857 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -3,7 +3,7 @@
>   * Renesas Mobile SDHI
>   *
>   * Copyright (C) 2017 Horms Solutions Ltd., Simon Horman
> - * Copyright (C) 2017 Renesas Electronics Corporation
> + * Copyright (C) 2017-19 Renesas Electronics Corporation
>   */
>  
>  #ifndef RENESAS_SDHI_H
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 71e13844df6c..923719e1282a 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -2,8 +2,8 @@
>  /*
>   * Renesas SDHI
>   *
> - * Copyright (C) 2015-17 Renesas Electronics Corporation
> - * Copyright (C) 2016-17 Sang Engineering, Wolfram Sang
> + * Copyright (C) 2015-19 Renesas Electronics Corporation
> + * Copyright (C) 2016-19 Sang Engineering, Wolfram Sang
>   * Copyright (C) 2016-17 Horms Solutions, Simon Horman
>   * Copyright (C) 2009 Magnus Damm
>   *
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index af0288f04200..751fe91c7571 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -2,8 +2,9 @@
>  /*
>   * DMA support for Internal DMAC with SDHI SD/SDIO controller
>   *
> - * Copyright (C) 2016-17 Renesas Electronics Corporation
> + * Copyright (C) 2016-19 Renesas Electronics Corporation
>   * Copyright (C) 2016-17 Horms Solutions, Simon Horman
> + * Copyright (C) 2018-19 Sang Engineering, Wolfram Sang
>   */
>  
>  #include <linux/bitops.h>
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index bfbf36634faa..1d29b822efb8 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -2,8 +2,8 @@
>  /*
>   * DMA support use of SYS DMAC with SDHI SD/SDIO controller
>   *
> - * Copyright (C) 2016-17 Renesas Electronics Corporation
> - * Copyright (C) 2016-17 Sang Engineering, Wolfram Sang
> + * Copyright (C) 2016-19 Renesas Electronics Corporation
> + * Copyright (C) 2016-19 Sang Engineering, Wolfram Sang
>   * Copyright (C) 2017 Horms Solutions, Simon Horman
>   * Copyright (C) 2010-2011 Guennadi Liakhovetski
>   */
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index 64e00d8f3a88..c5ba13fae399 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -4,8 +4,8 @@
>   *
>   * TC6393XB TC6391XB TC6387XB T7L66XB ASIC3
>   *
> - * Copyright (C) 2015-17 Renesas Electronics Corporation
> - * Copyright (C) 2016-17 Sang Engineering, Wolfram Sang
> + * Copyright (C) 2015-19 Renesas Electronics Corporation
> + * Copyright (C) 2016-19 Sang Engineering, Wolfram Sang
>   * Copyright (C) 2016-17 Horms Solutions, Simon Horman
>   * Copyright (C) 2007 Ian Molton
>   * Copyright (C) 2004 Ian Molton
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index dfc15ce41191..130b91cb0f8a 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -4,8 +4,8 @@
>   *
>   * TC6393XB, TC6391XB, TC6387XB, T7L66XB, ASIC3, SH-Mobile SoCs
>   *
> - * Copyright (C) 2015-17 Renesas Electronics Corporation
> - * Copyright (C) 2016-17 Sang Engineering, Wolfram Sang
> + * Copyright (C) 2015-19 Renesas Electronics Corporation
> + * Copyright (C) 2016-19 Sang Engineering, Wolfram Sang
>   * Copyright (C) 2017 Horms Solutions, Simon Horman
>   * Copyright (C) 2011 Guennadi Liakhovetski
>   * Copyright (C) 2007 Ian Molton
> -- 
> 2.11.0
> 
