Return-Path: <SRS0=nlYi=QS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB29C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 09:49:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83E37206B7
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 09:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="kgpo5xLa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfBKJtf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Feb 2019 04:49:35 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59574 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbfBKJte (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Feb 2019 04:49:34 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E3E5D25BE79;
        Mon, 11 Feb 2019 20:49:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549878573; bh=FdvD1a3plAOg0Gnv3jDZMJGnODnBVLLPb0XxfxGVMjA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kgpo5xLaOh4av7g+hFyTQLpGMUGZpgPjt0v3Aexp7juAwCBzm90sTyDLqd2jO0PcC
         gPzsjdB0tOWr+cFodTo/oSZwDUKgG5AroR2OZ0Ritpn2tLHxPFEtW4yIereeUBL55Z
         sOC9um50QvIoveiHzUURSSpNKDTbG7J5VDnD1ytM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 05341940362; Mon, 11 Feb 2019 10:49:30 +0100 (CET)
Date:   Mon, 11 Feb 2019 10:49:30 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 08/12] arm64: dts: renesas: r8a774c0: Add OPPs table for
 cpu devices
Message-ID: <20190211094927.5bs32a6q7ecvqq5t@verge.net.au>
References: <cover.1549623801.git.horms+renesas@verge.net.au>
 <231d8908a66fa98f09553d31ad8cd5f382b29959.1549623801.git.horms+renesas@verge.net.au>
 <7d60ebf5-c245-f48d-47db-ce63f4f3690b@cogentembedded.com>
 <TY1PR01MB1770FAE6E7C26615134B8E0AC0690@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770FAE6E7C26615134B8E0AC0690@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 08, 2019 at 03:26:49PM +0000, Fabrizio Castro wrote:
> Hello Sergei,
> 
> Thank you for your feedback!
> 
> > -----Original Message-----
> > From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > Sent: 08 February 2019 12:53
> > To: Simon Horman <horms+renesas@verge.net.au>; linux-renesas-soc@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org; Magnus Damm <magnus.damm@gmail.com>; Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com>
> > Subject: Re: [PATCH 08/12] arm64: dts: renesas: r8a774c0: Add OPPs table for cpu devices
> >
> > Hello!
> >
> > On 02/08/2019 02:13 PM, Simon Horman wrote:
> >
> > > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > This patch defines OOP tables for all CPUs, similarly to
> > > what done by Takeshi Kihara and Yoshihiro Kaneko for the
> > > R8A77990.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > [...]
> > > @@ -55,6 +76,8 @@
> > >  power-domains = <&sysc R8A774C0_PD_CA53_CPU0>;
> > >  next-level-cache = <&L2_CA53>;
> > >  enable-method = "psci";
> > > +clocks =<&cpg CPG_CORE R8A774C0_CLK_Z2>;
> >
> >    Need space after =...
> 
> Doh! Simon, do you want me to send another version to fix both spacing issues?

Likewise, sorry I didn't notice that earlier.

I'd rather not re-send this pull request just to resolve whitespace issues.
So please send an incremental patch for now.
