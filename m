Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59875 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755471AbdCXGzX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Mar 2017 02:55:23 -0400
Date: Fri, 24 Mar 2017 07:55:12 +0100
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        linux-renesas-soc@vger.kernel.org,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH] ASoC: rcar: ssi: don't set SSICR.CKDV = 000 with
 SSIWSR.CONT
Message-ID: <20170324065512.GH1319@verge.net.au>
References: <87zigenerc.wl%kuninori.morimoto.gx@renesas.com>
 <4764a887-edbc-efa3-881b-3edfb1175d01@cogentembedded.com>
 <87o9wtofqy.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o9wtofqy.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 22, 2017 at 08:56:07AM +0000, Kuninori Morimoto wrote:
> 
> Hi Sergei
> 
> > >  		/*
> > > +		 * It will set SSIWSR.CONT here, but SSICR.CKDV = 000
> > > +		 * with it is not allowed. (SSIWSR.WS_MODE with
> > > +		 * SSICR.CKDV = 000 is not allowed either).
> > > +		 * Skip it. See SSICR.CKDV
> > > +		 */
> > > +		if (j == 0)
> > > +			continue;
> > 
> >    Why not change the *for* statement itself to start with j = 1?
> 
> It can be one solution. Actually my local 1st patch was such style.
> But I thought that it is difficult to notice such magical operation from code.
> Thus, I used this style

FWIIW, I think if you have a comment, like the one above, then j = 1 should
be obvious enough.
