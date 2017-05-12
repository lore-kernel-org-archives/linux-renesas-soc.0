Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46655 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756704AbdELH1e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 May 2017 03:27:34 -0400
Date: Fri, 12 May 2017 09:27:24 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 04/10] arm64: renesas: r8a7796: add AUDIO_DMAC support
Message-ID: <20170512072724.GA27979@verge.net.au>
References: <87fugbwz72.wl%kuninori.morimoto.gx@renesas.com>
 <87a86jwz3y.wl%kuninori.morimoto.gx@renesas.com>
 <20170511142832.GA21895@verge.net.au>
 <87r2zv9dia.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r2zv9dia.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 11, 2017 at 11:36:26PM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> > > +		audma0: dma-controller@ec700000 {
> (snip)
> > > +			iommus = <&ipmmu_mp0 0>, <&ipmmu_mp0 1>,
> > > +			       <&ipmmu_mp0 2>, <&ipmmu_mp0 3>,
> > > +			       <&ipmmu_mp0 4>, <&ipmmu_mp0 5>,
> > > +			       <&ipmmu_mp0 6>, <&ipmmu_mp0 7>,
> > > +			       <&ipmmu_mp0 8>, <&ipmmu_mp0 9>,
> > > +			       <&ipmmu_mp0 10>, <&ipmmu_mp0 11>,
> > > +			       <&ipmmu_mp0 12>, <&ipmmu_mp0 13>,
> > > +			       <&ipmmu_mp0 14>, <&ipmmu_mp0 15>;
> > 
> > I don't see ipmmu_mp0 in renesas-devel-20170503-v4.11.
> > Perhaps that portion should be dropped? Likewise below.
> 
> Oops !?
> I used latest renesas-drivers branch.
> I will rebase to renesas-devel in v2

Great, thanks.
