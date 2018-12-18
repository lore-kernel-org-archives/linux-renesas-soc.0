Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7AEC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 11:07:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3DE52086C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 11:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="bLHp/aa5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbeLRLHX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 06:07:23 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:54361 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbeLRLHX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 06:07:23 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F2C6025B772;
        Tue, 18 Dec 2018 22:07:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545131241; bh=zlDSTVPK9Y8wqW6q+XalCzhu/4/T50Qi2FPIYlABJH8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bLHp/aa5rm9SM6uuXnEXum04XcUh7jhjbL0pyYh5K35p0QXQ8GnC6XYdqK6ksr8tV
         8+P33Ld/EyQ2h1XSdTjMQNtciIOno4BhPDvGtkJb6MqqmWIv2quFtxZtZuQT7U8UJq
         Hpzh9j8pKHxRIcwOuI/jk5e/iGqtbDebMa00xWGU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 496AC940274; Tue, 18 Dec 2018 12:07:19 +0100 (CET)
Date:   Tue, 18 Dec 2018 12:07:19 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: defconfig: Enable scu-simple-card driver
Message-ID: <20181218110718.zl6apx5quvzn7hlm@verge.net.au>
References: <20181214115650.12443-2-horms+renesas@verge.net.au>
 <874lbdj97x.wl-kuninori.morimoto.gx@renesas.com>
 <20181217083642.6s34yp6dh6k56iie@verge.net.au>
 <871s6gk0mr.wl-kuninori.morimoto.gx@renesas.com>
 <20181217092138.g5kwssfxabiw7g7f@verge.net.au>
 <87efaf3gyi.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87efaf3gyi.wl-kuninori.morimoto.gx@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 18, 2018 at 08:01:13AM +0900, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> > > Thanks.
> > > 56629fcba94c698d8c5be3413981506479566869
> > > ("arm64: dts: renesas: ebisu: Enable Audio")
> > > is using "simple-scu-audio-card", but it should be "simple-audio-card".
> > > Can you add and test this patch ?
> > > CONFIG_SND_SIMPLE_SCU_CARD is no longer needed, I think.
> > 
> > 
> > Thanks Morimoto-san,
> > 
> > I confirm that Sound on Ebisu-4D appears to work with a)
> > CONFIG_SND_SIMPLE_SCU_CARD disabled and b) the following patch applied.
> 
> Thank you for your test.
> OK, I will post patch for Ebisu.

Thanks!
