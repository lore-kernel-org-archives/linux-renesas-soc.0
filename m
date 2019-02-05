Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18884C282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 14:33:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D793920663
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 14:33:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="bKyzR6Pc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbfBEOdP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 09:33:15 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51492 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728791AbfBEOdP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 09:33:15 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 310C025B7E9;
        Wed,  6 Feb 2019 01:33:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549377193; bh=VmK2Oy3u2GiuXNJpMm/iRub/ywqkOiXzst1SH971W1Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bKyzR6PchZVyK+QlXBHY0wEoMq6yAAhwGQNiyTCwA0WJG0jGIZLp+69wAT/SQEcjT
         8ncz7LU3lYuUTQbqltMNcFIPS0IK0cdm5d7ylI6FPaGHVabwWhQp2IDfmFc7XauNjv
         P6OD4Nn0aooHHYVV64o5uxd2LgEJCneh5yu8FIzU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 57847940486; Tue,  5 Feb 2019 15:33:11 +0100 (CET)
Date:   Tue, 5 Feb 2019 15:33:11 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 2/2] i2c: sh_mobile: use new clock calculation formulas
 for Gen3
Message-ID: <20190205143311.p67aju4pou6xvriw@verge.net.au>
References: <20190204220010.5671-1-wsa+renesas@sang-engineering.com>
 <20190204220010.5671-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190204220010.5671-3-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 04, 2019 at 11:00:10PM +0100, Wolfram Sang wrote:
> We could finally measure the clock on an Ebisu board. The new formula
> gives way better results, i.e. 100kHz instead of 106kHz and 400kHz
> instead of 387kHz. Switch to these formulas for all Gen3 SoCs.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

