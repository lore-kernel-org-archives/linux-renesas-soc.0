Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:41867 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbeLCPAd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 10:00:33 -0500
MIME-Version: 1.0
References: <20181203142644.3038-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181203142644.3038-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Dec 2018 16:00:18 +0100
Message-ID: <CAMuHMdX+skNFbUiCjzU=vuR3PfTFib5ad+C1yDp=Kc6i2A=Hyw@mail.gmail.com>
Subject: Re: [PATCH] mmc: document 'Reliable Write' bit in uapi header
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Avri.Altman@wdc.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Mon, Dec 3, 2018 at 3:27 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> If we use it this way, people should know about it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>
> Still not super happy about shifting into the sign bit, but yeah...
> don't break userspace, I guess.

Indeed.

>  include/uapi/linux/mmc/ioctl.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/mmc/ioctl.h b/include/uapi/linux/mmc/ioctl.h
> index 45f369dc0a42..ae659333e73f 100644
> --- a/include/uapi/linux/mmc/ioctl.h
> +++ b/include/uapi/linux/mmc/ioctl.h
> @@ -5,7 +5,10 @@
>  #include <linux/types.h>
>
>  struct mmc_ioc_cmd {
> -       /* Implies direction of data.  true = write, false = read */
> +       /*
> +        * Implies direction of data.  true = write, false = read.

nonzero = write, zero = read?

> +        * Bit 31 selects 'Reliable Write' for RPMB.

Perhaps having a #define for this would be nice?
Can also be used by the driver, instead of 1 << 31, which some static
analyzers may complain about.

> +        */
>         int write_flag;
>
>         /* Application-specific command.  true = precede with CMD55 */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
