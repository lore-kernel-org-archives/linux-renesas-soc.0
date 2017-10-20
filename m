Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:49785 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752783AbdJTKDG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 06:03:06 -0400
Received: by mail-it0-f67.google.com with SMTP id y15so13377875ita.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Oct 2017 03:03:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171015124615.31391-2-wsa+renesas@sang-engineering.com>
References: <20171015124615.31391-1-wsa+renesas@sang-engineering.com> <20171015124615.31391-2-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Oct 2017 12:03:04 +0200
Message-ID: <CAPDyKFoAwbki4LEy3UmNqFi9dNSBHeT4oRELw28+LSdaHW4_Bg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: describe new eMMC binding for
 fixed driver type
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 15 October 2017 at 14:46, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Some boards may have to use a certain driver type (or drive strength) to
> achieve stable eMMC communication. Describe a binding to set this up via
> DT.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, applied for next!

Kind regards
Uffe

> ---
>
> no changes since v2
>
>  Documentation/devicetree/bindings/mmc/mmc.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentation/devicetree/bindings/mmc/mmc.txt
> index b32ade645ad97c..94a90b49a6925d 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/mmc.txt
> @@ -53,6 +53,9 @@ Optional properties:
>  - no-sdio: controller is limited to send sdio cmd during initialization
>  - no-sd: controller is limited to send sd cmd during initialization
>  - no-mmc: controller is limited to send mmc cmd during initialization
> +- fixed-emmc-driver-type: for non-removable eMMC, enforce this driver type.
> +  The value <n> is the driver type as specified in the eMMC specification
> +  (table 206 in spec version 5.1).
>
>  *NOTE* on CD and WP polarity. To use common for all SD/MMC host controllers line
>  polarity properties, we have to fix the meaning of the "normal" and "inverted"
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
