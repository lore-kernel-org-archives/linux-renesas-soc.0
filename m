Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B114C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 23:43:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCCE121903
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 23:43:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="o4FtxOn6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728996AbeLTXme (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 18:42:34 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:41638 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729693AbeLTXme (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 18:42:34 -0500
Received: from penelope.horms.nl (g1-27-253-251-228.bmobile.ne.jp [27.253.251.228])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 86B3425BDFF;
        Fri, 21 Dec 2018 10:42:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545349351; bh=gPwBba0El8wczk78M1r1X612fsNe3RY+zKcDDQtWHEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o4FtxOn6UYzIII2HBYs2cV9xSf/nCM8UEH27Guu5HQQh63L4YsJ/9QCWy77HYZFnQ
         NEMHA8FualF1lDd8Lhk+aCPgebQzFT4rboYyVqrQPOsFUQLze3cJh4exI2zGqiUBqq
         pU9VqZqwYWpz3SjYz7XlRlbBr0duYONSE2mG/yN0=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 7B8CAE21792; Thu, 20 Dec 2018 15:42:29 -0800 (PST)
Date:   Fri, 21 Dec 2018 08:42:29 +0900
From:   Simon Horman <horms@verge.net.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL v2 0/3] Renesas ARM64 Based SoC Defconfig Updates for
 v4.21
Message-ID: <20181220234225.iaodzrfok4d2ifl4@verge.net.au>
References: <20181214115647.12391-1-horms+renesas@verge.net.au>
 <20181218094407.hfe7aei2hmnsih5u@verge.net.au>
 <CAK8P3a36OO+qM6r0BnrjWEWU6SV4SXu63Y=3Pq0FNt=56mzJXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a36OO+qM6r0BnrjWEWU6SV4SXu63Y=3Pq0FNt=56mzJXg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 20, 2018 at 05:38:45PM +0100, Arnd Bergmann wrote:
> > > ----------------------------------------------------------------
> > > Renesas ARM64 Based SoC Defconfig Updates for v4.21 (v2)
> > >
> > > * Enable in arm64 defconfig:
> > >   - Renesas R-Car Gen3 PCIe PHY driver
> > >   - Renesas R-Car thermal driver
> > >   - ASoC simple SCU sound card support
> >
> > It seems that Morimoto-san has determined that the sound card patch is not
> > necessary. Rather than move to v3 for these not entirely critical changes I
> > would prefer to withdraw this pull request and revisit these changes for
> > v4.22 although if you do happen to pull this then I don't think any harm
> > would be done.
> >
> > I apologise for any inconvenience this may cause.
> 
> No worries, I just dropped the pull request from my todo list for 4.21 now.

Great, thanks Arnd.
