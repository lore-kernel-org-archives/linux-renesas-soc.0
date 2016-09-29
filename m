Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34543 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751220AbcI2JyU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 05:54:20 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jithin T Raj <jithin.t@tataelxsi.co.in>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: LVDS Support in R-Car E2(ALT) Board
Date: Thu, 29 Sep 2016 12:54:16 +0300
Message-ID: <3340255.hgJDDfAHs8@avalon>
In-Reply-To: <CAMuHMdX9wv2L4NaDWQRHVJP2X2KY_j-XgzBvZ7UtjAZ1Tp5vig@mail.gmail.com>
References: <SG2PR0401MB12961FCFA0E7D9A29DB6276BD8CE0@SG2PR0401MB1296.apcprd04.prod.outlook.com> <CAMuHMdX9wv2L4NaDWQRHVJP2X2KY_j-XgzBvZ7UtjAZ1Tp5vig@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thursday 29 Sep 2016 08:35:32 Geert Uytterhoeven wrote:
> On Thu, Sep 29, 2016 at 6:14 AM, Jithin T Raj wrote:
> > I have successfully applied the patch and build R-car M2 Kernel for
> > Koelsch Board..now it support LVDS..Thank you all especially Geert and
> > Laurent..now i tried the same source tree(v4.7.5) to build for R-Car
> 
> Good to hear it works on Koelsch!
> 
> > E2(ALT)Board to make LVDS up..but i am getting the following error
> > during making .dtb file
> > 
> > ubuntu@teltvm2468l:~/jithin_new/linux-4.7.5$ make -j4 r8a7794-alt.dtb
> > 
> >   DTC     arch/arm/boot/dts/r8a7794-alt.dtb
> > 
> > Error: arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi:39.1-16 Label or
> > path lvds_connector not found FATAL ERROR: Syntax error parsing input
> > tree
> > make[1]: *** [arch/arm/boot/dts/r8a7794-alt.dtb] Error 1
> > make: *** [r8a7794-alt.dtb] Error 2
> > ubuntu@teltvm2468l:~/jithin_new/linux-4.7.5$
> > 
> > I have included the "#include "r8a77xx-aa104xd12-panel.dtsi" in
> > r8a7794-alt.dts
> > 
> > my source tree is v4.7.5 stable edition
> 
> No one has added LVDS support for r8a7794/alt yet.

The R8A7794 has no LVDS output. The Alt board uses an RGB to LVDS bridge, 
similar to the one used by the Marzen board. You can have a look at the Marzen 
DT to see how to implement that.

-- 
Regards,

Laurent Pinchart
