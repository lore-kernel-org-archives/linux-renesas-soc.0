Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34912 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752340AbdDDHbT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2017 03:31:19 -0400
MIME-Version: 1.0
In-Reply-To: <20170403173613.2238-2-wsa+renesas@sang-engineering.com>
References: <20170403173613.2238-1-wsa+renesas@sang-engineering.com> <20170403173613.2238-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Apr 2017 09:31:17 +0200
Message-ID: <CAMuHMdX7JayJUD5dO_WSvtp3YuKrf3JEGd3C2YAzcgW6W0zjNg@mail.gmail.com>
Subject: Re: [PATCH i2c-tools 2/2] i2ctransfer: grammar fixes in manpage
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Mon, Apr 3, 2017 at 7:36 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> --- a/tools/i2ctransfer.8
> +++ b/tools/i2ctransfer.8
> @@ -74,7 +74,7 @@ This number should correspond to one of the busses listed by
>  The next parameter is one or multiple
>  .I desc
>  blocks.
> -The number of blocks is limited by the Linux Kernel and defined in I2C_RDWR_IOCTL_MAX_MSGS (42 as of v4.10).
> +The number of blocks is limited by the Linux Kernel and defined with I2C_RDWR_IOCTL_MAX_MSGS (42 as of v4.10).

defined by?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
