Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1400138.outbound.protection.outlook.com ([40.107.140.138]:18541
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725911AbeKSVFA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 16:05:00 -0500
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
Date: Mon, 19 Nov 2018 10:41:42 +0000
Message-ID: <TY1PR01MB17697C2C8BCE98009EBDECF7F5D80@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <20181116145937.27660-1-phil.edworthy@renesas.com>
 <20181116145937.27660-2-phil.edworthy@renesas.com>
 <20181116160128.pkuya6rwqm4schdn@pengutronix.de>
 <20181116161122.hhvslbzdujxpk3up@pengutronix.de>
In-Reply-To: <20181116161122.hhvslbzdujxpk3up@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uwe,

On 16 November 2018 16:11 Uwe Kleine-K=F6nig wrote:
> On Fri, Nov 16, 2018 at 05:01:28PM +0100, Uwe Kleine-K=F6nig wrote:
> > Other than that I think the patch is fine
>=20
> Thinking again, I wonder why not just do:
>=20
> static inline struct clk *clk_get_optional(struct device *dev, const char=
 *id) {
> 	struct clk *c =3D clk_get(dev, id);
>=20
> 	if (c =3D=3D ERR_PTR(-ENOENT))
> 		return NULL;
> 	else
> 		return c;
> }

Unfortunately, underneath this __of_clk_get_by_name() returns -EINVAL
when looking for a named clock, and the "clock-names" OF property can't
be found or the name is not in that prop. This is because the index
returned by of_property_match_string() will be an error code and is then
currently always passed to __of_clk_get().

If, as you said, I split the patches into one that fixes the error code, an=
d then
adds clk_get_optional() like above, it will make more sense.

btw, do we need to add of_clk_get_by_name_optional()? I only added it as a
counterpart to of_clk_get_by_name(), but it may not be needed.

Thanks
Phil
