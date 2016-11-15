Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:33731 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934210AbcKOJi2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2016 04:38:28 -0500
MIME-Version: 1.0
In-Reply-To: <3799953.2bFHkKiW66@avalon>
References: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se>
 <20161112160429.12524-6-niklas.soderlund+renesas@ragnatech.se> <3799953.2bFHkKiW66@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Nov 2016 10:38:27 +0100
Message-ID: <CAMuHMdVrMuO5hSgSNvjG8m4A2jGd=JtvHHaRjY76zJZWsdZtqA@mail.gmail.com>
Subject: Re: [PATCHv3 5/6] pinctrl: sh-pfc: r8a7778: Use lookup function for
 bias data
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Nov 13, 2016 at 2:49 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Saturday 12 Nov 2016 17:04:28 Niklas S=C3=B6derlund wrote:
>> Change the data structure and use the generic sh_pfc_pin_to_bias_info()
>> function to get the register offset and bit information.
>>
>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech=
.se>
>
> Except for the bias_info for which I trust your regexp skills,

Approved by "git wshow".

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
