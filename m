Return-Path: <devicetree-owner@vger.kernel.org>
Date: Thu, 15 Feb 2018 16:45:34 +0100
From: Simon Horman <horms@verge.net.au>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/15] Documentation: devicetree: ravb: Add r8a77965
Message-ID: <20180215154235.ndpizqzkciqyifun@verge.net.au>
References: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org>
 <1518515162-23663-14-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1518515162-23663-14-git-send-email-jacopo+renesas@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 13, 2018 at 10:46:00AM +0100, Jacopo Mondi wrote:
> Add documentation for r8a77965 compatible string to renesas ravb device
> tree bindings documentation.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

This needs to be CCed to Sergei and netdev to proceed into mainline.

There are lot of examples and little consistency, but I believe a good
prefix and subject for the patch would be:

dt-bindings: net: ravb: Add support for r8a77965 SoC
