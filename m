Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32825 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbeHFBPD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Aug 2018 21:15:03 -0400
Received: by mail-wr1-f68.google.com with SMTP id g6-v6so10640947wrp.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 05 Aug 2018 16:08:46 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Mon, 6 Aug 2018 01:08:40 +0200
To: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 13/14] arm64: dts: renesas: r8a77965: Add HSCIF0 device
 node
Message-ID: <20180805230825.GA22714@x230>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-14-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180804231114.21420-14-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Simon, Geert, Takeshi,

On Sun, Aug 05, 2018 at 01:11:13AM +0200, Eugeniu Rosca wrote:
> Add hscif0 node to avoid below r8a77965-ulcb-kf.dtb build failure:
> Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:36.1-8 Label or path hscif0 not found
> 
> Inspired from v4.12-rc1 commits:
>  - commit 68cd16107260 ("arm64: dts: r8a7796 dtsi: Add all HSCIF nodes")
>  - commit 6d50bb893504 ("arm64: dts: r8a7796: Enable HSCIF DMA")
>  - commit bec0948e810f ("arm64: dts: r8a7796: Add reset control properties")
> 
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

I noticed that this patch (adding HSCIF0 node only) conflicts with
below commit (adding all HSCIF nodes) from the "devel" branch of
horms/renesas.git repository:

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git/commit/?h=b8e3c8e17611

Please, feel free to ignore my patch. It only ensures that this series
doesn't break the "make dtbs" build.

Thanks,
Eugeniu.
