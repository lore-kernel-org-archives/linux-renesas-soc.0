Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03197C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 09:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6CB0214DA
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 09:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="QfEVm7mt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbfAJJj7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 04:39:59 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:35901 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbfAJJj7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 04:39:59 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 84EB825B78D;
        Thu, 10 Jan 2019 20:39:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547113196; bh=y/YhdZ+nSfwqDplaINOXKyXDNVWTpgghSKLZaYC/1b0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QfEVm7mtd8nlqZGxDE8xl0dTQRQ/44VhjfTHosbQUzJzYbuZobZxVdd4cjYC47Ag/
         EMluvkd0LpNUJz7nJyXQjKlqr4KRmSN6nkSDxLYo6aXBeeDyXzCRS3Jzj5fuJQLIqb
         tq4TX1Wt96RcLyzGb/jHWAyXCxT3zh5nRX9n5Vr0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A719F940462; Thu, 10 Jan 2019 10:39:54 +0100 (CET)
Date:   Thu, 10 Jan 2019 10:39:54 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: dts: renesas: v3msk: specify EtherAVB PHY IRQ
Message-ID: <20190110093953.o43ilpmuppnjzpp5@verge.net.au>
References: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com>
 <f9c6b067-80ba-c3c6-abcb-57d9524972fc@cogentembedded.com>
 <CAMuHMdWV92SY2VOXBObr56nf=kA4C4G1jn1QQK7UizcF02v9ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWV92SY2VOXBObr56nf=kA4C4G1jn1QQK7UizcF02v9ig@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 09, 2019 at 09:29:12AM +0100, Geert Uytterhoeven wrote:
> On Tue, Jan 8, 2019 at 8:57 PM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Specify EtherAVB PHY IRQ in the V3M Starter Kit board's device tree, now
> > that we have the GPIO support (previously phylib had to resort to polling).
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.1
