Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31335C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 10:34:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F124920675
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 10:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tL+1I8Nk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbfDLKeD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 06:34:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39200 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbfDLKeC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 06:34:02 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4569233C;
        Fri, 12 Apr 2019 12:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1555065241;
        bh=xBK2hlrYXI9cbsDa5KiUmcc6sDKEmzYjNlYVxekjU80=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=tL+1I8Nk+1OT0YVcNrcq9eNBL9lc2Ga0s52RzcSj2Y6VBAHOgmHYcTa16NqH0kBX0
         E1vfz59FFGNvIWGmGuVL4kUsyGDPd6zAzBNvT5JOkxIcFDRWPaLXddrRN5MM2kXbB/
         jKg59739eRWmAM6MPEOGVOOIjkvTpBuWRCDVepMI=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/4] dt-bindings: display: renesas: lvds: Document
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
 <1554993271-29523-3-git-send-email-biju.das@bp.renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <809d6dc1-1095-1210-1761-e5de67031eb2@ideasonboard.com>
Date:   Fri, 12 Apr 2019 11:33:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554993271-29523-3-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch,

On 11/04/2019 15:34, Biju Das wrote:
> Document the RZ/G2M (R8A774A1) LVDS bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

This looks good.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> index 900a884..86a691a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -9,6 +9,7 @@ Required properties:
>  - compatible : Shall contain one of
>    - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
>    - "renesas,r8a7744-lvds" for R8A7744 (RZ/G1N) compatible LVDS encoders
> +  - "renesas,r8a774a1-lvds" for R8A774A1 (RZ/G2M) compatible LVDS encoders
>    - "renesas,r8a774c0-lvds" for R8A774C0 (RZ/G2E) compatible LVDS encoders
>    - "renesas,r8a7790-lvds" for R8A7790 (R-Car H2) compatible LVDS encoders
>    - "renesas,r8a7791-lvds" for R8A7791 (R-Car M2-W) compatible LVDS encoders
> 

