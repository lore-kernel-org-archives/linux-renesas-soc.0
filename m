Return-Path: <devicetree-owner@vger.kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] ARM: dts: r7s72100: add power-domains to mmcif
Date: Tue, 24 Jan 2017 16:32:30 +0000
Message-ID: <SG2PR06MB1165BD8C33491336E74AFE5A8A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170123141349.29844-1-chris.brandt@renesas.com>
 <CAMuHMdULpxoNaTUX2Dc7R=d+FUb_V45H9=XXfsW3RKBTowE4Uw@mail.gmail.com>
 <20170124123304.GC20529@verge.net.au>
In-Reply-To: <20170124123304.GC20529@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tuesday, January 24, 2017, Simon Horman wrote:
> On Mon, Jan 23, 2017 at 04:12:16PM +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 23, 2017 at 3:13 PM, Chris Brandt <chris.brandt@renesas.com=
>
> wrote:
> > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> >
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Should this be queued up as a fix for v4.10 with the following tag?
>=20
> Fixes: 887862227ba3 ("ARM: dts: r7s72100: add mmcif to device tree")

I assume it can. I'm not sure how it effect the driver one way good or bad
(that's a question for Geert I think).
SDHI for r7s72100 needs it too, I just didn't send that yet because my othe=
r
fix will cause a merge conflict because it is modifying the same line. But,=
=20
that patch is taking longer than I expected.

My guess is that power-domains is for runtime power management...which seem=
s
to be a sore subject for r7s72100 at this point.


Chris

