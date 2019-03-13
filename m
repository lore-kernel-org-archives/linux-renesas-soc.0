Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11288C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:29:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A01C0214AE
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:29:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="VmAGmh4E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfCMK3r (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 06:29:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34307 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfCMK3r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 06:29:47 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CA68B25BEF0;
        Wed, 13 Mar 2019 21:29:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552472985; bh=dLk+PHoJ6IucgXKFTs3SOYGgNgKcw1/JEppJ5uBG0DE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VmAGmh4EZr7qmDt3d+ecc08tBgZT4lLSoMJK9WuX2tixyC23KdyD38iNMVytssCTD
         ldNiyATr810eMYsYboxJy/5ORylv8+EMEbNKGATBavz3O/qjZbyz+QGlGeLvyC37N1
         zr/mFelA2c5UzbfLwJITiBG68iauJW9tJXZgiRiI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 15486940C8F; Wed, 13 Mar 2019 11:29:43 +0100 (CET)
Date:   Wed, 13 Mar 2019 11:29:43 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Enable CAN0, CAN1
Message-ID: <20190313102942.peakoouont4uwoyl@verge.net.au>
References: <20190309020642.15985-1-marek.vasut@gmail.com>
 <CAMuHMdU+Av1JfGNRdQRP=DzxiesNsqNp05taKwjUouOGW_mp3w@mail.gmail.com>
 <af0f7c0c-36f9-e350-077d-2c94764e4ae6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af0f7c0c-36f9-e350-077d-2c94764e4ae6@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 11, 2019 at 02:38:26PM +0100, Marek Vasut wrote:
> On 3/11/19 10:46 AM, Geert Uytterhoeven wrote:
> > Hi Marek,
> > 
> > On Sat, Mar 9, 2019 at 3:06 AM <marek.vasut@gmail.com> wrote:
> >> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>
> >> Enable both CAN0 and CAN1 controllers on R8A77995 Draak board,
> >> since they are available on connectors CN43, CN44 respectively.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > 
> > Thanks for your patch!
> > I assume you have tested this with your CAN-analyzer?
> 
> Nope, only remotely between two CAN ports thus far.

Thanks, applied for v5.2.
