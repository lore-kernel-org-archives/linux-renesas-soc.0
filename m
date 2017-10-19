Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:48414 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751962AbdJSIeE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Oct 2017 04:34:04 -0400
MIME-Version: 1.0
In-Reply-To: <20171019002412.GA14493@localhost.localdomain>
References: <1508225421-25405-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1508225421-25405-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXyY-gvQGn2UxhUDsdhdWUMmTA80z73PF14otvcKuTMaw@mail.gmail.com> <20171019002412.GA14493@localhost.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Oct 2017 10:34:02 +0200
Message-ID: <CAMuHMdUs+dLq8LJTJoUQEUzJAKXCfD0JBtVnHPyN6XdppVy5qQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi: fix swiotlb buffer is full
To: Konrad Rzeszutek Wilk <konrad@darnok.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Konrad,

On Thu, Oct 19, 2017 at 2:24 AM, Konrad Rzeszutek Wilk
<konrad@darnok.org> wrote:
> On Tue, Oct 17, 2017 at 10:02:50AM +0200, Geert Uytterhoeven wrote:
>> On Tue, Oct 17, 2017 at 9:30 AM, Yoshihiro Shimoda
>> <yoshihiro.shimoda.uh@renesas.com> wrote:
>> > Since the commit de3ee99b097d ("mmc: Delete bounce buffer handling")
>> > deletes the bounce buffer handling, a request data size will be referred
>> > to max_{req,seg}_size instead of MMC_QUEUE_BOUNCESZ (64k bytes).
>> >
>> > In other hand, renesas_sdhi_internal_dmac.c will set very big value of
>> > max_{req,seg}_size because the max_blk_count is set to 0xffffffff.
>> > And then, "swiotlb buffer is full" happens because swiotlb can handle
>> > a memory size up to 256k bytes only (IO_TLB_SEGSIZE = 128 and
>> > IO_TLB_SHIFT = 11).
>> >
>> > So, this patch fixes the issue to set max_blk_count to 512. Then,
>> > the max_{req,seg}_size will be set to 256k bytes.
>> >
>> > Reported-by: Dirk Behme <dirk.behme@de.bosch.com>
>> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>
>> Thanks for your patch!
>>
>> > ---
>> >  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 5 +++--
>> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
>> > index f905f23..6c9b4b2 100644
>> > --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
>> > +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
>> > @@ -80,8 +80,9 @@
>> >         .scc_offset     = 0x1000,
>> >         .taps           = rcar_gen3_scc_taps,
>> >         .taps_num       = ARRAY_SIZE(rcar_gen3_scc_taps),
>> > -       /* Gen3 SDHI DMAC can handle 0xffffffff blk count, but seg = 1 */
>> > -       .max_blk_count  = 0xffffffff,
>> > +       /* The swiotlb can handle memory size up to 256 kbytes for now. */
>> > +       .max_blk_count  = 512,
>>
>> Fixing this in the individual drivers feels like the wrong solution to me.
>>
>> iommu: Is there a better (generic) way to handle this?
>
> Yes. See 7453c549f5f6485c0d79cad7844870dcc7d1b34d, aka swiotlb_max_segment

Thanks for the pointer!

While I agree this can be used to avoid the swiotlb buffer full issue,
I believe it is a suboptimal solution if the device actually uses an IOMMU.
It limits the mapping size if CONFIG_SWIOTLB=y, which is always the
case for arm/arm64 these days.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
