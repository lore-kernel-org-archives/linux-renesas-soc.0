Return-Path: <devicetree-owner@vger.kernel.org>
Date: Mon, 15 Jan 2018 07:57:48 +0100
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 00/10] R-Car DU: Convert LVDS code to bridge driver
Message-ID: <20180115065747.hx5kvhurk3x5f3jz@verge.net.au>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWJ=5O4+FyutUdtWY+8yBwBy_fKqJ-vZGUKKUuvpeB8FQ@mail.gmail.com>
 <2317358.st5FeEE5QH@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2317358.st5FeEE5QH@avalon>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 12, 2018 at 03:48:25PM +0200, Laurent Pinchart wrote:
> Hi Geert,
> 
> On Friday, 12 January 2018 11:47:03 EET Geert Uytterhoeven wrote:
> > On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart wrote:
> > > This patch series addresses a design mistake that dates back from the
> > > initial DU support. Support for the LVDS encoders, which are IP cores
> > > separate from the DU, was bundled in the DU driver. Worse, both the DU
> > > and LVDS were described through a single DT node.
> > > 
> > > To fix the, patches 01/10 and 02/10 define new DT bindings for the LVDS
> > > encoders, and deprecate their description inside the DU bindings. To
> > > retain backward compatibility with existing DT, patch 03/10 then patches
> > > the device tree at runtime to convert the legacy bindings to the new ones.
> > 
> > Looks like we will have to postpone the R-Car Gen2 Modern DT flag day
> > again by a few kernel releases?
> 
> Why so ? We don't have to drop support for all legacy DT bindings at the same 
> time, do we ? We can switch to the new-style clock bindings on Gen2 already, 
> and drop the legacy LVDS bindings later.

To clarify, after this patchset.
* Old DTs work with old and new kernels.
* New DTs require new kernels.

