Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:54870 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752752AbdKNNLE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2017 08:11:04 -0500
Received: by mail-qt0-f196.google.com with SMTP id h42so3046190qtk.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Nov 2017 05:11:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171110121520.23437-3-horms+renesas@verge.net.au>
References: <20171110121520.23437-1-horms+renesas@verge.net.au> <20171110121520.23437-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Nov 2017 14:11:03 +0100
Message-ID: <CAMuHMdU4ZM22iyeO0_Ub+XsOdoUCHUkTqTQiaRZUzgPZAnhGJQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/ipmmu-vmsa: Add r8a779(70|95) DT bindings
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Alex Williamson <alex.williamson@redhat.com>,
        Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        iommu@lists.linux-foundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Nov 10, 2017 at 1:15 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Update the IPMMU DT binding documentation to include the
> r8a77970 (R-Car V3M) and r8a77995 (R-Car D3) compat strings.
>
> Based on work for r8a7796 by Magnus Damm.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
> index 98ae900a7a76..9efa87dbcfdc 100644
> --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
> +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt
> @@ -17,6 +17,8 @@ Required Properties:
>      - "renesas,ipmmu-r8a7794" for the R8A7794 (R-Car E2) IPMMU.
>      - "renesas,ipmmu-r8a7795" for the R8A7795 (R-Car H3) IPMMU.
>      - "renesas,ipmmu-r8a7796" for the R8A7796 (R-Car M3-W) IPMMU.
> +    - "renesas,ipmmu-r8a77970" for the R8A7770 (R-Car V3M) IPMMU.

s/7770/77970/

> +    - "renesas,ipmmu-r8a77995" for the R8A77995 (R-Car D3) IPMMU.
>      - "renesas,ipmmu-vmsa" for generic R-Car Gen2 VMSA-compatible IPMMU.
>
>    - reg: Base address and size of the IPMMU registers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
