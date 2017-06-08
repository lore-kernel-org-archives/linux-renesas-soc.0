Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60890 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751747AbdFHN3j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2017 09:29:39 -0400
Date: Thu, 8 Jun 2017 15:29:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable Simple Sound Card support
Message-ID: <20170608132926.GA19821@verge.net.au>
References: <87mv9lzw6k.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mv9lzw6k.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 06, 2017 at 02:33:47AM +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> commit 7fa72cca39a0 ("ASoC: rsnd: add HDMI output support")
> exchanged Renesas Sound driver's Kconfig selection
> from SND_SIMPLE_CARD to SND_SIMPLE_CARD_UTILS, because of this,
> defconfig doesn't select SND_SIMPLE_CARD today.
> All Renesas platform needs SND_SIMPLE_CARD, Let's select it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks Morimoto-san, applied.
