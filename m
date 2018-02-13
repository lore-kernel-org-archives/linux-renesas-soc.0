Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45621 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933631AbeBMIka (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 03:40:30 -0500
Date: Tue, 13 Feb 2018 09:40:26 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: Warning for possible circular locking dependecy on v4.16-rc1
Message-ID: <20180213084026.hzsm65mxiwncydnh@verge.net.au>
References: <20180212201248.GH7666@bigcity.dyn.berto.se>
 <20180212224036.GC25611@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180212224036.GC25611@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 12, 2018 at 11:40:36PM +0100, Niklas Söderlund wrote:
> Hi again,
> 
> On 2018-02-12 21:12:48 +0100, Niklas Söderlund wrote:
> > Hi Geert,
> > 
> > When doing some testing on v4.16-rc1 I ran across this warning a couple 
> > of times. I was using the renesas_config from the current master branch 
> > of renesas-drivers at the time. It do not hit every time but in my 
> > limited testing I would say ~50%.
> 
> I forgot to mention this was on H3 ES2.0.

FWIIW, I have also observed this (once so far).
