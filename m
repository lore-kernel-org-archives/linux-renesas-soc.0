Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BA7C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 09:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74D162077C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 09:54:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WgWPqacS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfDLJy1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 05:54:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38568 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfDLJy0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 05:54:26 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F462549;
        Fri, 12 Apr 2019 11:54:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1555062865;
        bh=vQqojCU1jHRhXtfSut7iEXf3pg956hk+M89Yb/XOEXk=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WgWPqacS2P2TDO/SiIuHaZIHu1v/7xNTo5C8kFnfwgu5wGhGftxgJ11GOUiqi7O+8
         5UytwksCQ2DHs8ehLsa9N9jthJzlchIgB/HFXGpm7KiJi+SWG4UOmvM6Rqx5Tm3QLc
         /0DevEVeVDFPFzsoymksc4QUplYc5V37x/hNYdy8=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 1/4] dt-bindings: display: renesas: du: Document the
 r8a774a1 bindings
To:     Biju Das <biju.das@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
References: <1554993271-29523-1-git-send-email-biju.das@bp.renesas.com>
 <1554993271-29523-2-git-send-email-biju.das@bp.renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <d73aa824-9627-7d5b-39c8-0d564e56d23f@ideasonboard.com>
Date:   Fri, 12 Apr 2019 10:54:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554993271-29523-2-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On 11/04/2019 15:34, Biju Das wrote:
> Document the RZ/G2M (R8A774A1) SoC in the R-Car DU bindings.

Based on the expectation that this is equivalent to the M3-W, then this
looks good to me.

Are the RZ/G datasheets available publicly somewhere? If not I'll see if
I can source it through my Renesas NDA channels.

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index aedb22b..c97dfac 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -7,6 +7,7 @@ Required Properties:
>      - "renesas,du-r8a7744" for R8A7744 (RZ/G1N) compatible DU
>      - "renesas,du-r8a7745" for R8A7745 (RZ/G1E) compatible DU
>      - "renesas,du-r8a77470" for R8A77470 (RZ/G1C) compatible DU
> +    - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
>      - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
>      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
>      - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
> @@ -58,6 +59,7 @@ corresponding to each DU output.
>   R8A7744 (RZ/G1N)       DPAD 0         LVDS 0         -              -
>   R8A7745 (RZ/G1E)       DPAD 0         DPAD 1         -              -
>   R8A77470 (RZ/G1C)      DPAD 0         DPAD 1         LVDS 0         -
> + R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
>   R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
>   R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
>   R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
> 

