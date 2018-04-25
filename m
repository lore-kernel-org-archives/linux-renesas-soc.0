Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36624 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753228AbeDZGNG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 02:13:06 -0400
Date: Wed, 25 Apr 2018 09:19:42 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Nguyen Viet Dung <nv-dung@jinso.co.jp>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH 02/10] arm64: defconfig: Enable
 CONFIG_SND_AUDIO_GRAPH_CARD
Message-ID: <20180425071941.bwhjbrs32fj4mr5i@verge.net.au>
References: <8736zmd7wi.wl%kuninori.morimoto.gx@renesas.com>
 <87zi1ubt6d.wl%kuninori.morimoto.gx@renesas.com>
 <CAMuHMdVtELSLp9s+RF-dWxPF7=j1Ht0==LQSn5RZJvU2fhJ4Sw@mail.gmail.com>
 <20180424093621.sencraxrhodsw3io@verge.net.au>
 <CAMuHMdXWbeZpaaf9X1pd4NTD7ibgmGTj6c7sxr3ihqvSrWo=yQ@mail.gmail.com>
 <87zi1s2lke.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zi1s2lke.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 25, 2018 at 12:13:07AM +0000, Kuninori Morimoto wrote:
> 
> Hi Geert
> 
> Thank for your review.
> 
> > >> > CONFIG_SND_AUDIO_GRAPH_CARD is needed to use HDMI sound with video
> > >> >
> > >> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >> > Tested-by: Nguyen Viet Dung <nv-dung@jinso.co.jp>
> > >>
> > >> Thanks for your patch!
> > >>
> > >> > --- a/arch/arm64/configs/defconfig
> > >> > +++ b/arch/arm64/configs/defconfig
> > >> > @@ -440,6 +440,7 @@ CONFIG_SND_SOC_SAMSUNG=y
> > >> >  CONFIG_SND_SOC_RCAR=m
> > >> >  CONFIG_SND_SOC_AK4613=m
> > >> >  CONFIG_SND_SIMPLE_CARD=y
> > >> > +CONFIG_SND_AUDIO_GRAPH_CARD=y
> > >>
> > >> Perhaps "m"?
> > >
> > > Do you suggest the same for renesas_defconfig?
> > > That is, patch 2/10?
> > 
> > No. For {shmobile,renesas}_defconfig we make everything builtin.
> > For {multi_v7,arm64}_defconfig, we usually make non-critical devices modular.
> 
> Yeah.
> CONFIG_SND_AUDIO_GRAPH_CARD is similar driver to CONFIG_SND_SIMPLE_CARD
> But it has =y on defconfig, thus, I used same style.
> If it should be =m, then, we need +1 patch which modifes CONFIG_SND_SIMPLE_CARD, too.

I think that would be ideal.
