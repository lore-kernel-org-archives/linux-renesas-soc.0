Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C0EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 13:41:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3C7120854
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 13:41:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="ED9bFLy9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbfCONlD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 09:41:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41170 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728157AbfCONlD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 09:41:03 -0400
Received: by mail-lf1-f65.google.com with SMTP id 10so6901872lfr.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Mar 2019 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=PfZPM8GS21FkQpqv/SJnI+dHzlc+uyXkOuXO/PyXeUg=;
        b=ED9bFLy9iLZdYe5fsQ1MvLdAR89hdZ+sLX6gTFA4XkuNhWK2vqcJKcX7YEVwf/8w2u
         XYBix8bKbyyc9qMxAYAI0UYHOQK9lf7XEdVn2ZD8ItdGA1iAbt0Mv2FZC4KTc6s5sSBi
         VYMlgEWyBGlZ7cUTjVhxFvQKYaqaZ/GnwfPez6xKOktaibqWW0OxL7gcvFL8M8gxNtuL
         esCM96Y3D34YPxBodoUGlKdrSqaCd1QsY5s/S2XgrQ9K7J0gX8caaH8iSg/x6R4VAsOH
         dIU6k8qo9O7xyuD2rF9dZdyzkcHuNGeodpV/VCwT4TuYZRE6Vlx/OjKljITNPZRWGhZm
         +rcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=PfZPM8GS21FkQpqv/SJnI+dHzlc+uyXkOuXO/PyXeUg=;
        b=FATRXHo/FeB+wtcviuKOMNhIzi7rxak3ERAdt/eBXzjBs4q1UTjqZU8LfoJBwi/01Q
         fQrbin/tMEnEJOMaA+C22Oxnc+So5FZ03p7KlaouuXaqS2/Ik0oPi5qDgoHzv0zuFqru
         REhou2KtojGZiol6v4VAVEpPEhMoAQvpNamD7CrkBNqFz2VnrjgW6o5JumClOjjUltS3
         MDGNhsOOBJf6wIYYan1AmLD37pby2y14v5pxrYLoeUwjbevuLlZwa+9C87v3prxbOvLs
         lETY95lkEqNZeR8ZkEP/VURfSKbH2bnwYH66EDlrDJ09Oo1VInV1GbGVJiWYeWCx6wiz
         xHEA==
X-Gm-Message-State: APjAAAXIMd23gs/AfyzXNUdJDNgXmK370DPtOiFp2tD/HB8EiqxsWN1b
        5TvjPb/KYX32LgaB7yyFVEcSBg==
X-Google-Smtp-Source: APXvYqxJwbzeKbDOImQw0l2GyYA1gnY8/NQ9ICnlp8hUpa/gHjhGGZnQTVqg0jsLFUCpdOlMRF8Pmw==
X-Received: by 2002:ac2:5921:: with SMTP id v1mr2270704lfi.135.1552657260195;
        Fri, 15 Mar 2019 06:41:00 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id l12sm425365lfc.61.2019.03.15.06.40.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2019 06:40:59 -0700 (PDT)
Date:   Fri, 15 Mar 2019 14:40:58 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH RFC] mmc: renesas_sdhi: update copyright information
Message-ID: <20190315134058.GD26015@bigcity.dyn.berto.se>
References: <20190314225441.310-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190314225441.310-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2019-03-14 23:54:41 +0100, Wolfram Sang wrote:
> Mostly year updates, but one addition as well.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

> ---
> 
> I checked the git history to back up these changes to the best of my knowledge.
> I chose to not modify the copyright information of other people but give them
> here the chance to speak up :)
> 
> 
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

-- 
Regards,
Niklas Söderlund
