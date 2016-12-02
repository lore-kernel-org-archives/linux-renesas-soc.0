Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, Archit Taneja <architt@codeaurora.org>, Fabio Estevam <fabio.estevam@freescale.com>, Heiko Stuebner <heiko@sntech.de>, Jose Abreu <Jose.Abreu@synopsys.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Ulrich Hecht <ulrich.hecht@gmail.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 11/22] drm: bridge: dw-hdmi: Refactor hdmi_phy_configure resolution parameter
Date: Fri, 02 Dec 2016 17:51:18 +0200
Message-ID: <33654692.3e443XGJfA@avalon>
In-Reply-To: <20161202141808.GC14217@n2100.armlinux.org.uk>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1480635817-1258-12-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161202141808.GC14217@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Russell,

On Friday 02 Dec 2016 14:18:08 Russell King - ARM Linux wrote:
> On Fri, Dec 02, 2016 at 01:43:26AM +0200, Laurent Pinchart wrote:
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > The current code hard codes the call of hdmi_phy_configure() to be 8bpp
> > and provides extraneous error checking to verify that this hardcoded
> > value is correct.
> > 
> > Simplify the passing of the data by setting the parameter to be of the
> > enum type it represents rather than converting and then verifying the
> > value. This will allow the compiler to check the value is acceptable
> > based on the type, and remove the dead code that we currently have.
> 
> I think you're expecting too much of the compiler there.  There's no
> requirement for the compiler to check that an enum type is passed one
> of it's defined values.

You're right.

Given that the current driver hardcodes the resolution value to 8bpp, how 
about just dropping the argument ? We can always add it back later if/when 
needed.

> Try building this and see if it even produces a warning:
> 
> enum foo {
> 	FOO_1,
> 	FOO_2,
> };
> 
> int func(enum foo foo)
> {
> 	return foo;
> }
> 
> int test_1(void)
> {
> 	return func(FOO_1);
> }
> 
> int test_2(void)
> {
> 	return func(5);
> }

-- 
Regards,

Laurent Pinchart
