Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72756C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:36:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39C4C21473
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:36:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="nAxFz+eQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbfDCJgh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 05:36:37 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36067 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbfDCJgg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 05:36:36 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 99E7925AD6C;
        Wed,  3 Apr 2019 20:36:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554284194; bh=5wpveDiseLvtPDvsBNnMUO8ef6vFv2Lg5JJ0go4v1eY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nAxFz+eQ/tGqBMA1c5lUYgsycQfSk6C7rDxrW/KDmIrffZ2kftDOb7XpkplkjI3ls
         aq+WKRSR8m8DxpTzVjtVuIcgsYvCLBo+hb0nLhJqVPDORuBtpY61wIeMeShmlQgKUj
         U2cLn2+E79gNmoC1+nn7JMhAdRHeTlsnwtzIFjNE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id AD7BD940361; Wed,  3 Apr 2019 11:36:32 +0200 (CEST)
Date:   Wed, 3 Apr 2019 11:36:32 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: shmobile: defconfig: Enable support for CFI NOR
 FLASH
Message-ID: <20190403093632.evr6hd7x7gxwyjie@verge.net.au>
References: <20190401120150.30687-1-geert+renesas@glider.be>
 <20190402124927.GX23466@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190402124927.GX23466@bigcity.dyn.berto.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 02, 2019 at 02:49:27PM +0200, Niklas Söderlund wrote:
> Hi Geert,
> 
> Thanks for your work.
> 
> On 2019-04-01 14:01:48 +0200, Geert Uytterhoeven wrote:
> > 	Hi Simon, Magnus,
> > 
> > Now the DTS for the r8a73a4-based APE6EVM development board describes
> > its CFI NOR FLASH, this patch series enables support for that in
> > shmobile_defconfig and multi_v7_defconfig.
> > 
> > Note that kernels built from these configs cannot be booted by stock
> > APE6EVM U-Boot, due to kernel size.
> 
> For the whole series,
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

Thanks, applied for v5.2.
