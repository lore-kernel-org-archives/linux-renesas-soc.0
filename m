Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:63249 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751169AbdIOPjV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 11:39:21 -0400
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 2/8] ARM: dts: r8a7745: Add SDHI controllers
Date: Fri, 15 Sep 2017 15:39:16 +0000
Message-ID: <TY1PR06MB0702D6FD85B738B2B93627EEB76C0@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-3-git-send-email-chris.paterson2@renesas.com>
 <20170915075415.GG3924@verge.net.au>
In-Reply-To: <20170915075415.GG3924@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 15 September 2017 08:54
>=20
> On Wed, Sep 13, 2017 at 06:05:35PM +0100, Chris Paterson wrote:
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Add the SDHI controllers to the r8a7745 device tree.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
>=20
> Thanks, applied.

Thank you!

>=20
> > ---
> > This patch is based on renesas-devel-20170913-v4.13.
> >
> > This patch is dependant on:
> > - "dt-bindings: mmc: sh_mmcif: Document r8a7745 DT bindings"
>=20
> I think that should be "[PATCH v3] mmc: renesas_sdhi: Add r8a7743/5
> support"

Correct. Sorry for the confusion!
