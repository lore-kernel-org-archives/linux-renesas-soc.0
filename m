Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:41593 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbeLEOYG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 09:24:06 -0500
Received: by mail-vs1-f66.google.com with SMTP id t17so12150175vsc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Dec 2018 06:24:05 -0800 (PST)
MIME-Version: 1.0
References: <20181203195647.6261-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181203195647.6261-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Dec 2018 15:23:28 +0100
Message-ID: <CAPDyKFoRbmpcv=5OAW0vy-tR9aE9qy82LZ3+1bowL+ZMPdds+g@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: document 'Reliable Write' bit in uapi header
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, 3 Dec 2018 at 20:56, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> If we use it this way, people should know about it. Also, replace
> true/false with nonzero/zero because the flag is not strictly a bool
> anymore.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe

> ---
>
> Change since V1:
> * reworded first line of comment as well. Thanks, Geert!
>
> Still not super happy about shifting into the sign bit, but yeah...
> don't break userspace, I guess.
>
>  include/uapi/linux/mmc/ioctl.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/mmc/ioctl.h b/include/uapi/linux/mmc/ioctl.h
> index 45f369dc0a42..00c08120f3ba 100644
> --- a/include/uapi/linux/mmc/ioctl.h
> +++ b/include/uapi/linux/mmc/ioctl.h
> @@ -5,7 +5,10 @@
>  #include <linux/types.h>
>
>  struct mmc_ioc_cmd {
> -       /* Implies direction of data.  true = write, false = read */
> +       /*
> +        * Direction of data: nonzero = write, zero = read.
> +        * Bit 31 selects 'Reliable Write' for RPMB.
> +        */
>         int write_flag;
>
>         /* Application-specific command.  true = precede with CMD55 */
> --
> 2.11.0
>
