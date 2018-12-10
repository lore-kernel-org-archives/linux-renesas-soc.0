Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41658 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbeLJMKv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 07:10:51 -0500
Date: Mon, 10 Dec 2018 13:10:47 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: enable HS400 on R-Car Gen3
Message-ID: <20181210121047.en7cxcrtlgu77uxx@verge.net.au>
References: <20181031233125.2800-1-niklas.soderlund@ragnatech.se>
 <20181101194528.GS2433@kunai>
 <20181102115718.7alk6psbkg4sdqtj@verge.net.au>
 <20181205204628.wvc2d4zfynbrztgq@ninjato>
 <20181205213613.GA20406@bigcity.dyn.berto.se>
 <20181207205204.GF17972@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181207205204.GF17972@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 07, 2018 at 09:52:04PM +0100, Niklas Söderlund wrote:
> Hi Simon, Wolfram,
> 
> On 2018-12-05 22:36:13 +0100, Niklas Söderlund wrote:
> > Hi Wolfram,
> > 
> > On 2018-12-05 21:46:28 +0100, Wolfram Sang wrote:
> > > On Fri, Nov 02, 2018 at 12:57:19PM +0100, Simon Horman wrote:
> > > > On Thu, Nov 01, 2018 at 08:45:29PM +0100, Wolfram Sang wrote:
> > > > > 
> > > > > > This patch have quiet a few dependencies I'm afraid, let me know if you 
> > > > > > wish to be notified once they all upstream. I don't think it's a good 
> > > > > > idea to pick this up before all dependencies are resolved.
> > > > > 
> > > > > Yes, we should do that. Ping Simon once all dependencies are in next. It
> > > > > is still fine to have this patch here in case people want to test. BTW
> > > > > did you mention your branch somewhere where you collected all these
> > > > > patches to make HS400 working/enabled?
> > > > > 
> > > > > For this patch already:
> > > > > 
> > > > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > 
> > > > Thanks, I am marking this as deferred.
> > > > 
> > > > Please repost or ping me once the dependencies are present in
> > > > an rc release.
> > > 
> > > Niklas, are we done now, so we can ask Simon to pick up the DTS change?
> > > 
> > 
> > Almost :-)
> > 
> > I'm  waiting for Geert to take the SD quirk patches before pinging Simon 
> > to take this one. Spoke to him today about that so I hope it will not be 
> > to long.
> > 
> 
> I just confirmation that the clock patches have been pulled into 
> clk-next so this patch is ready to be consumed by you Simon.
> 
> Would it be possible to get this in this cycle or is it to late? I know 
> you wished to close your tree for v4.21 at the end of this week which it 
> technically is now ;-)

Hi Niklas,

I'm sorry but it was too late. I have queued this up for v4.22.
