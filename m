Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36528 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S970056AbdAFKSz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 05:18:55 -0500
MIME-Version: 1.0
In-Reply-To: <20170103230639.19660-10-laurent.pinchart+renesas@ideasonboard.com>
References: <20170103230639.19660-1-laurent.pinchart+renesas@ideasonboard.com> <20170103230639.19660-10-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jan 2017 11:18:54 +0100
Message-ID: <CAMuHMdXGmTap1NKKLnNJWeviTu39B1uJUKJsvXcpQ-CgSB=t4A@mail.gmail.com>
Subject: Re: [PATCH 09/19] sh: Don't set the sh-sci platform data regshift field
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Wed, Jan 4, 2017 at 12:06 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The regshift value is computed automatically by the driver, there's no
> need to set it in platform data. Specify the associated memory resource
> lengths to ensure proper computation of the value.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Doing this separate from "[PATCH 19/19] serial: sh-sci: Compute the regshift
value for SCI ports") breaks bisection.

> --- a/arch/sh/kernel/cpu/sh4/setup-sh7760.c
> +++ b/arch/sh/kernel/cpu/sh4/setup-sh7760.c
> @@ -201,12 +201,18 @@ static struct platform_device scif2_device = {
>
>  static struct plat_sci_port scif3_platform_data = {
>         .scscr          = SCSCR_REIE,
> +       /*
> +        * This is actually a SIM card module serial port, based on an SCI with
> +        * additional registers. The sh-sci driver doesn't support the SIM port
> +        * type, declare it as a SCI. Don't declare the additional registers in
> +        * the memory resource or the driver will compute an incorrect regshift
> +        * value.
> +        */
>         .type           = PORT_SCI,
> -       .regshift       = 2,

Yeah, that regshift value doesn't match the datasheet at all
(should have been 1 before).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
