Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170907133756.6c1f02f6@bbrezillon>
References: <20170906214502.26748-1-cyrille.pitchen@wedev4u.fr>
 <CAMuHMdXKpheF5whZi2Ot2Pm8t3Lu+ramNV==sXBo87u_HerZxQ@mail.gmail.com> <20170907133756.6c1f02f6@bbrezillon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Sep 2017 13:44:22 +0200
Message-ID: <CAMuHMdVGnrwgcoXuRSy+A7O5+_fKQyH1XHGKrm0WSWAEw3SorA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: fix DMA unsafe buffer issue in spi_nor_read_sfdp()
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        Marek Vasut <marek.vasut@gmail.com>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Boris,

On Thu, Sep 7, 2017 at 1:37 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Thu, 7 Sep 2017 10:00:50 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> Instead of having buffers on the stack, passing them around through multiple
>> call levels, and then kmalloc()ing a buffer, what about using the helpers in
>> <linux/spi/spi.h> instead, which take care of the issue through the
>> static bounce
>> buffer or kmalloc() themselves?
>
> Are you referring to spi_write_then_read()? If this is the case, I'm not

For example. There are more of them.

> sure we can use this because m25p80_read/write() can have more than 2
> transfers.

OK.More than two transfers may need special handling.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
