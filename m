Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE37C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 10:44:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3994B20854
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 10:44:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="oNVjT0qm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfCNKoB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 06:44:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49369 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbfCNKoB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 06:44:01 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 49EE325B7A1;
        Thu, 14 Mar 2019 21:43:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552560239; bh=CvT5gX054PNIKqr0W3ETTgefCURz9CuveoRL2StV/xw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oNVjT0qmKGwL2AAM+MJkgH6xnMcj/S4xiaz4tRm8lLRPkOK2k3E3tQClJmqrrv+P2
         DPVoWb838I9ZstZx1wyx6N/dIbzHnjE9SQSAhYHiwA4bP/QjuGriiF6BgqB1Wqjocj
         gOUD0EMxmPVsP5tiGMnWohXWc13e55BsR1hSWNlk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 393719403F2; Thu, 14 Mar 2019 11:43:57 +0100 (CET)
Date:   Thu, 14 Mar 2019 11:43:57 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a77990-ebisu: Add BD9571
 PMIC
Message-ID: <20190314104356.npvgpfmlch6tdlir@verge.net.au>
References: <20190313105816.8592-1-horms+renesas@verge.net.au>
 <20190313105816.8592-2-horms+renesas@verge.net.au>
 <CAMuHMdX_COrsrEJ8_dDuLK6yjhLjK7q2o0cz9c7zZsFXmhVa3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX_COrsrEJ8_dDuLK6yjhLjK7q2o0cz9c7zZsFXmhVa3Q@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 13, 2019 at 01:16:57PM +0100, Geert Uytterhoeven wrote:
> On Wed, Mar 13, 2019 at 11:59 AM Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch adds the regulator definition required for operation of
> > S2RAM.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.2.
