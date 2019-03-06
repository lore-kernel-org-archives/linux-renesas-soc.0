Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FAAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 13:04:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A99E20684
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 13:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="FXxT/tV4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbfCFNEH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 08:04:07 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53524 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbfCFNEH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 08:04:07 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0647425B7D0;
        Thu,  7 Mar 2019 00:04:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551877445; bh=s/AUrax7eB8c8EDNZVQ9wSdhcQq2UIDj2X5JTOUMO4Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FXxT/tV4IfnzMipAD7yhPOBosqnLnlJKt9AIfUbrwdjZRoE4ZCDW2ojcCBE+jkhB5
         sjUXlGHKtY1gzquYuxrVTar6BFlWrEyREAU/UdA3Jl1i5RP1V5v6ul2KvF0T2Yq3MQ
         gg4niC3NUzu831WCJAdIn7lssIaFtefdbx78baA0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5BC8D94030D; Wed,  6 Mar 2019 14:04:03 +0100 (CET)
Date:   Wed, 6 Mar 2019 14:04:03 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 2/2] arm64: dts: r8a77990-ebisu: Enable VIN5
Message-ID: <20190306130402.ebq3u2xzauvivy22@verge.net.au>
References: <20190216235854.15244-1-niklas.soderlund+renesas@ragnatech.se>
 <20190216235854.15244-3-niklas.soderlund+renesas@ragnatech.se>
 <a74a18e5-b5ef-bf27-6fa7-bed6c09e15f2@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a74a18e5-b5ef-bf27-6fa7-bed6c09e15f2@ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Feb 17, 2019 at 10:05:45PM +0000, Kieran Bingham wrote:
> Hi Niklas, Takeshi,
> 
> On 16/02/2019 23:58, Niklas Söderlund wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > 
> > Both VIN4 and VIN5 are connected to CSI40 and can be configured at
> > runtime to use the single video source connected to CSI40. Enable VIN5
> > to allow it to be used in this fashion.
> > 
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [Niklas: rewrite commit message]
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks,

applied for v5.2 with subject updated to:

  arm64: dts: renesas: ebisu: Enable VIN5
