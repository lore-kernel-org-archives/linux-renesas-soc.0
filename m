Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35104 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932347AbdC3I6x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2017 04:58:53 -0400
MIME-Version: 1.0
In-Reply-To: <20170329183653.982359372@cogentembedded.com>
References: <20170329183653.982359372@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Mar 2017 10:58:50 +0200
Message-ID: <CAMuHMdXFsUe7=pdO1ZHzvWyA3psfMSYY6FY7AYMZAWpyMzJm2g@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7791: add missing HSCIF1 pinmux data
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 29, 2017 at 8:36 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The R8A7791 PFC driver  was apparently based on the preliminary revisions
> of  the  user's manual, which  omitted the HSCIF1 group E signals in  the
> IPSR4 register description. This would cause HSCIF1's probe  to fail with
> the messages like below:
>
> sh-pfc e6060000.pfc: cannot locate data/mark enum_id for mark 1989
> sh-sci e62c8000.serial: Error applying setting, reverse things back
> sh-sci: probe of e62c8000.serial failed with error -22
>
> Add the neceassary PINMUX_IPSR_MSEL() invocations for the HSCK1_E,
> HCTS1#_E, and HRTS1#_E signals...
>
> Fixes: 508845196238 ("pinctrl: sh-pfc: r8a7791 PFC support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> CC: stable@vger.kernel.org

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
