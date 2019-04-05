Return-Path: <SRS0=/r1Q=SH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94043C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 08:17:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56D1921738
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 Apr 2019 08:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="lumQgLxr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730322AbfDEIRX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 5 Apr 2019 04:17:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:53238 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730103AbfDEIRW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Apr 2019 04:17:22 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1466525B823;
        Fri,  5 Apr 2019 19:17:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554452240; bh=5+fFmM4CSiwcntorJlnW2vAxuze9KHJcif87f4FULig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lumQgLxrDLQnBUKyV09ToQk1qKXk2RBak+oF8Y1RvQAlaXg1BZ29TtMVm8PHDVch+
         2M5BA+iLtBKVfluiNBkuCEux6RDgks0CqGybPbG+ozdss7YWQ6TdYcAMiTzNuTZufc
         jx+c4Be3B0J7q7miXoCk6ML3dkPvypu6CKs4TQyQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 918A09402FD; Fri,  5 Apr 2019 10:17:16 +0200 (CEST)
Date:   Fri, 5 Apr 2019 10:17:16 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     broonie@kernel.org, geert+renesas@glider.be,
        devicetree@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com,
        kuninori.morimoto.gx@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a7795: Add CMT device nodes
Message-ID: <20190405081716.s74zbrd47ychcevw@verge.net.au>
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp>
 <1554443049-25127-2-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554443049-25127-2-git-send-email-cv-dong@jinso.co.jp>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 05, 2019 at 02:44:06PM +0900, Cao Van Dong wrote:
> This patch adds CMT{0|1|2|3} device nodes for r8a7795 SoC.
> 
> Tested-by: Cao Van Dong <cv-dong@jinso.co.jp>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

I am, however, curious to know how you tested this.

Likewise for patches 2/4 and 3/4.
