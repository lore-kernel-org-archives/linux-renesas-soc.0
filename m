Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410129.outbound.protection.outlook.com ([40.107.141.129]:6174
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726398AbeKTVWL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 16:22:11 -0500
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, Guan Xuetao <gxt@pku.edu.cn>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] clk: Add (devm_)clk_get_optional() functions
Date: Tue, 20 Nov 2018 10:53:33 +0000
Message-ID: <TY1PR01MB176982D5E11A665D0DCC9E31F5D90@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <20181119141259.11992-1-phil.edworthy@renesas.com>
 <20181120103832.GV10650@smile.fi.intel.com>
In-Reply-To: <20181120103832.GV10650@smile.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Andy,

On 20 November 2018 10:39 Andy Shevchenko wrote:
> On Mon, Nov 19, 2018 at 02:12:59PM +0000, Phil Edworthy wrote:
> > This adds clk_get_optional() and devm_clk_get_optional() functions to
> > get optional clocks.
> > They behave the same as (devm_)clk_get except where there is no clock
> > producer. In this case, instead of returning -ENOENT, the function
> > returns NULL. This makes error checking simpler and allows
> > clk_prepare_enable, etc to be called on the returned reference without
> > additional checks.
>=20
> >  - Instead of messing with the core functions, simply wrap them for the
> >    _optional() versions. By putting clk_get_optional() inline in the he=
ader
> >    file, we can get rid of the arch specific patches as well.
>=20
> Fine if it would have no surprises with error handling.
There shouldn't be any surprises. My earlier attempts at implementing this
were hampered by the fact that of_clk_get_by_name() can return -EINVAL
in some circumstances. By directly wrapping the (devm_)clk_get() functions
that problem goes away.

> > +	if (ERR_PTR(-ENOENT))
Huh? That wasn't the code I sent...

> > +		return NULL;
> > +	else
> > +		return clk;
>=20
> return clk =3D=3D ERR_PTR(-ENOENT) ? NULL : clk;
>=20
> ?
>=20
> > +	if (clk =3D=3D ERR_PTR(-ENOENT))
> > +		return NULL;
> > +	else
> > +		return clk;
>=20
> Ditto.
Sure, will fix both.

Thanks
Phil
