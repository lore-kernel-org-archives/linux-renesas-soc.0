Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABAFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 09:02:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFB3E206DD
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 09:02:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="XS/aLoyf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733007AbfCAJCs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 04:02:48 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59629 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731675AbfCAJCs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 04:02:48 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0D94125B73F;
        Fri,  1 Mar 2019 20:02:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551430966; bh=chWR74qWW3qXfnlWmUgwB0blsaJEntLWH0UkhfWAqTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XS/aLoyfQcI41ubsiCW0CxyoB9ne3tWy32QC3YTwglnjAAgEiDkx6eD+qeMS99lBf
         5Fz25sTyg6cENCwyeVMrQ4Mpd4y4I02Qy/g8svm29HikUbsYoWjfpp6TzBybA82e2i
         4s8Wqb5q07LULRN4JFIBARGQwfD3Qr2vco+NL0As=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 274CA940421; Fri,  1 Mar 2019 10:02:44 +0100 (CET)
Date:   Fri, 1 Mar 2019 10:02:44 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] soc: renesas: Identify R-Car M3-W ES1.3
Message-ID: <20190301090243.d2qrzn65uup4cwj5@verge.net.au>
References: <20190228110048.1491-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190228110048.1491-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 28, 2019 at 12:00:48PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> The Product Register of R-Car M3-W ES1.3 incorrectly identifies the SoC
> revision as ES2.1. Add a workaround to fix this.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert,

applied for v5.2.
