Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE71C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 08:36:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7134C2084D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 08:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="q62qYOCP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731840AbeLQIgr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 03:36:47 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:37114 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731822AbeLQIgr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 03:36:47 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DA57825B7CF;
        Mon, 17 Dec 2018 19:36:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545035805; bh=t7G4wx0VP1azrvPhyuUCYC7/nszmJIXCuH2rnTKM2TM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q62qYOCPVWmmfUP6/dRjxDLZKn90PXPb7uslxT+fq+6GfexOF7aA2mcxkxQ6kSpFp
         fBI0RTcdSTC4tpH6S8G+u9DCk0C230bmE7oLJAnUdbDiE3FG/1SRHEc5KFfIcABtMz
         E+6wqDcKgbtR2c6oAIv1QmX1JT05jnr92QBeyZWA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7D1E19402FB; Mon, 17 Dec 2018 09:36:42 +0100 (CET)
Date:   Mon, 17 Dec 2018 09:36:42 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/3] arm64: defconfig: Enable scu-simple-card driver
Message-ID: <20181217083642.6s34yp6dh6k56iie@verge.net.au>
References: <20181214115650.12443-2-horms+renesas@verge.net.au>
 <874lbdj97x.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874lbdj97x.wl-kuninori.morimoto.gx@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 09:29:25AM +0900, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> > Enable the scu-simple-card which is used by
> > the R-Car E3 (r8a77990) based Ebisu board.
> > 
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index f88190463481..b521159f5f33 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -491,6 +491,7 @@ CONFIG_SND_SOC_RT5514=m
> >  CONFIG_SND_SOC_RT5514_SPI=m
> >  CONFIG_SND_SOC_RT5645=m
> >  CONFIG_SND_SIMPLE_CARD=m
> > +CONFIG_SND_SIMPLE_SCU_CARD=m
> >  CONFIG_SND_AUDIO_GRAPH_CARD=m
> >  CONFIG_I2C_HID=m
> >  CONFIG_USB=y
> 
> Is Ebisu board using SIMPLE_SCU_CARD ?
> I guess it is SIMPLE or AUDIO_GRAPH CARD, not SCU_CARD.
> 

Hi Morimoto-san,

Using renesas_defconfig as a base I find that without enabling
CONFIG_SND_SIMPLE_SCU_CARD the following are enabled:

   CONFIG_SND_AUDIO_GRAPH_CARD
   CONFIG_SND_SIMPLE_CARD

But I see:

[   12.209793] ALSA device list:
[   12.212799]   No soundcards found.

With CONFIG_SND_SIMPLE_SCU_CARD also enabled (in the defconfig) I see:

[   14.087191] ALSA device list:
[   14.090195]   #0: rsnd-ak4613



The above tested using renesas-drivers-2018-12-04-v4.20-rc5
