Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f181.google.com ([209.85.210.181]:36341 "EHLO
        mail-wj0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754275AbcKYNbD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Nov 2016 08:31:03 -0500
Received: by mail-wj0-f181.google.com with SMTP id qp4so59122594wjc.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Nov 2016 05:31:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161125075614.GB14431@verge.net.au>
References: <20161125075614.GB14431@verge.net.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Nov 2016 14:31:00 +0100
Message-ID: <CAPDyKFqkrV+wbRXJLdaUqo=CH-O7FdpSSp8Zpg43BOL67cQ6zQ@mail.gmail.com>
Subject: Re: [PATCH mmc/next] mmc: sh_mmcif: Document r8a73a4, r8a7778 and
 sh73a0 DT bindings
To: Simon Horman <horms+renesas@verge.net.au>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 25 November 2016 at 08:56, Simon Horman <horms+renesas@verge.net.au> wrote:
> Simply document new compatibility strings as the driver is already
> activated using a fallback compatibility string.
>
> These compat strings are in keeping with those for all other
> Renesas ARM based SoCs with sh_mmcif enabled in mainline.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied for next!

Kind regards
Uffe

> ---
> Reposted with r8a7778 instead of r8a7779 in subject
>
> I have also posted patches to use these new compat strings
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
> +       - "renesas,mmcif-r8a73a4" for the MMCIF found in r8a73a4 SoCs
>         - "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
> +       - "renesas,mmcif-r8a7778" for the MMCIF found in r8a7778 SoCs
>         - "renesas,mmcif-r8a7790" for the MMCIF found in r8a7790 SoCs
>         - "renesas,mmcif-r8a7791" for the MMCIF found in r8a7791 SoCs
>         - "renesas,mmcif-r8a7793" for the MMCIF found in r8a7793 SoCs
>         - "renesas,mmcif-r8a7794" for the MMCIF found in r8a7794 SoCs
> +       - "renesas,mmcif-sh73a0" for the MMCIF found in sh73a0 SoCs
>
>  - clocks: reference to the functional clock
>
> --
> 2.7.0.rc3.207.g0ac5344
>
