Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33729 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750923AbdFON4L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2017 09:56:11 -0400
Date: Thu, 15 Jun 2017 15:56:06 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arch/arm64: defconfig: Compile Renesas Sound related
 drivers as Module
Message-ID: <20170615135606.GB22158@verge.net.au>
References: <87d1a77yll.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d1a77yll.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

I think a better title would be:

arm64: defconfig: compile renesas sound related drivers as modules

On Wed, Jun 14, 2017 at 08:44:08AM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current Renesas Sound related drivers are compiled as built-in.
> Let's compile it as Module to reduce ARM64 Kernel size.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/configs/defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

This does not seem to apply to renesas-next-20170614-v4.12-rc1
This and the above I can fix but...

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index dbacd55..82e345a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -366,9 +366,9 @@ CONFIG_SND=y
>  CONFIG_SND_SOC=y
>  CONFIG_SND_BCM2835_SOC_I2S=m
>  CONFIG_SND_SOC_SAMSUNG=y
> -CONFIG_SND_SOC_RCAR=y
> -CONFIG_SND_SOC_AK4613=y
> -CONFIG_SND_SIMPLE_CARD=y
> +CONFIG_SND_SOC_RCAR=m
> +CONFIG_SND_SOC_AK4613=m
> +CONFIG_SND_SIMPLE_CARD=m

Do other drivers depend on any pf the above?
If so what are the implications here?

>  CONFIG_USB=y
>  CONFIG_USB_OTG=y
>  CONFIG_USB_XHCI_HCD=y
> -- 
> 1.9.1
> 
