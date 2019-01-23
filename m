Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924F4C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:21:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62E4C21019
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="F6gOrTJO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfAWKVA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 05:21:00 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51196 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfAWKVA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 05:21:00 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E398325BE34;
        Wed, 23 Jan 2019 21:20:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548238858; bh=BLJG+hpxGmtJ9l6gdJBdlsIXz8KuTcTpQcWR2pYr5fI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F6gOrTJOUgjg09Aw+q3rE47qsDMAhouhnOpWf/xIS+E7IwXlXvY8au/MgD2a1k8SW
         RNAQZm7Tz59498l6Vu0RbkayOcIVXnPNhGgXVlBnsrytwputUr6gEmzIoriTRBxnnH
         stwjbxNmx2kc8tny6E0Bk0Z1KEE08IgiYZPPhTmA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 217EF940471; Wed, 23 Jan 2019 11:20:56 +0100 (CET)
Date:   Wed, 23 Jan 2019 11:20:56 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: algo-bit: convert to SPDX header
Message-ID: <20190123102055.ric3gpjq6nabydth@verge.net.au>
References: <20190119121655.5576-1-wsa+renesas@sang-engineering.com>
 <20190119121655.5576-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190119121655.5576-3-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jan 19, 2019 at 01:16:54PM +0100, Wolfram Sang wrote:
> And use kernel style for the remaining comments in the header.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/i2c/algos/i2c-algo-bit.c | 25 ++++++++-----------------
>  include/linux/i2c-algo-bit.h     | 31 ++++++++-----------------------
>  2 files changed, 16 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
> index c33dcfb87993..5e5990a83da5 100644
> --- a/drivers/i2c/algos/i2c-algo-bit.c
> +++ b/drivers/i2c/algos/i2c-algo-bit.c
> @@ -1,21 +1,12 @@
> -/* -------------------------------------------------------------------------
> - * i2c-algo-bit.c i2c driver algorithms for bit-shift adapters
> - * -------------------------------------------------------------------------
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * i2c-algo-bit.c: i2c driver algorithms for bit-shift adapters
> + *
>   *   Copyright (C) 1995-2000 Simon G. Vogl
> -
> -    This program is free software; you can redistribute it and/or modify
> -    it under the terms of the GNU General Public License as published by
> -    the Free Software Foundation; either version 2 of the License, or
> -    (at your option) any later version.
> -
> -    This program is distributed in the hope that it will be useful,
> -    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -    GNU General Public License for more details.
> - * ------------------------------------------------------------------------- */
> -
> -/* With some changes from Frodo Looijaard <frodol@dds.nl>, Kyösti Mälkki
> -   <kmalkki@cc.hut.fi> and Jean Delvare <jdelvare@suse.de> */
> + *
> + * With some changes from Frodo Looijaard <frodol@dds.nl>, Kyösti Mälkki
> + * <kmalkki@cc.hut.fi> and Jean Delvare <jdelvare@suse.de>
> + */
>  
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> diff --git a/include/linux/i2c-algo-bit.h b/include/linux/i2c-algo-bit.h
> index d64cebc6e65a..69045df78e2d 100644
> --- a/include/linux/i2c-algo-bit.h
> +++ b/include/linux/i2c-algo-bit.h
> @@ -1,26 +1,11 @@
> -/* ------------------------------------------------------------------------- */
> -/* i2c-algo-bit.h i2c driver algorithms for bit-shift adapters               */
> -/* ------------------------------------------------------------------------- */
> -/*   Copyright (C) 1995-99 Simon G. Vogl
> -
> -    This program is free software; you can redistribute it and/or modify
> -    it under the terms of the GNU General Public License as published by
> -    the Free Software Foundation; either version 2 of the License, or
> -    (at your option) any later version.
> -
> -    This program is distributed in the hope that it will be useful,
> -    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -    GNU General Public License for more details.
> -
> -    You should have received a copy of the GNU General Public License
> -    along with this program; if not, write to the Free Software
> -    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
> -    MA 02110-1301 USA.							     */
> -/* ------------------------------------------------------------------------- */
> -
> -/* With some changes from Kyösti Mälkki <kmalkki@cc.hut.fi> and even
> -   Frodo Looijaard <frodol@dds.nl> */
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * i2c-algo-bit.h: i2c driver algorithms for bit-shift adapters
> + *
> + *   Copyright (C) 1995-99 Simon G. Vogl
> + * With some changes from Kyösti Mälkki <kmalkki@cc.hut.fi> and even
> + * Frodo Looijaard <frodol@dds.nl>
> + */
>  
>  #ifndef _LINUX_I2C_ALGO_BIT_H
>  #define _LINUX_I2C_ALGO_BIT_H
> -- 
> 2.11.0
> 
