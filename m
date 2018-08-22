Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:39875 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728523AbeHVNM2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 09:12:28 -0400
Received: by mail-io0-f195.google.com with SMTP id l7-v6so963429iok.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Aug 2018 02:48:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1534250074-15890-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1534250074-15890-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Aug 2018 11:48:18 +0200
Message-ID: <CAPDyKFq3=gF941BZ9DCcjkg95mDEMMV8k+6856k6t2P=KObaNw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add SDHI support to r8a774a1
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 14 August 2018 at 14:34, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Dear All,
>
> this series aims at documenting SDHI support for RZ/G2M (a.k.a. R8A774A1).
>
> Cheers,
> Fab
>
> Fabrizio Castro (2):
>   mmc: renesas_sdhi_internal_dmac: Whitelist r8a774a1
>   mmc: renesas_sdhi: Add r8a774a1 support
>
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 4 +++-
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> --
> 2.7.4
>

Thanks, queued for v4.20!

Kind regards
Uffe
