Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:34014 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933576AbcLBOUu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 09:20:50 -0500
Date: Fri, 2 Dec 2016 14:18:08 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
        Andy Yan <andy.yan@rock-chips.com>,
        Archit Taneja <architt@codeaurora.org>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mark Yao <mark.yao@rock-chips.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 11/22] drm: bridge: dw-hdmi: Refactor hdmi_phy_configure
 resolution parameter
Message-ID: <20161202141808.GC14217@n2100.armlinux.org.uk>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480635817-1258-12-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480635817-1258-12-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 02, 2016 at 01:43:26AM +0200, Laurent Pinchart wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The current code hard codes the call of hdmi_phy_configure() to be 8bpp
> and provides extraneous error checking to verify that this hardcoded
> value is correct.
> 
> Simplify the passing of the data by setting the parameter to be of the
> enum type it represents rather than converting and then verifying the
> value. This will allow the compiler to check the value is acceptable
> based on the type, and remove the dead code that we currently have.

I think you're expecting too much of the compiler there.  There's no
requirement for the compiler to check that an enum type is passed one
of it's defined values.

Try building this and see if it even produces a warning:

enum foo {
	FOO_1,
	FOO_2,
};

int func(enum foo foo)
{
	return foo;
}

int test_1(void)
{
	return func(FOO_1);
}

int test_2(void)
{
	return func(5);
}

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
