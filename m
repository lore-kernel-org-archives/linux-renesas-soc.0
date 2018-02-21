Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:37213 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752503AbeBUIfQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Feb 2018 03:35:16 -0500
Received: by mail-lf0-f68.google.com with SMTP id y19so1190252lfd.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2018 00:35:15 -0800 (PST)
Subject: Re: [PATCH v4 01/16] dt-bindings: display: renesas: Add R-Car LVDS
 encoder DT bindings
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20180220231046.32638-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180220231046.32638-2-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3ec6ef0d-1753-cf81-f619-cf43913044de@cogentembedded.com>
Date: Wed, 21 Feb 2018 11:35:13 +0300
MIME-Version: 1.0
In-Reply-To: <20180220231046.32638-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2/21/2018 2:10 AM, Laurent Pinchart wrote:

> The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> corresponding device tree bindings.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v1:
> 
> - Move the SoC name before the IP name in compatible strings
> - Rename parallel input to parallel RGB input
> - Fixed "renesas,r8a7743-lvds" description
> - Document the resets property
> - Fixed typo
> ---
>   .../bindings/display/bridge/renesas,lvds.txt       | 56 ++++++++++++++++++++++
>   MAINTAINERS                                        |  1 +
>   2 files changed, 57 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> new file mode 100644
> index 000000000000..2b19ce51ec07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -0,0 +1,56 @@
> +Renesas R-Car LVDS Encoder
> +==========================
> +
> +These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
> +Gen2, R-Car Gen3 and RZ/G SoCs.
> +
> +Required properties:
> +
> +- compatible : Shall contain one of
> +  - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
> +  - "renesas,r8a7790-lvds" for R8A7790 (R-Car H2) compatible LVDS encoders
> +  - "renesas,r8a7791-lvds" for R8A7791 (R-Car M2-W) compatible LVDS encoders
> +  - "renesas,r8a7793-lvds" for R8A7791 (R-Car M2-N) compatible LVDS encoders
> +  - "renesas,r8a7795-lvds" for R8A7795 (R-Car H3) compatible LVDS encoders
> +  - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS encoders
> +
> +- reg: Base address and length for the memory-mapped registers
> +- clocks: A phandle + clock-specifier pair for the functional clock
> +- resets: A phandle + reset specifier for the module reset
> +
> +Required nodes:
> +
> +The LVDS encoder has two video ports. Their connections are modelled using the
> +OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> +
> +- Video port 0 corresponds to the parallel RGB input
> +- Video port 1 corresponds to the LVDS output
> +
> +Each port shall have a single endpoint.
> +
> +
> +Example:
> +
> +	lvds0: lvds@feb90000 {

    "lvds-encoder@feb90000" maybe? And do we need a # in the label if the 
encoder is alone in DT anyway?

[...]

MBR, Sergei
