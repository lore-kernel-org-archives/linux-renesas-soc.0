Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:36444 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbeKLTfY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Nov 2018 14:35:24 -0500
MIME-Version: 1.0
References: <1541623464-49041-1-git-send-email-carmeli.tamir@gmail.com> <1541623464-49041-2-git-send-email-carmeli.tamir@gmail.com>
In-Reply-To: <1541623464-49041-2-git-send-email-carmeli.tamir@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Nov 2018 10:42:47 +0100
Message-ID: <CAMuHMdXqAbWHCFKD6L_JqJQ1J17=QtopHFihXnWcWufkUJqrTw@mail.gmail.com>
Subject: Re: [PATCH 1/3] staging: emxx_udc: Added static modifier to udc_controller
To: carmeli.tamir@gmail.com
Cc: Greg KH <gregkh@linuxfoundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        chrisadr@gentoo.org, areklis909@gmail.com,
        Dan Carpenter <dan.carpenter@oracle.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Carmeli,

CC Magnus

(staging drivers receive so may janitorial changes that the original author is
 lost in the git shortlog noise)

On Wed, Nov 7, 2018 at 9:46 PM Carmeli Tamir <carmeli.tamir@gmail.com> wrote:
> Added static modifier to the udc_controller, since it's only
> required within emxx_udc.c.
>
> Signed-off-by: Carmeli Tamir <carmeli.tamir@gmail.com>

Thanks for your patch!

> --- a/drivers/staging/emxx_udc/emxx_udc.c
> +++ b/drivers/staging/emxx_udc/emxx_udc.c
> @@ -56,7 +56,7 @@ static void _nbu2ss_fifo_flush(struct nbu2ss_udc *, struct nbu2ss_ep *);
>
>  /*===========================================================================*/
>  /* Global */
> -struct nbu2ss_udc udc_controller;
> +static struct nbu2ss_udc udc_controller;

What about the "Global" comment?
Perhaps this was intentional?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
