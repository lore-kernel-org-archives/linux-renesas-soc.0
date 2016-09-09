Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37951 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750760AbcIIPGs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2016 11:06:48 -0400
Date: Fri, 9 Sep 2016 17:06:42 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Add voltage switch operations
 for SDHI
Message-ID: <20160909150641.GA13747@verge.net.au>
References: <1473335853-32102-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdUM4B0KQMS127VGTSV8DkDGaUAy_vfK1XK6EnVd5p9DPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUM4B0KQMS127VGTSV8DkDGaUAy_vfK1XK6EnVd5p9DPQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 09, 2016 at 10:24:55AM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 8, 2016 at 1:57 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > This patch supports the {get,set}_io_voltage operations of SDHI.
> >
> > This operates the POCCTRL0 register on R8A7796 SoC and makes 1.8v/3.3v
> > voltage switch.
> >
> > Based on work by Takeshi Kihara and Wolfram Sang.
> >
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will you queue this up?
