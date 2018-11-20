Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:24164 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728119AbeKTVHH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 16:07:07 -0500
Date: Tue, 20 Nov 2018 12:38:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, Guan Xuetao <gxt@pku.edu.cn>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>, linux-m68k@lists.linux-m68k.org,
        linux-mips@linux-mips.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: Add (devm_)clk_get_optional() functions
Message-ID: <20181120103832.GV10650@smile.fi.intel.com>
References: <20181119141259.11992-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181119141259.11992-1-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 19, 2018 at 02:12:59PM +0000, Phil Edworthy wrote:
> This adds clk_get_optional() and devm_clk_get_optional() functions to get
> optional clocks.
> They behave the same as (devm_)clk_get except where there is no clock
> producer. In this case, instead of returning -ENOENT, the function
> returns NULL. This makes error checking simpler and allows
> clk_prepare_enable, etc to be called on the returned reference
> without additional checks.

>  - Instead of messing with the core functions, simply wrap them for the
>    _optional() versions. By putting clk_get_optional() inline in the header
>    file, we can get rid of the arch specific patches as well.

Fine if it would have no surprises with error handling.

> +	if (ERR_PTR(-ENOENT))
> +		return NULL;
> +	else
> +		return clk;

return clk == ERR_PTR(-ENOENT) ? NULL : clk;

?

> +	if (clk == ERR_PTR(-ENOENT))
> +		return NULL;
> +	else
> +		return clk;

Ditto.


-- 
With Best Regards,
Andy Shevchenko
