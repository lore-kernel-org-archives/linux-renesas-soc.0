Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:18979 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750777AbdBASXm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2017 13:23:42 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
CC: Andrey Smirnov <andrew.smirnov@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Richard Cochran <rcochran@linutronix.de>,
        "Brad Mouring" <brad.mouring@ni.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC] ARM: l2c:  Adding L310_AUX_CTRL_FULL_LINE_ZERO broke my
 system
Date: Wed, 1 Feb 2017 18:23:36 +0000
Message-ID: <SG2PR06MB116555964C5DF07E980CB7C58A4D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <SG2PR06MB11657BAF8CFC0BCA9D07D0648A4D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170201174310.GO27312@n2100.armlinux.org.uk>
In-Reply-To: <20170201174310.GO27312@n2100.armlinux.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Russell,

Thank you for your reply. This at least fills in some missing info
for me.


On Wednesday, February 01, 2017, Russell King wrote:
> > (1) I see that the PL310 is enabled on multiple platforms, so how as
> > this not broken any systems since it was introduced in 2014? What am I
> missing?
> >
> > I see that only 2 platforms explicitly set this aux bit (both have CA9)=
:
> >   mach-tegra/tegra.c:	.l2c_aux_val	=3D 0x3c400001,
> >   mach-exynos/exynos.c:	.l2c_aux_val	=3D 0x3c400001,
>=20
> I think a better question is:
>=20
>  * Why does enabling FLZ break your system.

Hmmm, I guess the purpose of this witch-hunt is to find out if it is
SW or HW.


> It can only be that your system doesn't wire the L2C-310 up to the Cortex
> A9 correctly, missing the out-of-band signals that inform the L2C-310 tha=
t
> the Cortex A9 wants it to zero a full cache line.

Oh, it's an out-of-band signal. The PL310 documentation says:

"When the L2C-310 receives such a write transaction it ignores the AXI
attributes attached to the transaction, size, length, data, and strobes
for example, because the whole cache line must be reset. This behavior
is not compatible with the AXI protocol, it is disabled by default"

Which now I understand that it doesn't go across the AXI. Thank you for
clearing that up.

=20
> BTW, the bit in the auxilary control register merely _enables_ the
> reception of that signal at the L2C-310.  If the signal is permanently
> deasserted, the L2C-310 does nothing with it, and the bit is a no-op.
>=20
> Where it does matter is at the Cortex-A9.  That changes the behaviour of
> the Cortex-A9 from issuing multiple bus cycles zeroing the cache line wor=
d
> by word, to merely signalling that it wants the L2C-310 to zero the cache
> line.
>=20
> So, if _merely_ enabling the FLZ bit in the 310's auxiliary control
> register _without_ setting the bit in the Cortex-A9 as well leads to
> memory corruption, it definitely means the 310 in your SoC is miswired,
> and we need a DT property to reflect that.

Damn! I was afraid of that.

I'm going to take this up with the chip designers and confirm whether or
not this is the case.


> > (2) Bits 1 and 2 of the Auxiliary Control Register are "L1 Prefetch
> enable"
> > and " L2 Prefetch hint enable". So if I want those enabled, it looks
> > like I have to enable full-line-zero, correct?
>=20
> Prefetching is entirely separate from FLZ.

So if FLZ in the SoC is screwed up, I can at least keep prefetch.


> > It seems the issue on my SoC is that when I enable FULL_LINE_ZERO in
> > the CA9, it doesn't seem to work very well.
>=20
> That will definitely lead to data corruption.  The Cortex-A9 must _never_
> have FLZ enabled on the CPU without (a) a compatible L2 cache controller
> and (b) the feature _already_ enabled on the L2 cache controller and (c)
> the cache controller is correctly wired to the Cortex-A9.
>=20
> It sounds to me like you have a rare (the only?) system where (c) is fals=
e.

Well crap.
Assuming (c) is false on my system, obviously you probably don't want to go
hacking up cache-l2x0.c just for one bad apple.

Any thoughts of how I can fix it outside the driver?

Maybe I have to change from DT back to calling l2x0_init() directly,
then immediately after do a:

	set_auxcr(get_auxcr() & ~BIT(3));

and assume that no kzalloc calls will be made in between.


Chris
