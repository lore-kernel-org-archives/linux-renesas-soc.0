Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D314CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 10:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A09F8217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 10:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="F1JSI5J1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbeLRKZp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 05:25:45 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53733 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbeLRKZp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 05:25:45 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9879325B75B;
        Tue, 18 Dec 2018 21:25:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545128742; bh=zMpwTMtz3QsngXQy5U06a4+EkvwGuERn01mMrUdk5Jw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F1JSI5J1XAwD6x9MoJawndS6hUDS6pCqXAC62n/9rRUyBJN2gbkDlNVuwG33wsNOg
         OodenO8JKpV74dBis2TKaAWVzB/8yjJipxw36qlpjZ380WcvvXwzSHJpJqoYy6SBKb
         bx+uw1aPYumvQbNE03mBD+iXbjB9RqRTvwc/27h8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D256A940274; Tue, 18 Dec 2018 11:25:40 +0100 (CET)
Date:   Tue, 18 Dec 2018 11:25:40 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add backlight
Message-ID: <20181218102540.kkubksriie6egg7x@verge.net.au>
References: <20181216114744.15263-1-laurent.pinchart+renesas@ideasonboard.com>
 <1270954212.494013.1545121503401@webmail.strato.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1270954212.494013.1545121503401@webmail.strato.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 18, 2018 at 09:25:03AM +0100, Ulrich Hecht wrote:
> 
> > On December 16, 2018 at 12:47 PM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > 
> > 
> > Add the backlight device for the LVDS1 output, in preparation for panel
> > support.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks, applied for v4.22.
