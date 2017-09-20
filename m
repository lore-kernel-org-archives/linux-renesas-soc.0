Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:37614 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751585AbdITLQ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2017 07:16:59 -0400
MIME-Version: 1.0
In-Reply-To: <20170915081144.GI3924@verge.net.au>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-4-git-send-email-chris.paterson2@renesas.com> <20170915081144.GI3924@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Sep 2017 13:16:58 +0200
Message-ID: <CAMuHMdVLXauMA_cbFJafHNdX_XHVGccO00vm6mdvgB7-7xh3RA@mail.gmail.com>
Subject: Re: [PATCH 3/8] ARM: dts: iwg22m: Enable SDHI1 controller
To: Simon Horman <horms@verge.net.au>
Cc: Chris Paterson <chris.paterson2@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 15, 2017 at 10:11 AM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, Sep 13, 2017 at 06:05:36PM +0100, Chris Paterson wrote:
>> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>>
>> Enable the SDHI1 controller on iWave RZ/G1E SoM.
>>
>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>> --- a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
>> +++ b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi

>> @@ -54,6 +61,16 @@
>>       status =3D "okay";
>>  };
>>
>> +&sdhi1 {
>> +     pinctrl-0 =3D <&sdhi1_pins>;
>> +     pinctrl-names =3D "default";
>> +
>> +     vmmc-supply =3D <&reg_3p3v>;
>> +     vqmmc-supply =3D <&reg_3p3v>;
>> +     cd-gpios =3D <&gpio3 31 GPIO_ACTIVE_LOW>;
>
> No wp-gpios property means this is a =C2=B5SD slot, right?

Correct.

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
