Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f174.google.com ([209.85.208.174]:43210 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbeLEVgR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 16:36:17 -0500
Received: by mail-lj1-f174.google.com with SMTP id 83-v6so19730291ljf.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Dec 2018 13:36:15 -0800 (PST)
Date: Wed, 5 Dec 2018 22:36:13 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: enable HS400 on R-Car Gen3
Message-ID: <20181205213613.GA20406@bigcity.dyn.berto.se>
References: <20181031233125.2800-1-niklas.soderlund@ragnatech.se>
 <20181101194528.GS2433@kunai>
 <20181102115718.7alk6psbkg4sdqtj@verge.net.au>
 <20181205204628.wvc2d4zfynbrztgq@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181205204628.wvc2d4zfynbrztgq@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 2018-12-05 21:46:28 +0100, Wolfram Sang wrote:
> On Fri, Nov 02, 2018 at 12:57:19PM +0100, Simon Horman wrote:
> > On Thu, Nov 01, 2018 at 08:45:29PM +0100, Wolfram Sang wrote:
> > > 
> > > > This patch have quiet a few dependencies I'm afraid, let me know if you 
> > > > wish to be notified once they all upstream. I don't think it's a good 
> > > > idea to pick this up before all dependencies are resolved.
> > > 
> > > Yes, we should do that. Ping Simon once all dependencies are in next. It
> > > is still fine to have this patch here in case people want to test. BTW
> > > did you mention your branch somewhere where you collected all these
> > > patches to make HS400 working/enabled?
> > > 
> > > For this patch already:
> > > 
> > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > 
> > Thanks, I am marking this as deferred.
> > 
> > Please repost or ping me once the dependencies are present in
> > an rc release.
> 
> Niklas, are we done now, so we can ask Simon to pick up the DTS change?
> 

Almost :-)

I'm  waiting for Geert to take the SD quirk patches before pinging Simon 
to take this one. Spoke to him today about that so I hope it will not be 
to long.

-- 
Regards,
Niklas S�derlund
