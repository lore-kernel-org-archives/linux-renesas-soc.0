Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52694 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750786AbdGNHUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jul 2017 03:20:36 -0400
Date: Fri, 14 Jul 2017 09:20:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a7796: Add resets property to
 VSP devices
Message-ID: <20170714072030.GD12105@verge.net.au>
References: <20170713105822.5327-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170713105822.5327-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUPrefMOEELnY8v_Apn8DmBQ+=KHK0P7k4CyhbaXE2SnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUPrefMOEELnY8v_Apn8DmBQ+=KHK0P7k4CyhbaXE2SnQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 01:17:10PM +0200, Geert Uytterhoeven wrote:
> On Thu, Jul 13, 2017 at 12:58 PM, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > The VSP nodes are missing the resets property. Add it.
> >
> > Fixes: 5a89c826745f ("arm64: dts: renesas: r8a7796: Add VSP instances")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have squashed this into the commit referenced above.
