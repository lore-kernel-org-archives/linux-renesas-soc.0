Return-Path: <SRS0=AhbF=PM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6EBC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 09:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE41C20656
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 09:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="KaM8/X87"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfADJHd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Jan 2019 04:07:33 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:49420 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfADJHd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jan 2019 04:07:33 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B80E425B747;
        Fri,  4 Jan 2019 20:07:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546592851; bh=Q2R36NRMXhvKi2hwmajHwh7DL8sC5/xamJ+r/PBkEYA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KaM8/X87oBbDDT9IScxeK5X3QYFCUSn9Fjx9EgZsvNff4sWkROe/QLok4vpGBfFcx
         ySlF9kLomM/hQ2VtdFmsPK69kir0ZVeAmI4d84A0rNFKcIAjoH6HB1HoIikLIWTUri
         RJWLVxJpQt071X3mAJNoMohCxnsj/L8pmmY5hnBk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CAEE4940376; Fri,  4 Jan 2019 10:07:28 +0100 (CET)
Date:   Fri, 4 Jan 2019 10:07:28 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Sort i2c nodes within soc
 node
Message-ID: <20190104090727.wwbdpddelgbe7jw2@verge.net.au>
References: <20190103145319.3764-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190103145319.3764-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 03, 2019 at 03:53:19PM +0100, Geert Uytterhoeven wrote:
> Move the i2c nodes so that sub-nodes of the soc node are sorted by bus
> address.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.22.
