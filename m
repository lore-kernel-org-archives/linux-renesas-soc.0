Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53908 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753933AbcHQHXE (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 17 Aug 2016 03:23:04 -0400
Date: Wed, 17 Aug 2016 09:22:58 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: dts: r8a7790/r8a7791: Remove obsolete vsp1
 properties
Message-ID: <20160817072257.GI8673@verge.net.au>
References: <1471359392-12584-1-git-send-email-geert+renesas@glider.be>
 <1731850.1TRV7u0XMF@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1731850.1TRV7u0XMF@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 16, 2016 at 06:09:12PM +0300, Laurent Pinchart wrote:
> Hi Geert,
> 
> On Tuesday 16 Aug 2016 16:56:30 Geert Uytterhoeven wrote:
> > 	Hi Simon, Magnus, Laurent,
> > 
> > This patch series removes from the R-Car H2 and M2-W DT source files the
> > obsolete DT properties to identify the exact VSP device instance
> > features, which are no longer needed nor used since commit
> > 5aa2eb3c86d4fd16 ("[media] v4l: vsp1: Configure device based on IP
> > version").
> 
> I was about to submit the same patches :-)
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > Geert Uytterhoeven (2):
> >   ARM: dts: r8a7790: Remove obsolete vsp1 properties
> >   ARM: dts: r8a7791: Remove obsolete vsp1 properties

Thanks, I have queued these up.
