Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34993 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754613AbcJEHlD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Oct 2016 03:41:03 -0400
MIME-Version: 1.0
In-Reply-To: <20160913140314.22035-4-niklas.soderlund+renesas@ragnatech.se>
References: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se> <20160913140314.22035-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Oct 2016 09:41:02 +0200
Message-ID: <CAMuHMdUUxeQUkOdMcZBUqnpYcLc68cA__p1wceJ9SK6Zi00QfA@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO and
 MII pins
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 13, 2016 at 4:03 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Group the AVB pins into similar groups found in other sh-pfc drivers.
> The pins can not be muxed between functions other then AVB but there

s/there/their/

> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
