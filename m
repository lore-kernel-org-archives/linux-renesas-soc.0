Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46655 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727713AbeIGNsb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Sep 2018 09:48:31 -0400
Received: by mail-lj1-f196.google.com with SMTP id 203-v6so11650957ljj.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Sep 2018 02:08:30 -0700 (PDT)
Subject: Re: [PATCH] phy: renesas: convert to SPDX identifiers
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <87zhwuoykl.wl-kuninori.morimoto.gx@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b35ae4e1-2905-3587-6ffe-0f8886ba0968@cogentembedded.com>
Date: Fri, 7 Sep 2018 12:08:28 +0300
MIME-Version: 1.0
In-Reply-To: <87zhwuoykl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 9/7/2018 5:08 AM, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch updates license to use SPDX-License-Identifier
> instead of verbose license text.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   drivers/phy/renesas/Kconfig              | 1 +
>   drivers/phy/renesas/Makefile             | 1 +
>   drivers/phy/renesas/phy-rcar-gen2.c      | 5 +----
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 5 +----
>   drivers/phy/renesas/phy-rcar-gen3-usb3.c | 5 +----
>   5 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> index 4bd390c..e340a92 100644
> --- a/drivers/phy/renesas/Kconfig
> +++ b/drivers/phy/renesas/Kconfig
> @@ -1,3 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
>   #
>   # Phy drivers for Renesas platforms
>   #

    Again, there was no license on that file...

> diff --git a/drivers/phy/renesas/Makefile b/drivers/phy/renesas/Makefile
> index 4b76fc4..b599ff8 100644
> --- a/drivers/phy/renesas/Makefile
> +++ b/drivers/phy/renesas/Makefile
> @@ -1,3 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
>   obj-$(CONFIG_PHY_RCAR_GEN2)		+= phy-rcar-gen2.o
>   obj-$(CONFIG_PHY_RCAR_GEN3_PCIE)	+= phy-rcar-gen3-pcie.o
>   obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+= phy-rcar-gen3-usb2.o

    ... on this file as well.

     Otherwise looked valid.

MBR, Sergei
