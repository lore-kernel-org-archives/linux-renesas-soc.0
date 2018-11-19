Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47105 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728967AbeKSXVz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 18:21:55 -0500
Date: Mon, 19 Nov 2018 13:58:11 +0100
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
Message-ID: <20181119125811.6bujcow5wf4hvfz4@pengutronix.de>
References: <20181116145937.27660-1-phil.edworthy@renesas.com>
 <20181116145937.27660-2-phil.edworthy@renesas.com>
 <20181116160128.pkuya6rwqm4schdn@pengutronix.de>
 <20181116161122.hhvslbzdujxpk3up@pengutronix.de>
 <TY1PR01MB17697C2C8BCE98009EBDECF7F5D80@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <20181119104603.qzuvpoha622l4xvy@pengutronix.de>
 <TY1PR01MB17695E8ED56BBC03AAA7FD8FF5D80@TY1PR01MB1769.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY1PR01MB17695E8ED56BBC03AAA7FD8FF5D80@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Phil,

On Mon, Nov 19, 2018 at 12:53:46PM +0000, Phil Edworthy wrote:
> On 19 November 2018 10:46 Uwe Kleine-K�nig wrote:
> > On Mon, Nov 19, 2018 at 10:41:42AM +0000, Phil Edworthy wrote:
> > > btw, do we need to add of_clk_get_by_name_optional()? I only added it
> > > as a counterpart to of_clk_get_by_name(), but it may not be needed.
> > 
> > I don't need it. Given that it is easy to add when someone has a need, I'd say,
> > skip it for now.
> 
> I'm wondering if we actually need clk_get_optional(). For me at least, I just
> want devm_clk_get_optional(). That would get rid of the arch patches.

Given that clk_get_optional will be that simple, it can live in
linux/clk.h for all implementors of the clk API, then you don't have to
care about different archs. (Unless I'm missing something.)

I don't think it's a good idea to drop clk_get_optional even if you'd
have to provide arch-specific stuff.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
