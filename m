Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3355C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8CE420874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="W442v1Mz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbeLQMtk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 07:49:40 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39977 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbeLQMtk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 07:49:40 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4C64B25B781;
        Mon, 17 Dec 2018 23:49:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545050977; bh=nSDLUVjN7fL8DOWA58mq3kxyOO42YOa5vrJZD2nMXUg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W442v1MzF/WXu4zVA8CsYsv2xZcEq6A86MB5OdKyXae1dGKJui6D6ebwFMKMd9rU7
         /GknooTuR4mKSdd3vKx3in2x+RbVqYxu3gfRGEtzs1paIRsax0iVBLeYdbNEzepQSH
         9JSo3+ES6M+qY0DlaX8uU0Y3ByruUGlbgd7YVqLc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B539594048A; Mon, 17 Dec 2018 13:49:35 +0100 (CET)
Date:   Mon, 17 Dec 2018 13:49:35 +0100
From:   Simon Horman <horms@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] ARM: shmobile: Add missing dts files to MAINTAINERS
Message-ID: <20181217124935.m6nzgznb72eejx44@verge.net.au>
References: <20181212105435.28310-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181212105435.28310-1-horms+renesas@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 12, 2018 at 11:54:35AM +0100, Simon Horman wrote:
> Add some more patterns to the ARM/SHMOBILE ARM ARCHITECTURE
> section of MAINTAINERS to complete the list of maintained dts files.
> 
> As of writing dts files covered are:
> * arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi
> * arch/arm/boot/dts/iwg20d-q7-common.dtsi
> * arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

I would value a review of this.

> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
>  Based on renesas-devel-20181210-v4.20-rc6
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0c7a08740cb7..2d4b90ffb14f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2075,6 +2075,8 @@ Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
>  S:	Supported
>  F:	arch/arm/boot/dts/emev2*
> +F:	arch/arm/boot/dts/gr-peach*
> +F:	arch/arm/boot/dts/iwg20d-q7*
>  F:	arch/arm/boot/dts/r7s*
>  F:	arch/arm/boot/dts/r8a*
>  F:	arch/arm/boot/dts/r9a*
> -- 
> 2.11.0
> 
