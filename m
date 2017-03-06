Return-Path: <devicetree-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: drm: rcar-du: Document optional reset properties
Date: Mon, 06 Mar 2017 18:39:33 +0200
Message-ID: <15041321.g73uU3sC2l@avalon>
In-Reply-To: <CAMuHMdVw7nR1EG_+3Vjm6HdUKtq+jvbO6AbQk5WT2dEs7JDqmg@mail.gmail.com>
References: <1488817556-21410-1-git-send-email-geert+renesas@glider.be> <1503576.T3vfvR3RGC@avalon> <CAMuHMdVw7nR1EG_+3Vjm6HdUKtq+jvbO6AbQk5WT2dEs7JDqmg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday 06 Mar 2017 17:36:41 Geert Uytterhoeven wrote:
> On Mon, Mar 6, 2017 at 5:32 PM, Laurent Pinchart wrote:
> > On Monday 06 Mar 2017 17:25:56 Geert Uytterhoeven wrote:
> >> Document the optional properties for describing module resets, to
> >> support resetting display channels and LVDS encoders on R-Car Gen2 and
> >> Gen3.
> >> 
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > This looks good to me.
> > 
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> 
> > I think we should try implementing support for reset in the DU driver
> > before merging this though, it always helps to test the proposed DT
> > bindings.
>
> Do you want me to drop the DU parts from my big patches to add all resets
> to the .dtsis I was going to send?
> 
> DU is the special one, as it doesn't have a one-to-one mapping of resets
> to modules.

If it's not too urgent, I'd appreciate if we could test it first, yes.

-- 
Regards,

Laurent Pinchart

