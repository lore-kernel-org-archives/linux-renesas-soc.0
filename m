Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47323 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727770AbeKSVJ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 16:09:28 -0500
Date: Mon, 19 Nov 2018 11:46:03 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
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
Subject: Re: [PATCH v6 1/6] clk: Add of_clk_get_by_name_optional() function
Message-ID: <20181119104603.qzuvpoha622l4xvy@pengutronix.de>
References: <20181116145937.27660-1-phil.edworthy@renesas.com>
 <20181116145937.27660-2-phil.edworthy@renesas.com>
 <20181116160128.pkuya6rwqm4schdn@pengutronix.de>
 <20181116161122.hhvslbzdujxpk3up@pengutronix.de>
 <TY1PR01MB17697C2C8BCE98009EBDECF7F5D80@TY1PR01MB1769.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY1PR01MB17697C2C8BCE98009EBDECF7F5D80@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Phil,

On Mon, Nov 19, 2018 at 10:41:42AM +0000, Phil Edworthy wrote:
> On 16 November 2018 16:11 Uwe Kleine-K�nig wrote:
> > On Fri, Nov 16, 2018 at 05:01:28PM +0100, Uwe Kleine-K�nig wrote:
> > > Other than that I think the patch is fine
> > 
> > Thinking again, I wonder why not just do:
> > 
> > static inline struct clk *clk_get_optional(struct device *dev, const char *id) {
> > 	struct clk *c = clk_get(dev, id);
> > 
> > 	if (c == ERR_PTR(-ENOENT))
> > 		return NULL;
> > 	else
> > 		return c;
> > }
> 
> Unfortunately, underneath this __of_clk_get_by_name() returns -EINVAL
> when looking for a named clock, and the "clock-names" OF property can't
> be found or the name is not in that prop. This is because the index
> returned by of_property_match_string() will be an error code and is then
> currently always passed to __of_clk_get().
> 
> If, as you said, I split the patches into one that fixes the error code, and then
> adds clk_get_optional() like above, it will make more sense.

Sounds like a good plan.

> btw, do we need to add of_clk_get_by_name_optional()? I only added it as a
> counterpart to of_clk_get_by_name(), but it may not be needed.

I don't need it. Given that it is easy to add when someone has a need,
I'd say, skip it for now.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
