Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <a4e171b0-6403-9d88-3b8f-e63f3f050689@arm.com>
References: <1485532996-19719-1-git-send-email-geert+renesas@glider.be>
 <CANqRtoQJaRK7Kys-fudyxJuojBmZyXMsNoDudSt4p=gj5srviA@mail.gmail.com> <a4e171b0-6403-9d88-3b8f-e63f3f050689@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Feb 2017 11:33:49 +0100
Message-ID: <CAMuHMdXc76NFF=k7+PFXn_65cW+O+SGh3QXiC88gf3i=1Xw0og@mail.gmail.com>
Subject: Re: [PATCH/RFC] arm64: defconfig: Enlarge CMA alignment to 2 MiB
To: Robin Murphy <robin.murphy@arm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Robin,

On Wed, Feb 1, 2017 at 3:06 PM, Robin Murphy <robin.murphy@arm.com> wrote:
> On 01/02/17 13:45, Magnus Damm wrote:
>> On Sat, Jan 28, 2017 at 1:03 AM, Geert Uytterhoeven
>> <geert+renesas@glider.be> wrote:
>>> Some IOMMUs (e.g. Renesas IPMMU/VMSA) support only page sizes of 4 KiB,
>>> 2 MiB, and 1 GiB.
>>>
>>> With the default setting of CONFIG_CMA_ALIGNMENT = 8, allocations larger
>>> than 1 MiB are aligned to a 1 MiB boundary only.  Hence a 2 MiB
>>> allocation may not be aligned, leading to a mapping of 512 4 KiB pages.
>>>
>>> Increase CONFIG_CMA_ALIGNMENT to allow mapping a 2 MiB buffer using a
>>> single PTE, decreasing memory usage and TLB pressure.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> Is this useful?
>>>
>>> Should there instead be different defaults in Kconfig, depending on
>>> enabled platform support?
>>
>> I think there is a dependency on the kernel page size configuration as
>> well. In case of 16 KiB or 64 KiB page size configuration other large
>> page sizes may be required.
>
> I don't see the original patch (linux-arm-kernel doesn't look to have it
> archived either), but I think bumping the default up to 2MB to match our

These days linux-arm-kernel (infradead) tends to reject my patches :-(

linux-renesas-soc patchwork does have it:
https://patchwork.kernel.org/patch/9542173/

> normal section size sounds generally reasonable - users can still
> override it manually in their config, right? For 16KB and 64KB granules,
> it is at least the size covered by contiguous-hinted pages; the actual
> section sizes there are far too big to be practical for alignment
> purposes anyway (32MB and 512MB respectively).

Yes, it can be overridden by the user.

One slight annoyance is the dependency on PAGE_SHIFT: if you increase
ARM64_PAGE_SHIFT, you want to decrease CONFIG_CMA_ALIGNMENT.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
