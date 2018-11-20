Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:15322 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728222AbeKTVlc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 16:41:32 -0500
Date: Tue, 20 Nov 2018 13:12:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
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
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: Add (devm_)clk_get_optional() functions
Message-ID: <20181120111248.GW10650@smile.fi.intel.com>
References: <20181119141259.11992-1-phil.edworthy@renesas.com>
 <20181120103832.GV10650@smile.fi.intel.com>
 <TY1PR01MB176982D5E11A665D0DCC9E31F5D90@TY1PR01MB1769.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB176982D5E11A665D0DCC9E31F5D90@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 20, 2018 at 10:53:33AM +0000, Phil Edworthy wrote:
> On 20 November 2018 10:39 Andy Shevchenko wrote:
> > On Mon, Nov 19, 2018 at 02:12:59PM +0000, Phil Edworthy wrote:
> > > This adds clk_get_optional() and devm_clk_get_optional() functions to
> > > get optional clocks.
> > > They behave the same as (devm_)clk_get except where there is no clock
> > > producer. In this case, instead of returning -ENOENT, the function
> > > returns NULL. This makes error checking simpler and allows
> > > clk_prepare_enable, etc to be called on the returned reference without
> > > additional checks.

> > >  - Instead of messing with the core functions, simply wrap them for the
> > >    _optional() versions. By putting clk_get_optional() inline in the header
> > >    file, we can get rid of the arch specific patches as well.

> > Fine if it would have no surprises with error handling.
> There shouldn't be any surprises. My earlier attempts at implementing this
> were hampered by the fact that of_clk_get_by_name() can return -EINVAL
> in some circumstances. By directly wrapping the (devm_)clk_get() functions
> that problem goes away.

Good!

After my comments being addressed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


> > > +	if (ERR_PTR(-ENOENT))
> Huh? That wasn't the code I sent...

Yup, it's my wrong editing flow. Anyway, you got the idea.

> > > +		return NULL;
> > > +	else
> > > +		return clk;

> > return clk == ERR_PTR(-ENOENT) ? NULL : clk;

-- 
With Best Regards,
Andy Shevchenko
