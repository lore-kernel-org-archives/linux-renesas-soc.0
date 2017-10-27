Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:45441 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751609AbdJ0PhS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Oct 2017 11:37:18 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH] i2c: riic: remove clock and frequency restrictions
Date: Fri, 27 Oct 2017 15:37:14 +0000
Message-ID: <SG2PR06MB116574A2F2C6B7535415957B8A5A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20171018140459.104351-1-chris.brandt@renesas.com>
 <20171018163725.ik6ieofpd6ehilbo@ninjato>
 <SG2PR06MB1165C76C6B35511B21CC70668A4D0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20171026203622.hyala2lxsjpdshnh@ninjato>
In-Reply-To: <20171026203622.hyala2lxsjpdshnh@ninjato>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thursday, October 26, 2017, linux-renesas-soc-owner@vger.kernel.org wrot=
e:
> > I ran checkpatch and fixed everything it found, but it didn't flag that
> one.
> >
> >
> > $ scripts/checkpatch.pl z_patches/riic/S4V1/*
> > total: 0 errors, 0 warnings, 169 lines checked
>=20
> with "--strict" it will find it.

Yes, then it finds other ones too that you missed.

So for my v2 submission, it passes with --strict.


Chris
