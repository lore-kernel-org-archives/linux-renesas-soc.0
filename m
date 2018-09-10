Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:51274 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbeIJOjI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 10:39:08 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        jacopo <jacopo@jmondi.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Renesas R9A06G032 PINCTRL Driver
Date: Mon, 10 Sep 2018 12:46:00 +0300
Message-ID: <8834220.fknQf5gIhd@avalon>
In-Reply-To: <CACRpkdad=U5YACQ6k86A4BJo9-U4bC61A0kJ8kONSHu+u3BPyA@mail.gmail.com>
References: <1535634775-19365-1-git-send-email-phil.edworthy@renesas.com> <TY1PR01MB17697A2D3BCA85B3BFC1FE21F5020@TY1PR01MB1769.jpnprd01.prod.outlook.com> <CACRpkdad=U5YACQ6k86A4BJo9-U4bC61A0kJ8kONSHu+u3BPyA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

On Monday, 10 September 2018 10:48:58 EEST Linus Walleij wrote:
> On Wed, Sep 5, 2018 at 11:59 AM Phil Edworthy wrote:
> > On 05 September 2018 10:37, Geert Uytterhoeven wrote:
> > > Have the VxWorks DT bindings been submitted for review to the devicetree
> > > mailing list?
> > 
> > I'm not involved with the VxWorks port, but I am pretty sure that they
> > have not been submitted for review.
> 
> We have had other cases where deployments on other OSes have been
> establishing bindings (even not very pretty ones).

I hardly see that as a good reason to accept the bindings blindly. If they 
haven't been submitted for review, it's their problem, not ours. Even worse in 
my opinion is the fact that those bindings are used by the "out-of-tree Linux 
port". We've hammered the "upstream first" message for years if not decades, 
if the industry still can't get it, I don't see why we should be the ones 
suffering.

No ack from me for these new bindings, sorry.

> Examples include typically the Power MacIntosh and the original SPARC
> bindings.

-- 
Regards,

Laurent Pinchart
