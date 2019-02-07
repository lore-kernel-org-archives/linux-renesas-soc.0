Return-Path: <SRS0=J+Ha=QO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE947C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:14:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B3EC2084D
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="gG+f1D9L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfBGKOX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Feb 2019 05:14:23 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53408 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfBGKOX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Feb 2019 05:14:23 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 458DE25B7E2;
        Thu,  7 Feb 2019 21:14:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549534461; bh=k33+CAoO1CbSqDJlZSjCORBUBfJcxNRD6lR/ANC+d0U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gG+f1D9LsMGYnw5bPCp6LhCR2qiJxvwCQbzDPYRgM2jjkluwQDyMWno/ciy6hbbcC
         hIdvBQ7zHTDtXgc9T06SUe4QPWEgH2+pi60kbfFnfNynEoZbzndNAYBhwcbjGksHHG
         VmgJ7AzxZ1dspKtIpZDPQ/T46+QaY4jUsvlHSU04=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 39EA29444CC; Thu,  7 Feb 2019 11:14:19 +0100 (CET)
Date:   Thu, 7 Feb 2019 11:14:19 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH LOCAL] arm64: dts: renesas: r8a774a1: Add required model
 to dummy board DTS
Message-ID: <20190207101415.llxazy3wi36yjgov@verge.net.au>
References: <20190207091047.22046-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190207091047.22046-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 07, 2019 at 10:10:47AM +0100, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm64/boot/dts/renesas/r8a774a1-dummy.dt.yaml: 'model' is a required property
> 
> Fixes: caf23540a44f1036 ("arm64: dts: renesas: r8a774a1: Add dummy board DTS")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied to topic/arm64-dummy-boards which is included in devel
branch of the renesas tree but is not included not the next branch of the
renesas tree nor targeted at linux-next.
