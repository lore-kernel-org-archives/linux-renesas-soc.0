Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:33302 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732141AbeHBP65 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Aug 2018 11:58:57 -0400
Received: by mail-vk0-f66.google.com with SMTP id y70-v6so1111755vkc.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Aug 2018 07:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180730111817.5636-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdXib8fz3c41RX-70eA5w4ThM6e02ybmX=N=xXR6=F80KA@mail.gmail.com> <42d09bc8-a883-c3af-b0d6-0087b6e2558e@gmail.com>
In-Reply-To: <42d09bc8-a883-c3af-b0d6-0087b6e2558e@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Aug 2018 16:07:22 +0200
Message-ID: <CAMuHMdXSjLSsmU32tKo5tkS6+MipAXuVAUqkLYrXxmR07+eCEg@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: silk: Add DA9063 PMIC node
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Thu, Aug 2, 2018 at 3:56 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 08/01/2018 02:32 PM, Geert Uytterhoeven wrote:
> > On Mon, Jul 30, 2018 at 1:18 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> >> Add DA9063 PMIC node to the I2C bus.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >
> > Thanks for your patch!
> >
> > Oneline-summary prefix should be "ARM: dts: silk:".
>
> Right, fixed
>
> >> --- a/arch/arm/boot/dts/r8a7794-silk.dts
> >> +++ b/arch/arm/boot/dts/r8a7794-silk.dts
> >> @@ -403,6 +403,18 @@
> >>         pinctrl-names = "i2c-hdmi";
> >>
> >>         clock-frequency = <400000>;
> >> +
> >> +       pmic@5a {
> >
> > Hmm, the da9063 is actually connected to two i2c buses: i2c1 (3.3v)
> > and i2c7 (1.8v).
> > On Koelsch, we describe the 1.8v connection, as that i2c bus
> > ("i2c_dvfs") is meant
> > for power control.
>
> On Koelsch, the pmic is sitting on i2c6 only. What am I missing ?

On Koelsch, i2c6 is wired to the da9063' 2-wire bus, and i2c1 is wired to
the da9063's HS (high-speed) 2-wire bus.

Wolfram: do you like i2c slaves connected to multiple buses?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
