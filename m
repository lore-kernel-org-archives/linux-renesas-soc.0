Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43762 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbeKHUXx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 15:23:53 -0500
Date: Thu, 8 Nov 2018 11:48:56 +0100
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
        Jiada Wang <jiada_wang@mentor.com>
Subject: Re: [PATCH 0/4] arm64: renesas: enable ULCB HDMI / ULCB-KF sound
Message-ID: <20181108104856.4ghuq6tytu6qwli3@verge.net.au>
References: <87in18e3um.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87in18e3um.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 08, 2018 at 01:57:41AM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> These patches adds sound support for KingFisher.
> We can enable it on top of v4.20-rc1, but, it is not stable.
> We need this patch (= from ASoC for-v4.21 branch) to be stable it.
> 
> 	223bc10b84970fd772c105b550beeef3ac3502be
> 	("ASoC: pcm3168a: remove read-only status register from snd_kcontrol_new")

Perhaps it is best to wait for that patch to hit an rc release.
Do you know when that will happen?

> 
> Kuninori Morimoto (4):
>   arm64: renesas: ulcb: use audio-graph-card
>   arm64: renesas: ulcb: add HDMI sound support
>   arm64: renesas: ulcb-kf: add pcm3168 sound codec
>   arm64: renesas_defconfig: select Kingfisher Sound related configs
> 
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 151 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/ulcb.dtsi    |  70 ++++++++++----
>  arch/arm64/configs/renesas_defconfig     |   2 +
>  3 files changed, 206 insertions(+), 17 deletions(-)
> 
> -- 
> 2.7.4
> 
> 
> 
> Best regards
> ---
> Kuninori Morimoto
> 
