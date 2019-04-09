Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05BDC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 12:04:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC1DA20880
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 12:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="GLpWwU80"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbfDIMEJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 08:04:09 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42799 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfDIMEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 08:04:09 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7714425BE52;
        Tue,  9 Apr 2019 22:04:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554811446; bh=8Y5caF1/qf6Wc48bDq+LQALUpNPb1lkxd9CxdsiJxcU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GLpWwU80VjqIqgayLvdawEKtNOwCg/YjY3MdyL3Yc/vW+I4eP0KaiqsHKLh11+4i+
         CrQ1gIzwYxtHIvQYiEUTGdbIsdJDum4IDeYdo6O00+X3FQFzoRzAizxNBcdKN3CVqu
         d2FwvGLXdpdGIh5JknXLHHThoQ8dPSfq6QKFpcts=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B73249402E1; Tue,  9 Apr 2019 14:04:04 +0200 (CEST)
Date:   Tue, 9 Apr 2019 14:04:04 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, devicetree@vger.kernel.org,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH 05/11] ARM: dts: r8a77470: Add VIN support
Message-ID: <20190409120404.sni7ctkabxqm52tb@verge.net.au>
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
 <1554799912-24764-6-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554799912-24764-6-git-send-email-cv-dong@jinso.co.jp>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 09, 2019 at 05:51:46PM +0900, Cao Van Dong wrote:
> Add vin{0|1} nodes to dtsi for VIN support on the RZ/G1C (r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
