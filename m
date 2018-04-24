Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33285 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751723AbeDXJli (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:41:38 -0400
Date: Tue, 24 Apr 2018 11:41:35 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Nguyen Viet Dung <nv-dung@jinso.co.jp>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH 00/10] arm64: renesas: enable HDMI sound on Salvator
Message-ID: <20180424094134.cvhtutg4dnedurnm@verge.net.au>
References: <8736zmd7wi.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8736zmd7wi.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 23, 2018 at 01:35:59AM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> These patches enable HDMI sound on R-Car Salvator boards on H3/M3.
> Basically, HDMI sound support on "driver side" was already supported,
> but I didn't posted "DT side" patches, because it needed to confirm
> business relationship. Now it be cleared.
> 
> But, unfortunately, DT "full_name" behavior was exchanged from v4.15.
> And driver assumeed that DT is using numerical suffixes, but this idea
> was rejected. Because of these reasons, it needs below patch.
> Simon, can you consider these patches on below ?
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git :: for-4.18
> 
> 9ff7386656f5b7d9524ab7bdf69d508d14800d42
> ("ASoC: rsnd: don't assume node full path name for HDMI probing")
> 
> 1)       : only for renesas, not for upstream
> 2)       : for defconfig
> 3) - 10) : based on 9ff7386656f5b7d9524ab7bdf69d508d14800d42
> 
> Kuninori Morimoto (10):
>    1) arm64: renesas_defconfig: Enable CONFIG_SND_AUDIO_GRAPH_CARD
>    2) arm64: defconfig: Enable CONFIG_SND_AUDIO_GRAPH_CARD

Geert has some comments regarding patch 1 which may also apply to patch 2.
Lets sort that out one way or another.

>    3) arm64: dts: renesas: r8a7795: add HDMI sound support
>    4) arm64: dts: renesas: r8a7796: add HDMI sound support
>    5) arm64: dts: renesas: salvator-common: use audio-graph-card for Sound
>    6) arm64: dts: renesas: r8a7795-es1-salvator-x: enable HDMI sound
>    7) arm64: dts: renesas: r8a7795-salvator-xs: enable HDMI sound
>    8) arm64: dts: renesas: r8a7796-salvator-xs: enable HDMI sound
>    9) arm64: dts: renesas: r8a7795-salvator-x: enable HDMI sound
>   10) arm64: dts: renesas: r8a7796-salvator-x: enable HDMI sound

Patches 3 - 10 applied, thanks!

> 
>  .../boot/dts/renesas/r8a7795-es1-salvator-x.dts    | 46 ++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 46 ++++++++++++++++++++++
>  .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts | 46 ++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  8 ++++
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 28 +++++++++++++
>  .../arm64/boot/dts/renesas/r8a7796-salvator-xs.dts | 28 +++++++++++++
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  4 ++
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi   | 38 ++++++++++--------
>  arch/arm64/configs/defconfig                       |  1 +
>  arch/arm64/configs/renesas_defconfig               |  1 +
>  10 files changed, 230 insertions(+), 16 deletions(-)
> 
> -- 
> 1.9.1
> 
