Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:24986 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750787AbdAQE1d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2017 23:27:33 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Date: Tue, 17 Jan 2017 04:27:27 +0000
Message-ID: <SG2PR06MB11656A823E53F55C4FBCA7E88A7C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170112181149.29035-1-chris.brandt@renesas.com>
 <CAMuHMdUz6nb-STMQK39hDqwHRt4R5t+Lndj150Lkg7prN=HQZQ@mail.gmail.com>
 <PS1PR06MB116243F531726538252C2BAE8A780@PS1PR06MB1162.apcprd06.prod.outlook.com>
 <CAMuHMdVkTS21UnZA9OyEZ=mR5+GtAEbiLwpe=uKB_O6deXBPyw@mail.gmail.com>
 <SG2PR06MB1165D0D67AD68A12030C961D8A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUVnUS-iOM8cbXNP7jMLNFb5+hgnMp3edkCzpbEpAePzw@mail.gmail.com>
 <SG2PR06MB11659339E4A08373D3626BB28A780@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdX=cNuBSMqvPKYa7J5g7T4dSfHhSjcGdmuOPw_as=6RQQ@mail.gmail.com>
 <20170116114023.GA3029@katana>
In-Reply-To: <20170116114023.GA3029@katana>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram and Geert,

On Monday, January 16, 2017, Wolfram Sang:
> > > and then in the code do:
> > >
> > >         struct *cd_clk;
> > >         cd_clk =3D devm_clk_get(&pdev->dev, "cd");
> > >         if (cd_clk) {
> > >                 clk_prepare_enable(cd_clk);
> > >         }
> > >
> > >   (this simple 1-line fix patch is getting a lot more complicated)
> >
> > Disclaimer: I don't know how/if the SDHI core manages clocks, and may
> > interfere. Adding Wolfram.
>=20
> Thanks for the heads up.
>=20
> We have special callbacks for en-/disabling clocks:
> sh_mobile_sdhi_clk_enable() and sh_mobile_sdhi_clk_disable().
>=20
> I think those functions should get the above if-blocks (without curly
> braces) to ensure we always have consistent 00 or 11 settings.


Well....
I was going to try and cheat and in the probe, enable both the core
and card-detect clocks, but, not save the card-detect clock pointer.
Basically, once it is turned on, it is never turned off (since it was inten=
ded
to be used for low power operation anyway).

The reason is that would then keep me from having to modify the existing
functions sh_mobile_sdhi_clk_enable/disable.

Is anyone going to have an issue if I turn the card-detect clock on but nev=
er
turn it off???? That was the patch that I was going to test out and submit.



Chris
