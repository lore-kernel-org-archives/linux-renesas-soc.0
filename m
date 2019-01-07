Return-Path: <SRS0=nqfF=PP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58858C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 13:51:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFD4D2147C
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 13:51:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="gYerkCal"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbfAGNvZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Jan 2019 08:51:25 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40522 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727943AbfAGNvZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jan 2019 08:51:25 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5914025B7BA;
        Tue,  8 Jan 2019 00:51:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546869083; bh=n23XrN3uXM7i2GWMzhb49waDD6+Mc0jrMYUw22/3JeE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gYerkCalApBgcnxwFnO7urF1OdEYkZbRBr7CuxC/9k/smRxIUH5iaGta5UP/rnfA8
         MtiverHcXxDLbwSW7nRp3nWM97RT7484+h0QYAv2f5skLNPeoTqIhjQOKa1B6BSIxf
         Oj+id5wlOzTQ8r6xbmVVVeYxvU3LJSg2IrxJtcAM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 10A9C940443; Mon,  7 Jan 2019 14:51:20 +0100 (CET)
Date:   Mon, 7 Jan 2019 14:51:20 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: dts: renesas: Sound update for ULCB/KF, etc
Message-ID: <20190107135116.272uild4ta65awb3@verge.net.au>
References: <87h8elno1z.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h8elno1z.wl-kuninori.morimoto.gx@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 07, 2019 at 12:39:29PM +0900, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> These are v2 of ULCB/KF sound patches.
> 
> Kuninori Morimoto (8):
>   arm64: dts: renesas: ulcb: use audio-graph-card
>   arm64: dts: renesas: ulcb: add HDMI sound support
>   arm64: dts: renesas: ulcb-kf: add pcm3168 sound codec
>   arm64: dts: renesas: r8a7795: remove BUSIF0 settings from rcar_sound,ssi
>   arm64: dts: renesas: r8a7796: remove BUSIF0 settings from rcar_sound,ssi
>   arm64: dts: renesas: r8a77990-ebisu: use simple-audio-card
>   arm64: defconfig: select Kingfisher Sound related configs

Thanks, I have applied the above patches for v5.1.

>   arm64: renesas_defconfig: select Kingfisher Sound related configs

And applied the above patch to the topic/renesas-defconfig branch
which is included in the devel branch but not targeted at upstream.

>  arch/arm64/boot/dts/renesas/r8a7795.dtsi       |  40 +++----
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi       |  40 +++----
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |   5 +-
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi       | 138 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/ulcb.dtsi          |  70 ++++++++++---
>  arch/arm64/configs/defconfig                   |   1 +
>  arch/arm64/configs/renesas_defconfig           |   2 +
>  7 files changed, 235 insertions(+), 61 deletions(-)
> 
> -- 
> 2.7.4
> 
