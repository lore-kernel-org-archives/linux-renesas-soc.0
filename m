Return-Path: <SRS0=lsYt=RZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936D2C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 10:15:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 601DA21916
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 10:15:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="rK7N/30m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbfCVKPz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Mar 2019 06:15:55 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55653 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbfCVKPy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Mar 2019 06:15:54 -0400
Received: from penelope.horms.nl (unknown [195.39.71.253])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4E5F525B79A;
        Fri, 22 Mar 2019 21:15:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553249752; bh=P1Bybajy2dPlDnHQ9n0lBChK6U53+yatKCLen1HdChM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rK7N/30mbNPi/+8lPwt1hVX0e2OqlXKyS+YeSs1l3klMefexK38EjTsubSq6J0/8y
         Q6iVEpwfOV6PdmPqiOeWeu3f+uvFtbgDauW6PUOtssqFy4wIQt7z2ha3Aihn6ygZ18
         25OeYQ5ZwtxGgr2be10nKZWZsWTRw84uDcecS3OM=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 6B543E21330; Fri, 22 Mar 2019 11:15:50 +0100 (CET)
Date:   Fri, 22 Mar 2019 11:15:50 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: ape6evm: Add NOR FLASH
Message-ID: <20190322101550.oh5nz5i6riglinbm@verge.net.au>
References: <20190320194522.15053-1-geert+renesas@glider.be>
 <20190321163737.GD25993@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190321163737.GD25993@bigcity.dyn.berto.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 21, 2019 at 05:37:38PM +0100, Niklas Söderlund wrote:
> Hi Geert,
> 
> Thanks for your work, you are a life saver :-)
> 
> On 2019-03-20 20:45:22 +0100, Geert Uytterhoeven wrote:
> > Describe the 128 MiB CFI NOR FLASH, which contains the boot loader and
> > its environment.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks, applied for v5.2.
