Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45721 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729044AbeJLWRA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Oct 2018 18:17:00 -0400
Date: Fri, 12 Oct 2018 09:44:12 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: mmc: tmio_mmc: Document Renesas
 R7S9210
Message-ID: <20181012144412.GA29337@bogus>
References: <20181012122924.5543-1-chris.brandt@renesas.com>
 <20181012122924.5543-4-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181012122924.5543-4-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, 12 Oct 2018 07:29:24 -0500, Chris Brandt wrote:
> Document support for the RZ/A2 (R7S9210) SoC.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>  * Documented that R7S9210 has 2 clocks
> ---
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
