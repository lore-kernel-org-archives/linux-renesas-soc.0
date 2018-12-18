Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F661C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 10:26:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1C2E217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 10:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="i/rvuaN/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbeLRK0k (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 05:26:40 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53747 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbeLRK0k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 05:26:40 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0330C25B75B;
        Tue, 18 Dec 2018 21:26:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545128798; bh=bbANW7JyKmP1/YVNRso4YRKmX2WEfz5gN5cGYLHyLQ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i/rvuaN/zZArypSut2n2g6nA7jlSwC8avWznpTyyjwy/cpoJMvIyEtVi5gpqN060b
         B6JTYf5Qk2tc0vJeTeKQvmt12k1igJn9YCGT1wgC/1xIrAE0BgREwZIkDBYlN2cPiz
         vs+zLdSeAToa+E2r2jXVM/oJPzKJf+5TCcCUlLtY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 50FF4940274; Tue, 18 Dec 2018 11:26:36 +0100 (CET)
Date:   Tue, 18 Dec 2018 11:26:36 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Set better
 backlight levels
Message-ID: <20181218102636.z4jlii6ntvba4wd6@verge.net.au>
References: <20181216113217.11379-1-laurent.pinchart+renesas@ideasonboard.com>
 <1685843510.493842.1545121353460@webmail.strato.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1685843510.493842.1545121353460@webmail.strato.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 18, 2018 at 09:22:33AM +0100, Ulrich Hecht wrote:
> 
> > On December 16, 2018 at 12:32 PM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > 
> > 
> > The backlight levels provided in the Draak DT produce a perceived
> > brightness very biased towards high brightness. Use better brightness
> > levels based on the CIE 1931 formula.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks, applied for v4.22.
