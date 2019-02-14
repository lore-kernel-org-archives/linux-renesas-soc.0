Return-Path: <SRS0=Vdsz=QV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A840AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 12:54:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75EB02229F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 12:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Ys4SwICg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388534AbfBNMyN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Feb 2019 07:54:13 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59143 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438562AbfBNMyN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Feb 2019 07:54:13 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 75BCD25B80B;
        Thu, 14 Feb 2019 23:54:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1550148850; bh=VrO3enjk1VKBw1jDVwdPBKALcTFeQ/Tz7Z62ePXR4zE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ys4SwICgZO0Z4TZJdFtTEfWEY9IrQ/jFn8WKGR7YPvq2d5GkeJljgkGZSg4y/W7b+
         SfUPxGYglvRdNpD56/o+0SagAl8HEv9IHQBsMHrVS2V+345IUm8qHm3AyHgNpmWYE5
         XTHRrBLWhExc55ObC3frWgSWPqZIMcGtigwwY1ZU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id ED0559444E1; Thu, 14 Feb 2019 13:54:08 +0100 (CET)
Date:   Thu, 14 Feb 2019 13:54:08 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add GPIO expander
Message-ID: <20190214125408.wk5u7tlqswmuy25i@verge.net.au>
References: <20190212142000.4312-1-geert+renesas@glider.be>
 <20190213101126.GI31044@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190213101126.GI31044@bigcity.dyn.berto.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 13, 2019 at 11:11:26AM +0100, Niklas Söderlund wrote:
> Hi Geert,
> 
> Thanks for your patch.
> 
> On 2019-02-12 15:20:00 +0100, Geert Uytterhoeven wrote:
> > Describe the ON Semiconductor PCA9654 I/O expander on the first I2C
> > bus, which provides 8 extra GPIOs.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

Thanks, applied for v5.2.
