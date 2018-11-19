Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1400119.outbound.protection.outlook.com ([40.107.140.119]:17680
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726487AbeKTAFJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 19:05:09 -0500
From: Phil Edworthy <phil.edworthy@renesas.com>
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
CC: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v6 1/6] clk: Add of_clk_get_by_name_optional() function
Date: Mon, 19 Nov 2018 13:41:24 +0000
Message-ID: <TY1PR01MB1769E377D88AF59EBD2A9C3BF5D80@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <20181116145937.27660-1-phil.edworthy@renesas.com>
 <20181116145937.27660-2-phil.edworthy@renesas.com>
 <20181116160128.pkuya6rwqm4schdn@pengutronix.de>
 <20181116161122.hhvslbzdujxpk3up@pengutronix.de>
 <TY1PR01MB17697C2C8BCE98009EBDECF7F5D80@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <20181119104603.qzuvpoha622l4xvy@pengutronix.de>
 <TY1PR01MB17695E8ED56BBC03AAA7FD8FF5D80@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <20181119125811.6bujcow5wf4hvfz4@pengutronix.de>
In-Reply-To: <20181119125811.6bujcow5wf4hvfz4@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uwe,

On 19 November 2018 12:58 Uwe Kleine-K=F6nig wrote:
> On Mon, Nov 19, 2018 at 12:53:46PM +0000, Phil Edworthy wrote:
> > On 19 November 2018 10:46 Uwe Kleine-K=F6nig wrote:
> > > On Mon, Nov 19, 2018 at 10:41:42AM +0000, Phil Edworthy wrote:
> > > > btw, do we need to add of_clk_get_by_name_optional()? I only added
> it
> > > > as a counterpart to of_clk_get_by_name(), but it may not be needed.
> > >
> > > I don't need it. Given that it is easy to add when someone has a need=
, I'd
> say,
> > > skip it for now.
> >
> > I'm wondering if we actually need clk_get_optional(). For me at least, =
I just
> > want devm_clk_get_optional(). That would get rid of the arch patches.
>=20
> Given that clk_get_optional will be that simple, it can live in
> linux/clk.h for all implementors of the clk API, then you don't have to
> care about different archs. (Unless I'm missing something.)
You are absolutely right, I'm such a clutz sometimes!

Thanks
Phil

> I don't think it's a good idea to drop clk_get_optional even if you'd
> have to provide arch-specific stuff.
>=20
> Best regards
> Uwe
>=20
> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|
