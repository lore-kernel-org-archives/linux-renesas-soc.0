Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802D2C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 13:53:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F78420870
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 13:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="oB8H9EG7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730004AbfAKNxZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 08:53:25 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33853 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729744AbfAKNxY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 08:53:24 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4D17025B819;
        Sat, 12 Jan 2019 00:53:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547214802; bh=fHhjj9NZ2i9x0EGnUIdrpq/qv3+3FJzSrHs9LF/apxk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oB8H9EG78HVp8evVFiYUaBNG1Wg++DAnYpJAa47YK0bqLZHGECGZoKy0TaYqe37sO
         mQtl/0v8mXCmhfv0l5cRSw6nPOaNSes16ti8aFDB3M5vLN6tiYqDgEyFKD3YHXVMOm
         f7uoKOSZA13C/yT16cq0qNk45UdmtMW/tOgPmPAI=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 46FB3E2182A; Fri, 11 Jan 2019 05:53:20 -0800 (PST)
Date:   Fri, 11 Jan 2019 14:53:20 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7778: Add HSCIF0/1 support
Message-ID: <20190111135319.mgixoxa5iigmx5x4@verge.net.au>
References: <20190110153232.21212-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190110153232.21212-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 10, 2019 at 04:32:32PM +0100, Geert Uytterhoeven wrote:
> From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> 
> Add HSCIF0/1 clocks and device nodes, based on Rev. 1.00 of the R-Car
> M1A datasheet.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> [geert: Squashed two patches]
> [geert: Correct HSCIF1 module clock index]
> [geert: Correct reg properties for non-LPAE]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

