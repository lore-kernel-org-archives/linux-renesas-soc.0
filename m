Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36827 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752715AbcLAKjr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 05:39:47 -0500
Received: by mail-wm0-f68.google.com with SMTP id m203so33436833wma.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Dec 2016 02:39:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161201102959.GE4928@bigcity.dyn.berto.se>
References: <20161128114614.11979-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdV5thEHBGTbESB00WvohH-t5Cu59soYPQ8d6YzuoEDSPg@mail.gmail.com> <20161201102959.GE4928@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Dec 2016 11:39:44 +0100
Message-ID: <CAMuHMdWACa+cnsBeZLtAt0KSkXKXv=emRQ=weNuvqYmVr8GYuQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a7795: salvator-x: Set drive-strength for
 ravb pins
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Thu, Dec 1, 2016 at 11:29 AM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2016-12-01 10:13:56 +0100, Geert Uytterhoeven wrote:
>> On Mon, Nov 28, 2016 at 12:46 PM, Niklas S=C3=B6derlund
>> > diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch=
/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
>> > index b1eab68..7f49d19 100644
>> > --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
>> > +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
>> > @@ -225,8 +225,32 @@
>> >         };
>> >
>> >         avb_pins: avb {
>> > -               groups =3D "avb_mdc";
>> > -               function =3D "avb";
>> > +               mux {
>> > +                       groups =3D "avb_mdc", "avb_mii";
>> > +                       function =3D "avb";
>> > +               };
>> > +
>> > +               pins_mdc {
>> > +                       groups =3D "avb_mdc";
>> > +                       drive-strength =3D <24>;
>> > +               };
>> > +
>> > +               pins_mii_tx {
>> > +                       pins =3D "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN=
_AVB_TD0",
>> > +                              "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_=
TD3";
>> > +                       drive-strength =3D <12>;
>> > +               };
>> > +
>> > +               pins_mii_rx {
>> > +                       pins =3D "PIN_AVB_RX_CTL", "PIN_AVB_RXC", "PIN=
_AVB_RD0",
>> > +                              "PIN_AVB_RD1", "PIN_AVB_RD2", "PIN_AVB_=
RD3";
>> > +                       drive-strength =3D <24>;
>> > +               };
>> > +
>> > +               pins_mii_clk {
>> > +                       pins =3D "PIN_AVB_TXCREFCLK";
>> > +                       drive-strength =3D <24>;
>> > +               };
>> >         };
>> >
>> >         du_pins: du {
>>
>> What about AVB_PHY_INT and AVB_LINK?
>> Or don't you need to specify their drive strengths, as they are input si=
gnals?
>> Then what about pins_mii_rx, they're also input signals?
>
> Wops, I was not aware of the u-boot repository you link bellow so was
> looking at git://git.denx.de/u-boot-sh.git which also have some
> salvator-x code, but nothing for EtherAVB.
>
> My assumption hence was that it only used the pins from the avb_mdc
> group and pins which could not be muxed, this is incorrect since u-boot
> setup more pinmuxing.  So there are more pin groups which should be
> added to the mux section (at least).  If I look at the u-boot code pins
> missing in DT are:
>
> - AVB_AVTP_CAPTURE_A
> - AVB_AVTP_MATCH_A
> - AVB_LINK
> - AVB_PHY_INT
> - AVB_MAGIC
>
> I will add the pin groups which contain those pins to the mux section.

Note that AVB_AVTP_CAPTURE_A, AVB_AVTP_MATCH_A, and AVB_MAGIC are not
used on Salvator-X.

>> BTW, the latest public U-Boot seems to configure just AVB_TX_CTL, AVB_TX=
C,
>> and AVB_TXD[0-3] for 12 mA, cfr.
>> https://github.com/renesas-rcar/u-boot/blob/v2015.04/rcar-3.4.0/board/re=
nesas/salvator-x/salvator-x.c#L158
>>
>> According to the datasheet, the reset values of all signals are 15 mA on=
 H3 ES1,
>> and 24 mA on M3-W and H3 ES2.0.
>
> This is good information, but how to make best use of it? Should I in DT
> set the drive-strength for all pins or just the pins which diverge from
> the reset default values? I think it's best to set them for all pins
> since we should not depend on the bootloader, do you agree?

For input-only pins, drive strength should not matter at all, so I think yo=
u
should leave it out.
For other (used) pins, I think it should be specified.

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
