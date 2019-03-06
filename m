Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA2BC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 13:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64CF920684
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 13:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="I9nmSD+y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbfCFNEk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 08:04:40 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53539 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726226AbfCFNEk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 08:04:40 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A5FAD25B7D0;
        Thu,  7 Mar 2019 00:04:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551877477; bh=JFuTA0IENjdqE9VbGRhNEXnPVRLvU0MENnbTG+NtMkM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I9nmSD+y7411PxU+ELD/qsMMaVEBxxcvBR/UBSJSSfpe+MSrQQ0YF6AIVa7Vsjanh
         mzpl4yBGcUOvijIiyaMnugsrpf9z5ciRehyfBO0Dzt0bu/k72x3hi3JrKlCd/33FPk
         RiZUii91w1YRZ5T2c2dN1v5++psgJuiGqLViv/gQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0533194030D; Wed,  6 Mar 2019 14:04:35 +0100 (CET)
Date:   Wed, 6 Mar 2019 14:04:35 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a77990-ebisu: Fix adv7482 hexadecimal
 register address
Message-ID: <20190306130435.7bfqt5r7etshljxw@verge.net.au>
References: <20190216235854.15244-1-niklas.soderlund+renesas@ragnatech.se>
 <20190216235854.15244-2-niklas.soderlund+renesas@ragnatech.se>
 <959b482d-09a1-2ffc-1144-101348bb27d9@ideasonboard.com>
 <CAMuHMdXgPYkCi+pK9FsfsCuWtAL1Ly7d=Ty88+qGH7m7L67aOA@mail.gmail.com>
 <59664792-ce36-d068-077f-e6cd12dc549b@ideasonboard.com>
 <20190225100954.jvwbty52lgpcovrx@verge.net.au>
 <20190306114736.GA2750@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190306114736.GA2750@bigcity.dyn.berto.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 06, 2019 at 12:47:36PM +0100, Niklas Söderlund wrote:
> Hi Simon,
> 
> On 2019-02-25 11:09:54 +0100, Simon Horman wrote:
> [snip]
> > Thanks, applied with the subject prefix updated to
> > 
> > "arm64: dts: renesas: ebisu:"
> 
> You took patch 1/2 from this series but not 2/2. Was that intentional?

Thanks, that was an oversight. I now have 2/2 too.
