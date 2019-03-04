Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00B7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:48:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 870F020836
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 09:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="mTRFFU3k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbfCDJs1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 04:48:27 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38680 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfCDJs1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 04:48:27 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6DD2925B74E;
        Mon,  4 Mar 2019 20:48:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551692904; bh=xkt/K2vjJ4tPPyY7lvEc6PYKObbA/TypOODsYweoZj0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mTRFFU3kvqf2t2RxN8KZk1TzYkVknz4WRN/bNnJjeuZkyabflzG/Xq7G3RTRH4FcH
         MAYuQWLPvKiAXxrquQCRBlHfbTdbFyN30aDFvAyWyAAQacPQfUQNqE/D73RTfUkBbr
         prynC94VFu9qmkt6itt+z2PU5hb+UyNd6zyU+YV0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A870A94030D; Mon,  4 Mar 2019 10:48:22 +0100 (CET)
Date:   Mon, 4 Mar 2019 10:48:22 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Subject: Re: [PATCH] arm64: dts: renesas: cat875: Add CAN support
Message-ID: <20190304094822.y7isiwgbaaeja3gs@verge.net.au>
References: <1551438157-21916-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUxQKhXuQqfqbkQ+uZtH3nV5kU9jba+TC16YQAYZH9STA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUxQKhXuQqfqbkQ+uZtH3nV5kU9jba+TC16YQAYZH9STA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 01, 2019 at 02:10:03PM +0100, Geert Uytterhoeven wrote:
> On Fri, Mar 1, 2019 at 12:03 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > Add CAN support to the CAT875 sub board.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.2.
