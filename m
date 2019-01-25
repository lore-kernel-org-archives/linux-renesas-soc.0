Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1028C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 10:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 853172184B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 10:24:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="M+cmIuST"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbfAYKYR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 05:24:17 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53998 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfAYKYR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 05:24:17 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id ACB9525BE52;
        Fri, 25 Jan 2019 21:24:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548411854; bh=0ML7GAEDZnSXkcFpoxBnZXDWBjjUtMi2gPT4tHSBmhk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M+cmIuST1J4CfxXYp+nktwtvUjUyuf+bH3t4VQfY9R2mD8MleNtJH1KkISZejliJA
         V34Qv5gX786POED2V+VvlDuBrpQiPyzZ5RXOh9WzpKGwuWoNw+RbKgrFhEfjpCqSB5
         ARGW8gCF1vv21+V2KxPFIBXlkdwNCAsT/mBwdkLw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F259A94048D; Fri, 25 Jan 2019 11:24:12 +0100 (CET)
Date:   Fri, 25 Jan 2019 11:24:12 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: arm: renesas: Document RZ/A2M EVB
Message-ID: <20190125102412.dt4p6iowvsad6ok6@verge.net.au>
References: <20190123143012.119912-1-chris.brandt@renesas.com>
 <CAL_JsqLQGptKCan7GoNGFfJORyECuF2BxXzJWOe2VSdgUzjYWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLQGptKCan7GoNGFfJORyECuF2BxXzJWOe2VSdgUzjYWw@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 24, 2019 at 07:41:50AM -0600, Rob Herring wrote:
> On Wed, Jan 23, 2019 at 8:30 AM Chris Brandt <chris.brandt@renesas.com> wrote:
> >
> > Add the RZ/A2M Evaluation board.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > ---
> > v2:
> >  * 'enum' is supposed to go under 'items'
> > ---
> >  Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, applied for v5.1.
