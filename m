Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:45345 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbeGaIR6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 04:17:58 -0400
Received: by mail-vk0-f66.google.com with SMTP id b78-v6so6960955vka.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jul 2018 23:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <1532951531-29188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVEMs6j-GVVQdUN5Hx8ExSHWcyKinLjU8eKCZOfzXBb8g@mail.gmail.com> <OSBPR01MB2293CA243F691BD9AF07A948D82E0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293CA243F691BD9AF07A948D82E0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Jul 2018 08:39:01 +0200
Message-ID: <CAMuHMdXTK436z=qvN_CU6Ehvi-vXZ=c=nvwAnpaVybDhQWn1GA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Enable PWM for Ebisu board
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Tue, Jul 31, 2018 at 8:14 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, July 31, 2018 12:34 AM
> > On Mon, Jul 30, 2018 at 1:55 PM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > This patch adds PWM device nodes and enables PWM3 and PWM5 for
> > > R-Car E3 Ebisu board.
> >
> > Thanks for your patch!
>
> Thank you for your review!
>
> > This is used for blacklight control, right?
>
> Yes.
>
> > It may be a good idea to mention that in the comments and/or patch
> > description.
>
> I got it. I'll revise the patch description as the following. Is it good?
>
> ---
> This patch adds PWM device nodes and enables PWM3 and PWM5 for
> R-Car E3 Ebisu board. These devices are used for backlight control.

Sounds good to me. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
