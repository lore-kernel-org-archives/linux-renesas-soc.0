Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727705AbeIGTtu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Sep 2018 15:49:50 -0400
MIME-Version: 1.0
References: <20180828015252.28511-1-robh@kernel.org> <20180828015252.28511-12-robh@kernel.org>
In-Reply-To: <20180828015252.28511-12-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Sep 2018 10:08:18 -0500
Message-ID: <CAL_JsqLR_jsVScGBp0cMfhNJrw4bYOAychWX3Ejw1DBzTpRK+A@mail.gmail.com>
Subject: Re: [PATCH] clk: Convert to using %pOFn instead of device_node.name
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 27, 2018 at 8:53 PM Rob Herring <robh@kernel.org> wrote:
>
> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.


> @@ -492,8 +492,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
>
>         provider->base = of_iomap(node, 0);
>
> -       provider->clkdm_name = kmalloc(strlen(node->parent->name) + 3,
> -                                      GFP_KERNEL);
> +       provider->clkdm_name = kasprintf(GFP_KERNEL, "%pOFnxxx", node->parent);

Turns out xxx was a bad choice as the %p handler eats all alphanumeric
characters. Looks like this has already been applied, so I will send a
fix.

Rob
