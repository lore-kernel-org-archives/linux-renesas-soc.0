Return-Path: <devicetree-owner@vger.kernel.org>
Date: Tue, 11 Jul 2017 11:00:55 +0200
From: Simon Horman <horms@verge.net.au>
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/7] dt-bindings: display: renesas: Add R-Car M3-W
 HDMI TX DT bindings
Message-ID: <20170711090055.GE4517@verge.net.au>
References: <20170621093133.5677-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170621093133.5677-2-laurent.pinchart+renesas@ideasonboard.com>
 <20170626155642.6ux7rdtwup6vzhnk@rob-hp-laptop>
 <20170710092531.GA15635@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170710092531.GA15635@verge.net.au>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 10, 2017 at 11:25:31AM +0200, Simon Horman wrote:
> On Mon, Jun 26, 2017 at 10:56:42AM -0500, Rob Herring wrote:
> > On Wed, Jun 21, 2017 at 12:31:27PM +0300, Laurent Pinchart wrote:
> > > The M3-W HDMI TX controller seems to be compatible for the H3. No
> > > extension to the DT bindings are needed, add an SoC-specific compatible
> > > string in case differences between the IP versions are found later and
> > > require model-specific handling.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> 
> Applied for v4.14.
> 
> I am not applying the dts changes for now pending resolution of the
> potential bisection problem in patch 4 which I pointed out in response to that patch.

That problem has now been resolved and I have applied this series for v4.14.
