Return-Path: <SRS0=Vdsz=QV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22EFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 12:46:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 906FD218FF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 12:46:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="h2/bu+8C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394660AbfBNMqX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Feb 2019 07:46:23 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59034 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbfBNMqW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Feb 2019 07:46:22 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4CD6D25B763;
        Thu, 14 Feb 2019 23:46:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1550148380; bh=hD8UrMW7h41cb2nPxLQ1hfVPHDCDUOQ3y1h9xtOicD0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h2/bu+8CJUsBW3lzvUMd8JZnEaJvjUdZ0JsHhaYr4D1SnF3hoxubmEU/FtpEPmnU6
         os+HLqIodUFgm8xbegR1G04ru+ju9KZNt9/9G+IZGiyQgR0vKVMJ8BhnVh1fvB56BY
         Sc8uJYj0xdAoTov5c/9hYExnB3TBqsAkPXoe+UMk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4D0839444E1; Thu, 14 Feb 2019 13:46:18 +0100 (CET)
Date:   Thu, 14 Feb 2019 13:46:18 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] Add CMT/TMU support for RZ/G2E
Message-ID: <20190214124618.3oag77wu7ta7jrxz@verge.net.au>
References: <1549272007-33471-1-git-send-email-biju.das@bp.renesas.com>
 <86c16302-8f7e-52b6-d183-5a90c8a0fc85@linaro.org>
 <OSBPR01MB210392463D9EB86AE0BE8C36B8650@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <ea8a581f-56ce-bea0-86d6-7688741c3fca@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea8a581f-56ce-bea0-86d6-7688741c3fca@linaro.org>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 13, 2019 at 09:44:18AM +0100, Daniel Lezcano wrote:
> On 12/02/2019 11:17, Biju Das wrote:
> > Hi Daniel,
> > 
> > Thanks  for  the feedback.
> > 
> >> -----Original Message-----
> >> From: Daniel Lezcano <daniel.lezcano@linaro.org>
> >> Sent: 12 February 2019 10:03
> >> To: Biju Das <biju.das@bp.renesas.com>; Rob Herring
> >> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>
> >> Cc: Thomas Gleixner <tglx@linutronix.de>; devicetree@vger.kernel.org;
> >> Simon Horman <horms@verge.net.au>; Geert Uytterhoeven
> >> <geert+renesas@glider.be>; Chris Paterson
> >> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> >> <fabrizio.castro@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> >> Subject: Re: [PATCH v2 0/5] Add CMT/TMU support for RZ/G2E
> >>
> >> On 04/02/2019 10:20, Biju Das wrote:
> >>> This patch series aims to add CMT/TMU timer support for RZ/G2E SoC.
> >>>
> >>> This patch series is tested against renesas-dev and linux-next.
> >>
> >> Do you want me to take the patch 1/5 and 4/5 through my tree ?
> > 
> > Yes, please.
> > 
> 
> Both applied for 5.1.

Thanks, much appreciated.
