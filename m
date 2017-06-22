Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33030 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751163AbdFVJCm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jun 2017 05:02:42 -0400
Date: Thu, 22 Jun 2017 11:02:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/2] arm64: defconfig: ak4613/renesas sound will be
 kernle module
Message-ID: <20170622090228.GA24234@verge.net.au>
References: <87injs25la.wl%kuninori.morimoto.gx@renesas.com>
 <20170620132038.GG14340@verge.net.au>
 <87bmpi8atz.wl%kuninori.morimoto.gx@renesas.com>
 <20170621120309.GD17965@verge.net.au>
 <CAMuHMdUjMb85X17H9xYDQgTrRSCRFzTPDyEg4WCfmC8gHrk=XA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUjMb85X17H9xYDQgTrRSCRFzTPDyEg4WCfmC8gHrk=XA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 21, 2017 at 02:21:11PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Jun 21, 2017 at 2:03 PM, Simon Horman <horms@verge.net.au> wrote:
> > Compile the renesas sound and ak4613 drivers to reduce the ARM64 kernel
> 
> ... as modules ...
> 
> Else you increase size ;-)

Thanks, fixed.
