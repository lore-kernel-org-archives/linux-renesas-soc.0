Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595EDC433E0
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Feb 2021 00:56:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2528A64E79
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Feb 2021 00:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhBIA4a (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Feb 2021 19:56:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhBIA42 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 19:56:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C93C061788;
        Mon,  8 Feb 2021 16:55:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EE87583;
        Tue,  9 Feb 2021 01:55:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1612832144;
        bh=546XL7xvfL+LHfS20TPPogFKXmYg6uzn09ILuWcX4WQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k4O6FiQMMKQ6cBYRJ5jRsDWoUYRiw+BOA6T8Uw7QvLZoRVVGeAXooKnmfJ2MBsS4p
         irVBm61yDhYnP9U+A7vtglGHhvoRLJnnMPbzdwFdaBp1QWw90DG7pabLEKztc/MiNx
         ldEbqEpdlm54OOSjSMHBAWxwDvDcVFhwRzqq4WH4=
Date:   Tue, 9 Feb 2021 02:55:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mykyta Poturai <ddone@aruko.org>
Cc:     devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: display: Add "disable-hpd" binding
Message-ID: <YCHdd1msOsodLn+v@pendragon.ideasonboard.com>
References: <20210131095701.965147-1-ddone@aruko.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210131095701.965147-1-ddone@aruko.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mykyta,

Thank you for the patch.

On Sun, Jan 31, 2021 at 11:57:01AM +0200, Mykyta Poturai wrote:
> Add the "disable-hpd" binding, used to disable hotplug detected
> functionality in the driver. When it's enabled the driver assumes that
> the connector is always connected and disables the hotplug detect
> related IRQ.
> 
> Signed-off-by: Mykyta Poturai <ddone@aruko.org>
> ---
>  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> index 3f6072651182..b2b899f46b86 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> @@ -39,6 +39,7 @@ Optional properties:
>  
>  - power-domains: Shall reference the power domain that contains the DWC HDMI,
>    if any.
> +- disable-hpd: Disables the hotplug detect feature

A similar property has been added to the ti,sn65dsi86 bindings in commit
1dbc979172af ("dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd").
A property with the same name exists in panel-common.yaml. Could we
standardize on that name ?

The description should also explain the hardware architecture, not the
driver behaviour. This is what the ti,sn65dsi86 binding documents:

  no-hpd:
    type: boolean
    description:
      Set if the HPD line on the bridge isn't hooked up to anything or is
      otherwise unusable.

You could use the same description, assuming this is the use case you
want to support. Could you perhaps describe your problem in a bit more
details ? Do you have a system with an HDMI panel that is always
connected, with the HPD signal of the dw-hdmi not connected ?

>  Example:

-- 
Regards,

Laurent Pinchart
