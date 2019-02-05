Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AECC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 14:31:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E488E20663
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 14:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Ae8MImFn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbfBEObr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 09:31:47 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51480 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfBEObr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 09:31:47 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3B5CC25B7E9;
        Wed,  6 Feb 2019 01:31:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549377105; bh=9KWlSVI5/GYyNgB2k5jyZ7T2wXO1ST+RtxD1I9XBpG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ae8MImFnEIv3bSiiFBLHAuJU4/bvQku3jttsOZUCVirimYs4aSKWPi2OiPwJ0y0q2
         AZIIOEp87nxsJakvhyRF7ka0F0ahUsBHd3Kbaw+P1xHPnP3p61IHckGyjO67CQZ/ev
         53bY7+QWw7DaLBXdp/uM+85Lgh4b7s2Lzg9n/6wA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 59852940486; Tue,  5 Feb 2019 15:31:43 +0100 (CET)
Date:   Tue, 5 Feb 2019 15:31:43 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/2] i2c: sh_mobile: sort compatible entries
Message-ID: <20190205143143.4xzavimrflj3uc2x@verge.net.au>
References: <20190204220010.5671-1-wsa+renesas@sang-engineering.com>
 <20190204220010.5671-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190204220010.5671-2-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 04, 2019 at 11:00:09PM +0100, Wolfram Sang wrote:
> Makes it easier to add new ones.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

