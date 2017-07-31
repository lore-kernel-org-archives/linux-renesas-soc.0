Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42199 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750987AbdGaOzz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 10:55:55 -0400
Date: Mon, 31 Jul 2017 16:55:49 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: Remove extra LVDS
 port label
Message-ID: <20170731145548.GA15797@verge.net.au>
References: <20170713121714.30789-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUaZZc+WXhmEif6kBgAV7jfREtk78nn67W3=SwvkVxhPg@mail.gmail.com>
 <2519562.g0Iit6Qbpy@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2519562.g0Iit6Qbpy@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jul 29, 2017 at 11:05:50PM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Monday 17 Jul 2017 10:07:33 Geert Uytterhoeven wrote:
> > On Thu, Jul 13, 2017 at 2:17 PM, Laurent Pinchart wrote:
> > > The DU LVDS output is on port 3 on R8A7795 but on port 2 on R8A7796. The
> > > lvds_connector label thus can't be defined in salvator-common.dtsi,
> > > common to the two SoCs.
> > > 
> > > The lvds_connector label is meant for convience to be referenced from
> > > panel device tree files, such as r8a77xx-aa104xd12-panel.dtsi or
> > > r8a77xx-aa121td01-panel.dtsi.  As those files are not included in any
> > > device tree source, and the label never used elsewhere, we can simply
> > > remove it. Out-of-tree patches that include panel device tree files can
> > > then add a
> > > 
> > >         #define lvds_connector du_out_lvds0
> > > 
> > > before including the panel device tree file.
> > > 
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Could you please pick this patch up for v4.14 ?

Sure done.

I took the liberty of correcting the spelling of convenience before
committing the change.
