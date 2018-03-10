Return-Path: <devicetree-owner@vger.kernel.org>
Date: Sat, 10 Mar 2018 18:22:08 +0100
From: jacopo mondi <jacopo@jmondi.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, architt@codeaurora.org,
        a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        airlied@linux.ie, horms@verge.net.au, magnus.damm@gmail.com,
        geert@linux-m68k.org, niklas.soderlund@ragnatech.se,
        robh+dt@kernel.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: Add LVDS decoder to R-Car
 V3M Eagle
Message-ID: <20180310172208.GI4023@w540>
References: <1520603500-15218-1-git-send-email-jacopo+renesas@jmondi.org>
 <1520603500-15218-4-git-send-email-jacopo+renesas@jmondi.org>
 <e0ff40be-f134-5a86-6d00-9506d9829364@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e0ff40be-f134-5a86-6d00-9506d9829364@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Mar 09, 2018 at 08:30:36PM +0300, Sergei Shtylyov wrote:
> On 03/09/2018 04:51 PM, Jacopo Mondi wrote:
>
> > The R-Car V3M Eagle board includes a transparent LVDS decoder, connected
> > to the on-chip LVDS encoder output on one side and to HDMI encoder
> > ADV7511w on the other one.
> >
> > As the decoder does not need any configuration it has been so-far
> > omitted from DTS. Now that a driver for transparent LVDS decoder is
> > available, describe it in DT as well.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 31 ++++++++++++++++++++++++--
> >  1 file changed, 29 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> > index c0fd144..0a95c20 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> > @@ -42,6 +42,33 @@
> >  			};
> >  		};
> >  	};
> > +
> > +	lvds,decoder {
>
>    I said hyphen (-), not comma (,)! :-)

Ahah ok, my bad, I somehow confused the two :)
It looked weird to me, but I thought you were pointing me to some
convention I didn't know about!

I'll change this in v3

Thanks
  j
>
> [...]
>
> MBR, Sergei
