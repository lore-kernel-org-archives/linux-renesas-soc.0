Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D01C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 10:03:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D06E2084C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 10:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="o+ry4qjG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725287AbfAXKDH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 05:03:07 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:36084 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfAXKDH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 05:03:07 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3A59625B769;
        Thu, 24 Jan 2019 21:03:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548324185; bh=e+JZMM2DbKCoeVgwIttkJh1ldURFfLCYRpfn0B5D4EY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o+ry4qjGIhZ7a71G7otPgBCfR/nYa/QWE6mBbX479kgtqBW+i3oBVU6dJQ8Ls1RaV
         AVPdxz0/mpRytgoXnA1wVZULCfP7sknc4NBxvGu3xelVMjUOvw5gIqFTQcaXR7SJ4i
         le4LspbqIffj5C8a6/LCvwVVLyMkod7lXVV1a6LQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6A7F4940708; Thu, 24 Jan 2019 11:03:03 +0100 (CET)
Date:   Thu, 24 Jan 2019 11:03:03 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: renesas: Document RZ/A2M EVB
Message-ID: <20190124100302.kycgfbu4pgdo74ge@verge.net.au>
References: <20190123143012.119912-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190123143012.119912-1-chris.brandt@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 23, 2019 at 09:30:12AM -0500, Chris Brandt wrote:
> Add the RZ/A2M Evaluation board.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * 'enum' is supposed to go under 'items'

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index 5e9d4864a600..f2ef83d473d6 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -30,6 +30,8 @@ properties:
>  
>        - description: RZ/A2 (R7S9210)
>          items:
> +          - enum:
> +              - renesas,rza2mevb # RZ/A2M Eval Board (RTK7921053S00000BE)
>            - const: renesas,r7s9210
>  
>        - description: SH-Mobile AG5 (R8A73A00/SH73A0)
> -- 
> 2.16.1
> 
