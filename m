Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:55371 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751876AbeDSLSk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 07:18:40 -0400
Subject: Re: [PATCH v8 2/2] drm: bridge: Add thc63lvd1024 LVDS decoder driver
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, <architt@codeaurora.org>,
        <a.hajda@samsung.com>, <Laurent.pinchart@ideasonboard.com>,
        <airlied@linux.ie>, <horms@verge.net.au>, <magnus.damm@gmail.com>,
        <geert@linux-m68k.org>, <niklas.soderlund@ragnatech.se>,
        <sergei.shtylyov@cogentembedded.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
References: <1523357590-3841-1-git-send-email-jacopo+renesas@jmondi.org>
 <1523357590-3841-3-git-send-email-jacopo+renesas@jmondi.org>
CC: <dri-devel@lists.freedesktop.org>,
        <linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <241462f3-0396-c763-6fb4-aff8fc5d29bd@mentor.com>
Date: Thu, 19 Apr 2018 14:18:30 +0300
MIME-Version: 1.0
In-Reply-To: <1523357590-3841-3-git-send-email-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On 04/10/2018 01:53 PM, Jacopo Mondi wrote:
> Add DRM bridge driver for Thine THC63LVD1024 LVDS to digital parallel
> output converter.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Generally I have only one pretty ignorable comment.

> +
> +enum thc63_ports {
> +	THC63_LVDS_IN0,
> +	THC63_LVDS_IN1,
> +	THC63_RGB_OUT0,
> +	THC63_RGB_OUT1,
> +};
> +

The driver uses only THC63_RGB_OUT0 value, or port@2, and MODE{0,1,2} IC
configuration is ignored.

I don't know if right from the beginning it would be better to support
dual-out modes, preferably both single-in and dual-in ones. Will it
impact port enumeration?

I do understand that the extension is possible, and likely only hardware
accessibility postpones it.

--
With best wishes,
Vladimir
