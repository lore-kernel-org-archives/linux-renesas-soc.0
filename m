Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF93C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Mar 2021 22:16:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B4E064F07
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Mar 2021 22:16:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhCOWQC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Mar 2021 18:16:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42038 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbhCOWPy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 18:15:54 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 091BF5A9;
        Mon, 15 Mar 2021 23:15:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615846553;
        bh=Bl36wMOwV1jcBe64Yc+fPE77DhgdFDZw0XnOymwubog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ho9gh3tniaRd7ReugOTRnVAUBNC6wZX82MFa9JaBWvUpEu9faWS1Qu93FgXSuyemu
         sfQPMo511KtTySAUIT5e33dK7jc399x8CsWw67F2A9z5EsxUwLUDm/ZnZM9BqeeqZ6
         mdCGWfUGHfTX/KNMgBsi08W/MYsg+rQ5T/SQmbQM=
Date:   Tue, 16 Mar 2021 00:15:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: max9286: Describe gpio-hog
Message-ID: <YE/cdBtSx3cDIqCY@pendragon.ideasonboard.com>
References: <20210315163028.173148-1-jacopo+renesas@jmondi.org>
 <20210315163028.173148-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210315163028.173148-2-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 15, 2021 at 05:30:25PM +0100, Jacopo Mondi wrote:
> The MAX9286 GMSL deserializer features gpio controller capabilities,
> as it provides 2 GPIO lines.
> 
> As establishing a regulator that uses one of the GPIO lines and
> enabling/disabling it at run-time in the max9286 won't work due to
> a circular dependency on the gpio-controller/regulator creation, allow
> the usage of a gpio-hog for that purpose.
> 
> The usage of the gpio-hog is required in designs where the MAX9286
> GPIO lines control the remote cameras power.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

That's really a workaround until we can find a good solution, do we have
to officially support it in the DT bindings ?

> ---
>  .../bindings/media/i2c/maxim,max9286.yaml        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index ee16102fdfe7..9038300e373c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -177,6 +177,22 @@ properties:
>  
>      additionalProperties: false
>  
> +patternProperties:
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> +    type: object
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      output-low: true
> +      line-name: true
> +
> +    required:
> +      - gpio-hog
> +      - gpios
> +      - output-low
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg

-- 
Regards,

Laurent Pinchart
