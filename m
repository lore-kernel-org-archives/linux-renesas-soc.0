Return-Path: <SRS0=Vdsz=QV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB7BC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 12:46:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB96F218FF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 12:46:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="cc3Zrg3u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390997AbfBNMqx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Feb 2019 07:46:53 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59050 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbfBNMqx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Feb 2019 07:46:53 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D215C25B763;
        Thu, 14 Feb 2019 23:46:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1550148411; bh=Wy3pT/m0aVH991LnSaU3a5tZQDDIeLAU/t/Xrg6VrRo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cc3Zrg3uNHLyv8gT+ZGIbcW2voEFx7ivyoWp3dW4Fanq2vzUAyDrm9IPqo+z6An+h
         /OMse3dyHYGcQrhwZWWnTUkrZwHj2qal7Da4c685lYg6CfjnRzW6xpN8m8z26chwE3
         yf8ItcVMgxpdLxTkIChzq+vKWkY4uT6yLIseMIX8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 49A789444E1; Thu, 14 Feb 2019 13:46:49 +0100 (CET)
Date:   Thu, 14 Feb 2019 13:46:49 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Change HW adjustment register
 according to speed mode
Message-ID: <20190214124648.qkr7p5qss4kdzigh@verge.net.au>
References: <20190208193002.16915-1-wsa+renesas@sang-engineering.com>
 <20190210133926.GD31044@bigcity.dyn.berto.se>
 <d6d064f2-fa58-d31e-83b8-1cc3ffbc7dee@gmail.com>
 <20190213092210.GG31044@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190213092210.GG31044@bigcity.dyn.berto.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 13, 2019 at 10:22:10AM +0100, Niklas Söderlund wrote:
> Hi Marek,
> 
> On 2019-02-10 17:39:34 +0100, Marek Vasut wrote:
> > On 2/10/19 2:39 PM, Niklas Söderlund wrote:
> > > Hi Wolfram,
> > 
> > Hi,
> > 
> > > Thanks for your patch.
> > > 
> > > On 2019-02-08 20:30:02 +0100, Wolfram Sang wrote:
> > >> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
> > >>
> > >> SCC is used for SDR104/HS200/HS400. We need to change SCC_DT2FF
> > >> according to the mode. If it is inappropriate, CRC error tends to occur.
> > >>
> > >> This adds variable "tap_hs400" for HS400 mode and configures SCC_DT2FF
> > >> as needed.
> > >>
> > >> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> > >> [wsa: rebased to upstream and updated commit message]
> > >> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > 
> > > I think this looks good.
> > > 
> > > Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > Can you test this on E3 Ebisu (do you have a board) ?
> 
> I do not have a E3 so I'm afraid I can not provide a tested by tag for 
> that board.

I am happy to test. Is anything specific required?
