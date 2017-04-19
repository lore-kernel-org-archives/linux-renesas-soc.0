Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:34911 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1765914AbdDSWqs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 18:46:48 -0400
Date: Wed, 19 Apr 2017 17:46:46 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7794: add R8A7745 support
Message-ID: <20170419224646.wwjerpgnidvk4fkh@rob-hp-laptop>
References: <20170413201932.890107963@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170413201932.890107963@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 13, 2017 at 11:19:24PM +0300, Sergei Shtylyov wrote:
> Renesas  RZ/G1E (R8A7745) is pin compatible with R-Car E2 (R8A7794),
> however  it doesn't have several automotive specific peripherals.

Is a single space between words really so hard for you? You've been told 
to write proper sentences multiple times.

Yes, kernel developers suffer from OCD. Sorry.

> Annotate all the items that only exist on the R-Car SoCs and only
> supply the pin groups/functions existing on a given SoC (that required
> splitting  of the AVB function)...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is  against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
> repo plus  R8A7794 PFC fix and R8A7743 PFC support patch...
> 
> Changes in version 2:
> - fixed indentation to use tabs instead of spaces;
> - updated the PFC bindings.
> 
>  Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt |    1 

But given it's a one line DT change:

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/sh-pfc/Kconfig                                    |    5 
>  drivers/pinctrl/sh-pfc/Makefile                                   |    1 
>  drivers/pinctrl/sh-pfc/core.c                                     |    6 
>  drivers/pinctrl/sh-pfc/pfc-r8a7794.c                              | 1970 +++++-----
>  drivers/pinctrl/sh-pfc/sh_pfc.h                                   |    1 
>  6 files changed, 1140 insertions(+), 844 deletions(-)
