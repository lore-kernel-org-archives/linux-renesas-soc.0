Return-Path: <SRS0=/r1Q=SH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9DAC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 08:03:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD721217D4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 08:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="c5Oh6Mee"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbfDEIDs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 5 Apr 2019 04:03:48 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:52885 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfDEIDr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Apr 2019 04:03:47 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 669B725B808;
        Fri,  5 Apr 2019 19:03:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554451425; bh=39oN+S3qaeofkNvmwUFwF3V0CN+AIb13M+MXrLbBIAw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c5Oh6MeeQCSzouKlez5gdn9LwpCBBd4BLFlgjf7NdtOdVc2cl3Jrs/TgqwYRdDjyG
         pyUuDHrwnhwLiHX37HLfr+omDx1HkJV/OmD+602Uc8R062BrR+pT9LOuc6eMDDEs0K
         bwzjxc4T0APW3fEzbTWuyHOD6G9ThDvTyyMZJyXI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 671E89402FD; Fri,  5 Apr 2019 10:03:43 +0200 (CEST)
Date:   Fri, 5 Apr 2019 10:03:43 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     broonie@kernel.org, geert+renesas@glider.be,
        devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com,
        kuninori.morimoto.gx@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH 4/4] dt-bindings: timer: renesas, cmt: Document
 r8a779{5|65|90} CMT support
Message-ID: <20190405080343.74cclqyndkmrsrsg@verge.net.au>
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
 <1554443049-25127-5-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554443049-25127-5-git-send-email-cv-dong@jinso.co.jp>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 05, 2019 at 02:44:09PM +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car H3/M3-N/E3 SoCs.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Thanks,

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
