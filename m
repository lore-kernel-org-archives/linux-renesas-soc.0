Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from 216-12-86-13.cv.mvl.ntelos.net ([216.12.86.13]:45974 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751270AbeDOAel (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Apr 2018 20:34:41 -0400
Date: Sat, 14 Apr 2018 20:34:20 -0400
From: Rich Felker <dalias@libc.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, linux-sh@vger.kernel.org
Subject: Re: [PATCH 3/5] tty: serial: sh-sci: Hide earlycon config question
Message-ID: <20180415003420.GU3094@brightrain.aerifal.cx>
References: <1512047522-16312-1-git-send-email-geert+renesas@glider.be>
 <1512047522-16312-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512047522-16312-4-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 30, 2017 at 02:12:00PM +0100, Geert Uytterhoeven wrote:
> Renesas H8/300 and ARM platforms use DT and support earlycon, so most
> users want earlycon support to be enabled.
> 
> On SuperH platforms, earlycon is not yet supported.
> 
> Hence follow the above rationale to configure the default, unless
> CONFIG_EXPERT is enabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 0c75562d620feb82..952a2c6a9da08fdd 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -774,10 +774,11 @@ config SERIAL_SH_SCI_CONSOLE
>  	default y
>  
>  config SERIAL_SH_SCI_EARLYCON
> -	bool "Support for early console on SuperH SCI(F)"
> +	bool "Support for early console on SuperH SCI(F)" if EXPERT
>  	depends on SERIAL_SH_SCI=y
>  	select SERIAL_CORE_CONSOLE
>  	select SERIAL_EARLYCON
> +	default ARCH_RENESAS || H8300
>  
>  config SERIAL_SH_SCI_DMA
>  	bool "DMA support"
> -- 

Can you clarify what the claim that SuperH does not support earlycon
is based on? My understanding is that users were successfully using
this option on Renesas SH systems, and I'm using it on J2 with the
uartlite earlycon support which I added in 7cdcc29e49. I think if you
want to omit the question it should always default to enabled.

Rich
