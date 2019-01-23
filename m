Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F29C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:23:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6454C21019
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 10:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="WBszSWNw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfAWKXp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 05:23:45 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51241 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbfAWKXo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 05:23:44 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 76CAA25BE34;
        Wed, 23 Jan 2019 21:23:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548239022; bh=fu8CdkKt6ncYPf6Owsm69wKH8nGjf8aBcThInuGEtuo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WBszSWNwGcB6R3TjKZeGsvBlK9sFxcYK3BPbLgKmPSbX0aTFadrQjpcZa0dK4s/UU
         piIBIFS+NTnkb4TupkPpzHIIzSP55idj/PeKsMS3MxMznuzLmZWQHNQC5E1P82ZWgg
         raA3xL9jTDNR5icZVChVEkpKACGfIk8diJcL2wao=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id BB1EE940471; Wed, 23 Jan 2019 11:23:40 +0100 (CET)
Date:   Wed, 23 Jan 2019 11:23:40 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: rcar: comment maintenance
Message-ID: <20190123102340.nskxnzwnc2ok4xyj@verge.net.au>
References: <20190121170800.21144-1-wsa+renesas@sang-engineering.com>
 <20190121170800.21144-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190121170800.21144-2-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 21, 2019 at 06:07:59PM +0100, Wolfram Sang wrote:
> Update copyright years and remove a comment which grew incorrect and
> useless over time.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

