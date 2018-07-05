Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52924 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753625AbeGEPzS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 11:55:18 -0400
Date: Thu, 5 Jul 2018 17:55:15 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] ARM: shmobile: defconfig: Set CONFIG_LOCALVERSION
Message-ID: <20180705155513.ooppf45agiebi732@verge.net.au>
References: <20180704114333.27584-1-geert+renesas@glider.be>
 <20180704114333.27584-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180704114333.27584-6-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 04, 2018 at 01:43:33PM +0200, Geert Uytterhoeven wrote:
> This allows to derive the kernel flavor from the kernel version at
> runtime.

For my edification could you expand on what this is used for?

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - shmobile_defconfig is the only shmobile defconfig left.
> ---
>  arch/arm/configs/shmobile_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index ac3dad3c3b9dc9c6..b961c121515b7f06 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -1,3 +1,4 @@
> +CONFIG_LOCALVERSION="-shmobile"
>  CONFIG_SYSVIPC=y
>  CONFIG_NO_HZ=y
>  CONFIG_IKCONFIG=y
> -- 
> 2.17.1
> 
