Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35836 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750765AbdEPQjC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2017 12:39:02 -0400
Received: by mail-it0-f67.google.com with SMTP id 67so15420462itx.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 May 2017 09:39:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
References: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 May 2017 18:39:00 +0200
Message-ID: <CAMuHMdVdEGs5TLySBUVUhbis41rrG+AcFcVbLdzijJAEtMpvaA@mail.gmail.com>
Subject: Re: [PATCH v3 00/09] arm64: dts: r8a7795: IPMMU upstream integration V3
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Joerg Roedel <joro@8bytes.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Mon, Mar 20, 2017 at 9:35 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> arm64: dts: r8a7795: IPMMU upstream integration V3
>
> [PATCH v3 01/09] arm64: dts: r8a7795: Add IPMMU device nodes
> [PATCH v3 02/09] arm64: dts: r8a7795: Tie Audio/SYS-DMAC to IPMMU-DS0/1 and MP1
> [PATCH v3 03/09] arm64: dts: r8a7795: Point DU/VSPD via FCPVD to IPMMU-VI
> [PATCH v3 04/09] arm64: dts: r8a7795: Point FDP1 via FCPF to IPMMU-VP
> [PATCH v3 05/09] arm64: dts: r8a7795: Point VSPBC/VSPBD via FCPVB to IPMMU-VP
> [PATCH v3 06/09] arm64: dts: r8a7795: Point VSPI via FCPVI to IPMMU-VP
> [PATCH v3 07/09] arm64: dts: r8a7795: Connect Ethernet-AVB to IPMMU-DS0
> [PATCH v3 08/09] arm64: dts: r8a7795: Connect SATA to IPMMU-HC
> [PATCH v3 09/09] arm64: dts: r8a7795: Enable IPMMU-VI, VP, MP1, DS0, DS1 and MM
>
> This series adds DT nodes for IPMMU instances on r8a7795 together with
> connections to various r8a7795 on-chip devices such as Audio-DMAC, SYS-DMAC,
> Ethernet-AVB, SATA and a bunch of multimedia devices that make use of FCP.
>
> With these patches applied a white list enabled IPMMU driver may be used
> to check silicon revision and then enable IPMMU in the known working cases.
>
> The recommended IPMMU driver patch stack consists of the following series:
>  [PATCH v7 00/07] iommu/ipmmu-vmsa: IPMMU multi-arch update V7
>  [PATCH v3 00/09] iommu/ipmmu-vmsa: r8a7795 support V3
>  [PATCH v3 0/3] iommu/ipmmu-vmsa: r8a7796 support V3
>
> The final patch in the series enable IPMMU support for all IPMMU instances
> on r8a7795 that are used by IPMMU devices listed above with one exception.
> The exception is the SATA device connected to IPMMU-HC which still is disabled
> pending IPMMU USB integration support. I expect IPMMU USB integration to be
> handled as a second step once this series is agreed on.
>
> The DT binding for r8a7795 has since long been included in mainline
> and this series implements support following such format:

I dropped this series from today's renesas-drivers because of two reasons:
  1. IPMMU is busted in v4.12-rc1,
  2. The addition of support for R-Car H3 ES2.0 complicated the addition of
      IPMMU devices nodes and links from their slaves.

This also means I couldn't apply Morimoto-san's "[PATCH v2 --/--] arm64:
renesas: r8a7796: add IPMMU support for AUDIO DMAC", as it depends
on your series.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
