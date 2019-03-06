Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A57C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 13:13:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5F252064A
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 13:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="bLt22DxX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbfCFNNv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 08:13:51 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53678 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfCFNNv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 08:13:51 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 25A0A25B7D0;
        Thu,  7 Mar 2019 00:13:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551878029; bh=Iovi3/PwwhUPGPh1XmRckzx/kr1+7pYbt4vIBp8jWxY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bLt22DxXASLvApNffypaUpZe7K+EFrVJ0uX9/dypVzExtBHfyy9L4Pisr46/GP+dj
         XceskqoeoQkM+8DnVt0fytXgyBANnWrtD4o3FU4Qp07rZI2k7a6EpB2gbY+bDsJP0i
         k+JYR/3uujlCTnjb6zQN5KNFThLWvyaRSLzzEH4w=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3215894030D; Wed,  6 Mar 2019 14:13:47 +0100 (CET)
Date:   Wed, 6 Mar 2019 14:13:47 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Subject: Re: [PATCH 0/4] Add USB-HOST support to cat874
Message-ID: <20190306131346.shp4hzcelplfzeeb@verge.net.au>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 01, 2019 at 11:05:44AM +0000, Fabrizio Castro wrote:
> While trying to add USB-HOST support to the cat874 board,
> it came up that of_usb_get_dr_mode_by_phy was selecting
> the wrong DT node to use for dr_mode.
> Also, drivers/phy/renesas/phy-rcar-gen3-usb2.c was registering
> IRQs, no matter the dr_mode.
> 
> This series adds all that is required to add USB-HOST support
> to the cat874 board, and also removes the hsusb from Draak's DT
> as not necessary anymore.
> 
> Thanks,
> Fab
> 
> Fabrizio Castro (4):
>   usb: common: Consider only available nodes for dr_mode
>   phy: renesas: rcar-gen3-usb2: No need to request IRQ for non-OTG

Hi Fabrizio,

I am marking the patches below deferred pending acceptance of the patches
above.

>   arm64: dts: renesas: r8a774c0-cat874: Add USB-HOST support
>   arm64: dts: renesas: r8a77995: draak: Remove hsusb node
> 
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 15 ++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts  |  5 -----
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c        | 26 ++++++++++++-------------
>  drivers/usb/common/common.c                     |  2 ++
>  4 files changed, 30 insertions(+), 18 deletions(-)
> 
> -- 
> 2.7.4
> 
