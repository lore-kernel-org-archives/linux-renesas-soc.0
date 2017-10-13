Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53219 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751529AbdJMKlq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 06:41:46 -0400
Date: Fri, 13 Oct 2017 12:41:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: renesas: salvator-common: fixup audio_clkout
Message-ID: <20171013104116.olmgm2e2vowyiw6s@verge.net.au>
References: <87mv4vvbsh.wl%kuninori.morimoto.gx@renesas.com>
 <87k1zzvbqw.wl%kuninori.morimoto.gx@renesas.com>
 <23722c6e-63d0-7c52-f956-2e2ec9390fb2@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23722c6e-63d0-7c52-f956-2e2ec9390fb2@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 13, 2017 at 11:59:58AM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 10/13/2017 8:56 AM, Kuninori Morimoto wrote:
> 
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > "audio_clkout" is dummy clock of <&rcar_sound 0> to avoid clock loop
> > which invites probe conflct. Thus <&rcar_sound 0> and "audio_clkout"
> 
>    Conflict.
> 
> > should be same value.
> > 
> > On commit 5e2feac33095 ("arm64: renesas: salvator-common: sound
> > clock-frequency needs descending order") exchanged <&rcar_sound 0>,
> > but it didn't modify "audio_clkout".
> > This patch fixup it.
> 
>    Fixes it up.
> 
> > Fixes: 5e2feac33095 ("arm64: renesas: salvator-common: sound
> >                        clock-frequency needs descending order")
> 
>    Don't ever wrap the summaries around in this tag.

I fixed that one up before applying the patches.

Morimoto-san, if you would like to correct the other errors let me know
and I can handle it.

> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> [...]
> 
> MBR, Sergei
> 
