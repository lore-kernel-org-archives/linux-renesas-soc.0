Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34617 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751313AbdCGHST (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 02:18:19 -0500
Date: Tue, 7 Mar 2017 07:52:08 +0100
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM/ARM64: renesas: Tidyup Audio-DMAC channel for DVC
Message-ID: <20170307065207.GE14208@verge.net.au>
References: <878toh8xru.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878toh8xru.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 07, 2017 at 05:27:47AM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> These fixup DVC Audio-DMAC channel assignment
> which was not same as SRC/SSI policy.
> Because of this (is a little bit excessive),
> current Playback/Capture on each platform
> (= Lager/Koelsch/Gose/Salvator) are using same
> Audio-DMAC0. Playback/Capture uses different
> Audio-DMAC is more make sense for me.

Thanks Morimoto-san,

I have queued these up with the minor tweak to the subject of the last
patch mentioned below.

> Kuninori Morimoto (4):
>   ARM: dts: r8a7790: Tidyup Audio-DMAC channel for DVC
>   ARM: dts: r8a7791: Tidyup Audio-DMAC channel for DVC
>   ARM: dts: r8a7793: Tidyup Audio-DMAC channel for DVC
>   arm64: renesas: r8a7795: Tidyup Audio-DMAC channel for DVC

s/renesas/dts/
