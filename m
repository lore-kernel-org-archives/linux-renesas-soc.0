Return-Path: <devicetree-owner@vger.kernel.org>
Date: Thu, 18 Oct 2018 15:10:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 5/5] ARM: shmobile: defconfig: Enable SII902X
Message-ID: <20181018131031.lfjfy46zxkbdjvfa@verge.net.au>
References: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537553311-8831-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180924090850.krd2cjzf6cyfdfh6@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180924090850.krd2cjzf6cyfdfh6@verge.net.au>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 24, 2018 at 11:08:51AM +0200, Simon Horman wrote:
> On Fri, Sep 21, 2018 at 07:08:31PM +0100, Fabrizio Castro wrote:
> > The iwg23s board comes with the SiI9022ACNU HDMI transmitter,
> > this patch makes sure the corresponding driver gets built.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > 
> > Hello Simon,
> > 
> > a patch for the multi_v7_defconfig will be sent at a later stage.
> 
> Thanks Fabrizio,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Sorry for letting this slip.

I have applied it for v4.21.
