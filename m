Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FDEC48BE5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jun 2021 01:57:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45F6361245
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jun 2021 01:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhFQB7v (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jun 2021 21:59:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36978 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhFQB7v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 21:59:51 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06283E53;
        Thu, 17 Jun 2021 03:57:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623895063;
        bh=Z2N2k77gMr7nNxeA63YorzCdihQE805EO/4rjphda/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QhrGW8xJk6uG4Qp+7P1PILIBKn7UU21vAVLfq/RoU/V8qiVOAwSG3e0INOVv/nZKU
         fH4dIQCXPgRr2ZGxqzw43vZyCWyhOZ0d8dXa7M5Y7rqDe2P/ndQO0SOA8vwG3O4rGz
         6HY8FGkFjrL8oqtbHYbFQ4aeQ6+ErqcaYvNagSgI=
Date:   Thu, 17 Jun 2021 04:57:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Make resets optional
 on R-Car H1
Message-ID: <YMqsAkFfAU02t4oD@pendragon.ideasonboard.com>
References: <2da75fd2e971dfab8dd05a2a28bb1d6d9cbe5adb.1619700420.git.geert+renesas@glider.be>
 <YIrU+tdcfQ/6ODRz@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YIrU+tdcfQ/6ODRz@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Apr 29, 2021 at 06:47:06PM +0300, Laurent Pinchart wrote:
> On Thu, Apr 29, 2021 at 02:47:31PM +0200, Geert Uytterhoeven wrote:
> > The "resets" property is not present on R-Car Gen1 SoCs.
> > Supporting it would require migrating from renesas,cpg-clocks to
> > renesas,cpg-mssr.
> > 
> > Reflect this in the DT bindings by removing the global "required:
> > resets".  All SoCs that do have "resets" properties already have
> > SoC-specific rules making it required.
> 
> Should we drop the
> 
>         resets:
> 	  maxItems: 1
> 
> from renesas,du-r8a7779 then ? And maybe the
> 
>   resets: true
> 
> in the general case ?

Any opinion on this ?

> > Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  Documentation/devicetree/bindings/display/renesas,du.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > index 552a99ce4f1280d7..e955034da53b86e2 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > @@ -89,7 +89,6 @@ required:
> >    - reg
> >    - clocks
> >    - interrupts
> > -  - resets
> >    - ports
> >  
> >  allOf:

-- 
Regards,

Laurent Pinchart
