Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6E5C48BC2
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jun 2021 00:19:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59B3061249
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jun 2021 00:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhFXAWM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jun 2021 20:22:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54726 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhFXAWL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 20:22:11 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 998B087F;
        Thu, 24 Jun 2021 02:19:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624493991;
        bh=Lyd4UG+bl/FJcP2caLE6wao83RTH9G+tTygdmnYaQQM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Etz8nwNQ6PnvCM72b9Ge+gvocueZTZbz1r3oPiefghIaprV8+fQvTKGdL/89gg7Vo
         fJAptxE4XbTvPtg7ei/ndTJNwQbfHaCncgmTpw4jIgLW85o2iBxHxzD84aRBTlKloq
         rE7c3anCaBJ7ebzatlcK18lfHKclSa7dTUHEQvrc=
Date:   Thu, 24 Jun 2021 03:19:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Fix 'ports' reference
Message-ID: <YNPPiSzu9THj0PnH@pendragon.ideasonboard.com>
References: <20210623164308.2570164-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210623164308.2570164-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Wed, Jun 23, 2021 at 10:43:08AM -0600, Rob Herring wrote:
> Fix the renesas,du binding 'ports' schema which is referencing the 'port'
> schema instead of the 'ports' schema.
> 
> Fixes: 99d66127fad2 ("dt-bindings: display: renesas,du: Convert binding to YAML")
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Should I take the patch in my tree, or can you merge it ?

> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index 121596f106da..5f4345d43020 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -55,7 +55,7 @@ properties:
>      maxItems: 1
>  
>    ports:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/properties/ports
>      description: |
>        The connections to the DU output video ports are modeled using the OF
>        graph bindings specified in Documentation/devicetree/bindings/graph.txt.

-- 
Regards,

Laurent Pinchart
