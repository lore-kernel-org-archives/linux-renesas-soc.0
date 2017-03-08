Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:44929 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751720AbdCHT5j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2017 14:57:39 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
CC: Arnd Bergmann <arnd@arndb.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Brad Mouring <brad.mouring@ni.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Richard Cochran <rcochran@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 0/3] ARM: l2c: add l2c support for RZ/A1
Date: Wed, 8 Mar 2017 19:35:55 +0000
Message-ID: <SG2PR06MB116530460345F5323562FEEE8A2E0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170216161742.29320-1-chris.brandt@renesas.com>
 <20170216164424.GR27312@n2100.armlinux.org.uk>
 <CAK8P3a1ri2o4An0svxSG4iSvwTkdpM5jiC=SzBq7mE6TpbdhKQ@mail.gmail.com>
 <20170216172128.GS27312@n2100.armlinux.org.uk>
 <SG2PR06MB11654EAEFECB3AE8849B28BD8A2E0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170308191622.GA21222@n2100.armlinux.org.uk>
In-Reply-To: <20170308191622.GA21222@n2100.armlinux.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, March 08, 2017, Russell King wrote:
> > Was there something wrong with them that they would not go into 4.11?
>=20
> They were submitted way too late.
>=20
> * The merge window opened on Sunday, 19th February.
>=20
> * The patches were submitted on Thursday, 16th February just before 6pm
>   my local time.
>=20
> * The last linux-next grab of trees before the merge window happened
>   occured around 11pm my local time on Thursday, 16th February.
>=20
> There's a general requirement that everything for a merge window should b=
e
> in linux-next before the merge window.
>=20
> I generally want material for the merge window to be ready a week before
> the merge window opens to allow for proper testing and any re-work that
> comes out of that testing.
>=20
> In any case, anything submitted from Thursday through to the Sunday when
> the merge window opens _definitely_ is not going to get queued for the
> merge window unless there are exceptional (eg, important bug fix) reasons
> to do so.
>=20
> So, it basically missed the time slot for merging new material, sorry.

Well damn, that answers it.

Thank you for the detailed explanation.

Cheers

Chris
