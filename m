Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <148929713106.20744.12985371298983384075.sendpatchset@little-apple>
References: <148929710090.20744.10912918031085568693.sendpatchset@little-apple>
 <148929713106.20744.12985371298983384075.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 Mar 2017 10:31:39 +0100
Message-ID: <CAMuHMdVCq+ZjuEr07nbZazB-mwr3-toqDPdgLNeoR1QHLWgCXQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Mar 12, 2017 at 6:38 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Support the r8a7796 IPMMU by sharing feature flags between
> r8a7795 and r8a7796. Also update IOMMU_OF_DECLARE to hook
> up the updated compat string.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
