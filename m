Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44303 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932087AbdFNJAy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jun 2017 05:00:54 -0400
Date: Wed, 14 Jun 2017 11:00:48 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add reset control properties
 for audio
Message-ID: <20170614090047.GE26958@verge.net.au>
References: <1497259937-9387-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1497259937-9387-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 12, 2017 at 11:32:15AM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus, Morimoto-san,
> 
> This patch series describes all resets wired to the audio modules on
> R-Car Gen3 SoCs, following the DT binding update in commit
> 5f440c48c5d5a11f ("ASoC: rsnd: Document optional reset properties") in
> sound-asoc/for-next.
> 
> Thanks!
> 
> Geert Uytterhoeven (2):
>   arm64: dts: r8a7795: Add reset control properties for audio
>   arm64: dts: r8a7796: Add reset control properties for audio

Thanks, I have queued these up for v4.13.
