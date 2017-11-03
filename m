Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:49034 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756320AbdKCOBO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Nov 2017 10:01:14 -0400
MIME-Version: 1.0
In-Reply-To: <20171103132322.GA19352@x230.dumpdata.com>
References: <1508225421-25405-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1508225421-25405-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXyY-gvQGn2UxhUDsdhdWUMmTA80z73PF14otvcKuTMaw@mail.gmail.com>
 <20171019002412.GA14493@localhost.localdomain> <CAMuHMdUs+dLq8LJTJoUQEUzJAKXCfD0JBtVnHPyN6XdppVy5qQ@mail.gmail.com>
 <TY1PR06MB09928E11C2AFFD55EF68961CD8420@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <TY1PR06MB09929A4BF1E2A5DBD54845DED8430@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <20171101132639.GA24821@x230.dumpdata.com> <TY1PR06MB0992CBE1B122C62BD5E1C227D85C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <20171103132322.GA19352@x230.dumpdata.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Nov 2017 15:01:12 +0100
Message-ID: <CAMuHMdWxWu-6Hi+4P2GhEyjfu=mhbNUUOoBUC7JrsL=ki35c5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi: fix swiotlb buffer is full
To: Konrad Rzeszutek Wilk <konrad@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Konrad Rzeszutek Wilk <konrad@darnok.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Konrad,

On Fri, Nov 3, 2017 at 2:23 PM, Konrad Rzeszutek Wilk <konrad@kernel.org> wrote:
> ..snip..
>> > >
>> > > Anyway, I made v2 patches by using swiotlb related definitions. Would you check it?
>> >
>> > Did I miss that email? As in was I cc-ed?
>>
>> This was my fault. When I submitted v2 patches, I didn't include your email and iommu mailing list...
>
> No problem.
>>
>> > > https://patchwork.kernel.org/patch/10018879/
>> >
>> > Why not use IO_TLB_SEGSIZE << IO_TLB_SHIFT or alternatively
>> > swiotlb_max_segment?  See 5584f1b1d73e9
>>
>> I already made such a patch as v2 and it was merged into mmc.git / fixes branch.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/commit/?h=fixes&id=e90e8da72ad694a16a4ffa6e5adae3610208f73b
>
> What happens if the user has swiotlb=4096 on the command line (meaning
> less than the default value)? Your max value will be incorrect. Could you use
> swiotlb_max_segment?

No, as that's the total size of the swiotlb buffer, not the maximum size of
a single segment.

Quoting an earlier part of the thread:

On Thu, Oct 19, 2017 at 1:39 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>> >> iommu: Is there a better (generic) way to handle this?
>> >
>> > Yes. See 7453c549f5f6485c0d79cad7844870dcc7d1b34d, aka swiotlb_max_segment
>>
>> Thanks for the pointer!
>>
>> While I agree this can be used to avoid the swiotlb buffer full issue,
>> I believe it is a suboptimal solution if the device actually uses an IOMMU.
>> It limits the mapping size if CONFIG_SWIOTLB=y, which is always the
>> case for arm/arm64 these days.
>
> I'm afraid but I misunderstood this API's spec when I read it at first.
> After I tried to use it, I found the API cannot be used for a workaround because
> this API returns total size of swiotlb.
>
> For example:
>  - The swiotlb_max_segment() returns 64M bytes from the API when a default setting.
>   - In this case, the maximum size per a map is 256k bytes.
>  - The swiotlb_max_segment() returns 128M bytes from the API when I added swiotlb=65536
>    into the kernel parameter on arm64.
>   - In this case, the maximum size per a map is still 256k bytes because
>     the swiotlb has hardcoded the size by the following code:
>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/swiotlb.c?h=v4.14-rc5#n254

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
