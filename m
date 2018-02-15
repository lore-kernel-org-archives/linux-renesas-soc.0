Return-Path: <devicetree-owner@vger.kernel.org>
Date: Thu, 15 Feb 2018 17:50:01 +0100
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kbingham@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        geert@glider.be, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/8] arm64: dts: renesas: r8a77995-draak: Add HDMI Out
 through ADV7511
Message-ID: <20180215165000.j6szepze6tyfww7n@verge.net.au>
References: <1518683903-10681-1-git-send-email-kbingham@kernel.org>
 <1518683903-10681-8-git-send-email-kbingham@kernel.org>
 <2517305.jdPBFiRQEk@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2517305.jdPBFiRQEk@avalon>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 15, 2018 at 04:16:00PM +0200, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Thursday, 15 February 2018 10:38:22 EET Kieran Bingham wrote:
> > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > 
> > Provide a device node for the ADV7511 as found on the Draak D3 platform.
> > 
> > The ADV7511 is connected to the DU through a parallel mux chip, and is
> > configurable in hardware whether it is connected to LVDS0 or LVDS1.
> > 
> > Connect through to LVDS0 as a default implementation.
> 
> You need to model the LVDS decoder in DT too. I know that no driver and no DT 
> bindings are available at the moment, and I'm aware that this patch enables 
> the HDMI output on the Draak board, but I don't think it's upstreamable as-is.

Thanks, I've marked this as "Changes Requested".
