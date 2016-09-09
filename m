Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58036 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754075AbcIIMIL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2016 08:08:11 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: bd-phuc@jinso.co.jp
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sh@vger.kernel.org, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com,
        horms@verge.net.au, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, ryusuke.sakato.bx@renesas.com,
        h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp, nv-dung@jinso.co.jp
Subject: Re: [PATCH 7/8] clocksource: Kconfig: Modify CMT config support 64bit
Date: Fri, 09 Sep 2016 15:08:45 +0300
Message-ID: <4193048.IXigyaYqrQ@avalon>
In-Reply-To: <1473421394-9745-8-git-send-email-bd-phuc@jinso.co.jp>
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp> <1473421394-9745-8-git-send-email-bd-phuc@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Bui Duc,

Thank you for the patch.

On Friday 09 Sep 2016 20:43:13 bd-phuc@jinso.co.jp wrote:
> From: Bui Duc Phuc <bd-phuc@jinso.co.jp>
> 
> Modify CMT config to support 64bit
> 
> Signed-off-by: Bui Duc Phuc <bd-phuc@jinso.co.jp>
> ---
>  drivers/clocksource/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 5677886..62c2bcb 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -408,7 +408,7 @@ config SYS_SUPPORTS_EM_STI
>          bool
> 
>  config SH_TIMER_CMT
> -	bool "Renesas CMT timer driver" if COMPILE_TEST
> +	bool "Renesas CMT timer driver" if ( ARM64 || COMPILE_TEST )

I think you should instead add

	select SH_TIMER_CMT

to the config ARCH_RENESAS section in arch/arm64/Kconfig.platforms

>  	depends on GENERIC_CLOCKEVENTS
>  	depends on HAS_IOMEM
>  	default SYS_SUPPORTS_SH_CMT

-- 
Regards,

Laurent Pinchart
