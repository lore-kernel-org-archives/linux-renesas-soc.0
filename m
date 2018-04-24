Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33219 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752809AbeDXJgZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:36:25 -0400
Date: Tue, 24 Apr 2018 11:36:22 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Nguyen Viet Dung <nv-dung@jinso.co.jp>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH 02/10] arm64: defconfig: Enable
 CONFIG_SND_AUDIO_GRAPH_CARD
Message-ID: <20180424093621.sencraxrhodsw3io@verge.net.au>
References: <8736zmd7wi.wl%kuninori.morimoto.gx@renesas.com>
 <87zi1ubt6d.wl%kuninori.morimoto.gx@renesas.com>
 <CAMuHMdVtELSLp9s+RF-dWxPF7=j1Ht0==LQSn5RZJvU2fhJ4Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVtELSLp9s+RF-dWxPF7=j1Ht0==LQSn5RZJvU2fhJ4Sw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 23, 2018 at 10:01:51AM +0200, Geert Uytterhoeven wrote:
> Hi Morimoto-san,
> 
> On Mon, Apr 23, 2018 at 3:39 AM, Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> >
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > CONFIG_SND_AUDIO_GRAPH_CARD is needed to use HDMI sound with video
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Tested-by: Nguyen Viet Dung <nv-dung@jinso.co.jp>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -440,6 +440,7 @@ CONFIG_SND_SOC_SAMSUNG=y
> >  CONFIG_SND_SOC_RCAR=m
> >  CONFIG_SND_SOC_AK4613=m
> >  CONFIG_SND_SIMPLE_CARD=y
> > +CONFIG_SND_AUDIO_GRAPH_CARD=y
> 
> Perhaps "m"?

Do you suggest the same for renesas_defconfig?
That is, patch 2/10?
