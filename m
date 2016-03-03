Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20160303001224.GE23040@verge.net.au>
References: <1456885514-27466-1-git-send-email-horms+renesas@verge.net.au>
	<CAMuHMdVLoxgWdPXdmDCQL3rWmi4Vej0xayPJP_zrNdanADe5Jg@mail.gmail.com>
	<20160303001224.GE23040@verge.net.au>
Date: Thu, 3 Mar 2016 09:24:39 +0100
Message-ID: <CAMuHMdVOmvtgYn+Zrr5iaGdB46m79v_ZadjKeMKpTc6MxBw4ow@mail.gmail.com>
Subject: Re: [PATCH] phy: rcar-gen3-usb2, rcar-gen2: Use ARCH_RENESAS
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms@verge.net.au>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Mar 3, 2016 at 1:12 AM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Mar 02, 2016 at 10:36:33AM +0100, Geert Uytterhoeven wrote:
>> On Wed, Mar 2, 2016 at 3:25 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
>> > Make use of ARCH_RENESAS in place of ARCH_SHMOBILE.
>> >
>> > This is part of an ongoing process to migrate from ARCH_SHMOBILE to
>> > ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
>> > appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
>> >
>> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>>
>> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> > --- a/drivers/phy/Kconfig
>> > +++ b/drivers/phy/Kconfig
>> > @@ -113,14 +113,14 @@ config PHY_MIPHY365X
>> >
>> >  config PHY_RCAR_GEN2
>> >         tristate "Renesas R-Car generation 2 USB PHY driver"
>> > -       depends on ARCH_SHMOBILE
>> > +       depends on ARCH_RENESAS
>> >         depends on GENERIC_PHY
>> >         help
>> >           Support for USB PHY found on Renesas R-Car generation 2 SoCs.
>> >
>> >  config PHY_RCAR_GEN3_USB2
>> >         tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
>> > -       depends on OF && ARCH_SHMOBILE
>> > +       depends on OF && ARCH_RENESAS
>>
>> FWIW, you may want to drop the dependency on OF, as this is implied by
>> ARCH_RENESAS.
>> Or you can handle that when adding/testing COMPILE_TEST support ;-)
>
> So the ideal setup would be as follows?
>
>         depends on ARCH_RENESAS || (OF && COMPILE_TEST)

I would separate it in two lines: one for hard, and one for soft dependencies:

        depends on OF
        depends on ARCH_RENESAS || COMPILE_TEST

> If so I think I would like to update this patch to:
>
>         depends on ARCH_RENESAS

Fine for me.

> And then deal with COMPILE_TEST separately: I should probably
> sweep the tree for Renesas related drivers that do have a COMPILE_TEST
> dependency.

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
