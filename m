Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42251 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbeH3Dnn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 23:43:43 -0400
Received: by mail-lj1-f196.google.com with SMTP id f1-v6so5774798ljc.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Aug 2018 16:44:23 -0700 (PDT)
Date: Thu, 30 Aug 2018 01:44:21 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: jacopo mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        horms@verge.net.au, kieran.bingham+renesas@ideasonboard.com,
        damm+renesas@opensource.se, ulrich.hecht+renesas@gmail.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFT 0/8] arm64: dts: renesas: Ebisu: Add HDMI and CVBS input
Message-ID: <20180829234421.GB28374@bigcity.dyn.berto.se>
References: <1534760202-20114-1-git-send-email-jacopo+renesas@jmondi.org>
 <20180827094956.GA3566@w540>
 <20180827132345.GC15572@bigcity.dyn.berto.se>
 <4076708.qWth0rfBdu@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4076708.qWth0rfBdu@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo and Laurent,

On 2018-08-28 13:40:34 +0300, Laurent Pinchart wrote:

[snip]

> > >>> - The media_device_ops or at least the .link_notify() callback 
> > >>> of that
> > >>>   struct must be changed so not one driver in the media graph is
> > >>>   responsible for all links. In this case rcar-vin provides the
> > >>>   callback and rcar-vin should not judge which links between the
> > >>>   adv748x subdevices are OK to enable/disable. Currently the links
> > >>>   between the adv748x subdevices are immutably enabled to avoid this
> > >>>   particular problem.
> > >> 
> > >> Uh, I didn't get this :/ Care to elaborate more?
> > > 
> > > I'm thinking if it is not enough to just provide a .link_setup()
> > > callback to the (enabled) csi-2 sink pads of the adv748x and handle
> > > routing between the afe/hdmi sources and that sink, without the vin's
> > > registered link_notify playing any role in that.
> > 
> > That is my point, the v4l2 framework needs work to allow all drivers to
> > provide a .link_setup() callback. And this as you describe will conflict
> > with the current solution where there is only one possible such
> > callback. So in addition to being able to have multiple such callbacks
> > the current drivers implementing one would need to be updated to ignore
> > links which it do not care about.
> 
> Isn't this already possible ? We have a single top-level .link_notify() 
> operation at the media device level, but also .link_setup() operations for 
> each entity.

You are both right this is possible today, my bad. I had confused 
link_notify() and link_setup() and thought they where the same and that 
there could be only one implementation in struct media_device_ops which 
handled all link changes.

I'm happy to be proven wrong here as it will allow the adv748x to change 
links between its subdevices :-) Jacopo thanks for being persistent 
here!

-- 
Regards,
Niklas S�derlund
