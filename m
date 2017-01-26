Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <78112a99-dee0-c163-1d16-68a17f64f701@arm.com>
References: <1485424391-29914-1-git-send-email-geert+renesas@glider.be> <78112a99-dee0-c163-1d16-68a17f64f701@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jan 2017 14:28:14 +0100
Message-ID: <CAMuHMdWGdQ9KfwQ+fMyM73BpvhJdqD6SVXA+02tZwYWtaJaZZg@mail.gmail.com>
Subject: Re: [PATCH/RFC] iommu/ipmmu-vmsa: Restrict IOMMU Domain Geometry to
 32-bit address space
To: Robin Murphy <robin.murphy@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        iommu@lists.linux-foundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Robin,

On Thu, Jan 26, 2017 at 12:23 PM, Robin Murphy <robin.murphy@arm.com> wrote:
> On 26/01/17 09:53, Geert Uytterhoeven wrote:
>> Currently, the IPMMU/VMSA driver supports 32-bit I/O Virtual Addresses
>> only, and thus sets io_pgtable_cfg.ias = 32.  However, it doesn't force
>> a 32-bit IOVA space through the IOMMU Domain Geometry.
>>
>> Hence if a device (e.g. SYS-DMAC) rightfully configures a 40-bit DMA
>> mask, it will still be handed out a 40-bit IOVA, outside the 32-bit IOVA
>> space, leading to out-of-bounds accesses of the PGD when mapping the
>> IOVA.
>>
>> Force a 32-bit IOMMU Domain Geometry to fix this.
>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Thanks!

>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Should the generic code restrict the geometry based on IAS instead?
>
> Which generic code? IAS is specific to the io-pgtable library (well,
> really it's an ARM-SMMU-ism, but "input address size" is a fairly
> portable concept), but io-pgtable is just factored-out driver helper
> code and doesn't know anything about iommu_domains and the IOMMU API.
> Conversely, the IOMMU API core and kernel code beyond also know nothing
> about io-pgtable internals - in fact the domain geometry *is* how the
> IOMMU driver communicates its configured address space size to the
> outside world.

OK, so the IPMMU/VMSA does have to take care of it itself.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
