Return-Path: <SRS0=rp0x=R6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51123C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 11:46:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1480B206DF
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 11:46:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="eFfR4v28"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfC0LqM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 07:46:12 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55876 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfC0LqM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 07:46:12 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2B43B25B7E0;
        Wed, 27 Mar 2019 22:46:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553687169; bh=1DUrteTt4L5K3sg/tKLnkC9a6FBIdXJVKMV6gWXVOEQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eFfR4v28VvRbbTVm/aShEDx1bcsv5b07ixyNicwUbN4eyFMC9PjgMM+SfEcnS3ajE
         MePRRIozhfxcyirKV+Bc0+TcllhJvDNsnvNjKCibj1XJJtGf7sNjANpYE+t5ZdmBKX
         gnQ5th8kzdmivCUybaoNhLI82XqczqbBnO7GV3eU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 616BF940376; Wed, 27 Mar 2019 12:46:07 +0100 (CET)
Date:   Wed, 27 Mar 2019 12:46:07 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH v3 03/10] pinctrl: sh-pfc: Add missing #include
 <linux/errno.h>
Message-ID: <20190327114607.zygc6rpzq6igbofb@verge.net.au>
References: <20190320102141.19316-1-geert+renesas@glider.be>
 <20190320102141.19316-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190320102141.19316-4-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 20, 2019 at 11:21:34AM +0100, Geert Uytterhoeven wrote:
> Source files using -Exxx error codes should include <linux/errno.h>.
> On ARM, this header file is included indirectly; on SuperH, it is not,
> leading to "error: ‘EINVAL’ undeclared" failures when enabling
> compile-testing later.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> v3:
>   - No changes,
> 
> v2:
>   - New.
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77470.c    | 1 +
>  drivers/pinctrl/sh-pfc/pfc-r8a7790.c     | 1 +
>  drivers/pinctrl/sh-pfc/pfc-r8a7791.c     | 1 +
>  drivers/pinctrl/sh-pfc/pfc-r8a7794.c     | 1 +
>  drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 1 +
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 1 +
>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 1 +
>  drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 1 +
>  drivers/pinctrl/sh-pfc/pfc-r8a77970.c    | 1 +
>  drivers/pinctrl/sh-pfc/pfc-r8a77980.c    | 1 +
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c    | 1 +
>  drivers/pinctrl/sh-pfc/pfc-r8a77995.c    | 1 +
>  12 files changed, 12 insertions(+)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> index 4359aeb35dbdf8f3..83772abffaf81b66 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2018 Renesas Electronics Corp.
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/kernel.h>
>  
>  #include "sh_pfc.h"
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> index a84229cb8cd4c8a7..202638b9cb54ce5a 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 2012  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/sys_soc.h>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> index d8b13d4e9bbff7cb..d21a520695db1ae4 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
> @@ -6,6 +6,7 @@
>   * Copyright (C) 2014-2017 Cogent Embedded, Inc.
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/kernel.h>
>  
>  #include "sh_pfc.h"
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> index 958a5f714c93d967..d24ba71649a10888 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> @@ -7,6 +7,7 @@
>   * Copyright (C) 2015-2017 Cogent Embedded, Inc. <source@cogentembedded.com>
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/sys_soc.h>
>  
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
> index 0ef7ada08316fa34..52a0fa8abfcca2bd 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2015-2017  Renesas Electronics Corporation
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/kernel.h>
>  
>  #include "core.h"
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> index 1a987dfea46f897a..6400e6304daf25e9 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2015-2017 Renesas Electronics Corporation
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/sys_soc.h>
>  
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> index a99c519e05a01f23..bb1255b9bc24241e 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> @@ -11,6 +11,7 @@
>   * Copyright (C) 2015  Renesas Electronics Corporation
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/kernel.h>
>  
>  #include "core.h"
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
> index 820b74ca9d10236b..c656d26e51503fe5 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
> @@ -12,6 +12,7 @@
>   * Copyright (C) 2015  Renesas Electronics Corporation
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/kernel.h>
>  
>  #include "core.h"
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> index f5868f5e40189441..37d0c1f10901704e 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> @@ -12,6 +12,7 @@
>   * Copyright (C) 2015  Renesas Electronics Corporation
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
> index 376e689c737821b5..42c73913b5c7088c 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
> @@ -12,6 +12,7 @@
>   * Copyright (C) 2015 Renesas Electronics Corporation
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> index 1a8d1ae896c0b0f5..10aa52eb4e32e467 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> @@ -11,6 +11,7 @@
>   * Copyright (C) 2016-2017 Renesas Electronics Corp.
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/kernel.h>
>  
>  #include "core.h"
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> index 0acdfb8bf0777b50..110671d4626c541c 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
> @@ -11,6 +11,7 @@
>   * Copyright (C) 2015  Renesas Electronics Corporation
>   */
>  
> +#include <linux/errno.h>
>  #include <linux/kernel.h>
>  
>  #include "core.h"
> -- 
> 2.17.1
> 
