Return-Path: <SRS0=84+3=PE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9BBC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 01:57:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E37D221741
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 01:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Zh583co/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbeL0B5X (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 26 Dec 2018 20:57:23 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:58189 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbeL0B5X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Dec 2018 20:57:23 -0500
Received: from penelope.horms.nl (softbank060150141248.bbtec.net [60.150.141.248])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 32E6C25B75B;
        Thu, 27 Dec 2018 12:57:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545875841; bh=ej6jWjK56iJrH3tgqJELKEqJEzLHOSsFUsd/nebPmio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zh583co/yDlvTBKAYXtcrYNvjKfpE4WhI5a+/4OMnXANyxYKAqlKBg+oQl++52OMR
         4KgmF2DQc72NlDy7ti84ZeD8RXott6WrGTA5rGt1Eku4QDPChewrfVRija4h4fOR9M
         GRy67rt6msPbMPUZqSf56qTCAUdMpHtKjcpS3Pp0=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id C2535E21658; Wed, 26 Dec 2018 17:57:19 -0800 (PST)
Date:   Thu, 27 Dec 2018 10:57:19 +0900
From:   Simon Horman <horms@verge.net.au>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/8] arm64: renesas: Sound update for ULCB/KF, etc
Message-ID: <20181227015719.ejhofugvez6dbam3@verge.net.au>
References: <87va3h9kzy.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87va3h9kzy.wl-kuninori.morimoto.gx@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 26, 2018 at 09:52:36AM +0900, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> ULCB-KF sound is using pcm3168, and it needed driver update
> to use it. Now, necessary patches are applied to linus branch.
> It includes renesas_defconfig,  and Ebisu update (which was already
> posted, but, not yet accepted), too.

Thanks Morimoto-san,

these look good to me but I would like to wait a little before applying
them to allow time for review by others.

> 
> 1) - 5) : For ULCB-KF update
> 6)      : For Ebisu
> 7) - 8) : For defconfig
> 
> Kuninori Morimoto (8):
>   1) arm64: renesas: ulcb: use audio-graph-card
>   2) arm64: renesas: ulcb: add HDMI sound support
>   3) arm64: renesas: ulcb-kf: add pcm3168 sound codec
>   4) arm64: renesas: r8a7795: remove BUSIF0 settings from rcar_sound,ssi
>   5) arm64: renesas: r8a7796: remove BUSIF0 settings from rcar_sound,ssi
>   6) arm64: renesas: r8a77990-ebisu: use simple-audio-card
>   7) arm64: defconfig: select Kingfisher Sound related configs
>   8) arm64: renesas_defconfig: select Kingfisher Sound related configs
> 
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi       |  40 ++++----
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi       |  40 ++++----
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |   5 +-
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi       | 132 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/ulcb.dtsi          |  66 +++++++++----
>  arch/arm64/configs/defconfig                   |   1 +
>  arch/arm64/configs/renesas_defconfig           |   2 +
>  7 files changed, 225 insertions(+), 61 deletions(-)
> 
> -- 
> 2.7.4
> 
