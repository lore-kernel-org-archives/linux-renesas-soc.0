Return-Path: <SRS0=RWjW=PK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5696EC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 09:37:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28915206C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Jan 2019 09:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="sW9lozUF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfABJhw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Jan 2019 04:37:52 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33541 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbfABJhw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jan 2019 04:37:52 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A1BF325BE2C;
        Wed,  2 Jan 2019 20:37:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546421869; bh=TrhrLmJbP6yAkjTUBhIdQ8VmAkRxmb0Fp4HWbRJ6FYA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sW9lozUFcb4UkaEGC3fJ43uoVVstL60JgIdsdXcTBhO76ekwnPvb4SDOXigCTt3iu
         A7koLIdZCKmMPCGfQVMEft9IjjvDbmt3GN1nFcuucIMBI1oWZ8KP29u4u8Z9YWh5+R
         v9QGUD9PLc1ZisOr4AKsGBGm4jvhKjmT+n9QY8pw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CF2439402C1; Wed,  2 Jan 2019 10:37:47 +0100 (CET)
Date:   Wed, 2 Jan 2019 10:37:47 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: sort pciec0 node within
 soc node
Message-ID: <20190102093747.g527je362la27f5c@verge.net.au>
References: <20181217124053.10918-1-horms+renesas@verge.net.au>
 <CAMuHMdWc=0iafOE4FLVA58zcG3GjZ+e11vX7xwYjNAL45wx65w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWc=0iafOE4FLVA58zcG3GjZ+e11vX7xwYjNAL45wx65w@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 03:37:24PM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 17, 2018 at 1:41 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > Move the pciec0 node so that sub-nodes of the soc node are
> > sorted by bus address.
> >
> > This change has no run-time affect.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for the review, applied for v4.22.
