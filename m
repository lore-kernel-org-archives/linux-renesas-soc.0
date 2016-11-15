Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34173 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935299AbcKOJFd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2016 04:05:33 -0500
MIME-Version: 1.0
In-Reply-To: <20161111204003.4022-1-niklas.soderlund@ragnatech.se>
References: <20161111204003.4022-1-niklas.soderlund@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Nov 2016 10:05:32 +0100
Message-ID: <CAMuHMdVXawxFBCf-2E0yb+rXm=zP7ZCQTMvt-PM6ixhfkDVmrg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Add DU support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 11, 2016 at 9:40 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> Only the DU parallel RGB output signals are included, HDMI and TCON pins
> will be added in separate groups. Based on a similar patch from Laurent
> Pinchart for the r8a7795 PFC driver.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Will queue...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
