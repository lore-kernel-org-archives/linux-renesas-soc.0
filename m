Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B487C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:52:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB10D2084D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Bo3CR4kL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbfBYJwB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:52:01 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40983 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfBYJwB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 04:52:01 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 61DB225B784;
        Mon, 25 Feb 2019 20:51:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551088319; bh=EgQBJwKKiLV3hNcvTuP4qZi4DRGuH/HBmbWNdC9qU/I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bo3CR4kL+cY3RIvm/T07tCVYo/5tdEFHcI7HKkLAjzCOGpj3DiRLEnG1lBUETDjoj
         1ql/9N2UtmGeLkO/G4Ee7+uW3fdzA5IElQzXkXJjclwO2xShakBHMs2scXAIlRU2+7
         OuhUY5hi8Uhhk5LgZkiW3WgltspukuMEvOUw+0PY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8E6CB94056F; Mon, 25 Feb 2019 10:51:57 +0100 (CET)
Date:   Mon, 25 Feb 2019 10:51:57 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] mmc: tmio_mmc_core: don't claim spurious interrupts
Message-ID: <20190225095157.47f2oppaxnu3ug6v@verge.net.au>
References: <7e293159-0ae3-82fb-2723-04e91d652906@cogentembedded.com>
 <20190219170655.eqwyny3hdavm5hsm@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190219170655.eqwyny3hdavm5hsm@ninjato>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 19, 2019 at 06:06:55PM +0100, Wolfram Sang wrote:
> On Mon, Feb 18, 2019 at 08:45:40PM +0300, Sergei Shtylyov wrote:
> > I have encountered an interrupt storm during the eMMC chip probing (and
> > the chip finally didn't get detected).  It turned out that U-Boot left
> > the DMAC interrupts enabled while the Linux driver  didn't use those.
> > The SDHI driver's interrupt handler somehow assumes that, even if an
> > SDIO interrupt didn't happen, it should return IRQ_HANDLED.  I think
> > that if none of the enabled interrupts happened and got handled, we
> > should return IRQ_NONE -- that way the kernel IRQ code recoginizes
> > a spurious interrupt and masks it off pretty quickly...
> > 
> > Fixes: 7729c7a232a9 ("mmc: tmio: Provide separate interrupt handlers")
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Tested on a Lager board (R-Car H2, microSD card) -> no regressions
> Also, Salvator-XS (R-Car M3N, SDR50 SDIO WIFI card)
>   -> could still be detected
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

