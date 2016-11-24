Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:32781 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938796AbcKXSun (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2016 13:50:43 -0500
Received: by mail-lf0-f41.google.com with SMTP id c13so34727535lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Nov 2016 10:50:43 -0800 (PST)
Subject: Re: [PATCH mmc/next] mmc: sh_mmcif: Document r8a73a4, r8a7779 and
 sh73a0 DT bindings
To: Simon Horman <horms+renesas@verge.net.au>,
        Ulf Hansson <ulf.hansson@linaro.org>
References: <1480011435-22125-1-git-send-email-horms+renesas@verge.net.au>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e0e1d92b-1b79-ec53-def0-25a080edc073@cogentembedded.com>
Date: Thu, 24 Nov 2016 21:50:38 +0300
MIME-Version: 1.0
In-Reply-To: <1480011435-22125-1-git-send-email-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 11/24/2016 09:17 PM, Simon Horman wrote:

> Simply document new compatibility strings as the driver is already
> activated using a fallback compatibility string.
>
> These compat strings are in keeping with those for all other
> Renesas ARM based SoCs with sh_mmcif enabled in mainline.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> I plan to follow-up with patches to use these new compat strings
> to bring the DT files of the SoCs in question in-line with those
> for other Renesas ARM based SoCs with sh_mmcif enabled in mainline.
> ---
>  Documentation/devicetree/bindings/mmc/renesas,mmcif.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> index ff611fa66871..e4ba92aa035e 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> +++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> @@ -8,11 +8,14 @@ Required properties:
>
>  - compatible: should be "renesas,mmcif-<soctype>", "renesas,sh-mmcif" as a
>    fallback. Examples with <soctype> are:
> +	- "renesas,mmcif-r8a73a4" for the MMCIF found in r8a73a4 SoCs
>  	- "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
> +	- "renesas,mmcif-r8a7778" for the MMCIF found in r8a7778 SoCs

    7779 in the subject, 7778 here.

[...]

MBR, Sergei
