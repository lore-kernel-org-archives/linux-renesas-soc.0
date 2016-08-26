Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35687 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751014AbcHZHS1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2016 03:18:27 -0400
Received: by mail-it0-f68.google.com with SMTP id n128so788119ith.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2016 00:18:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57BF944F.8000501@jinso.co.jp>
References: <57BF944F.8000501@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Aug 2016 09:18:25 +0200
Message-ID: <CAMuHMdVUcEF31sWOxLU-=JDjjTM4S+0jkw_aSZWq6Yfco4TWbA@mail.gmail.com>
Subject: Re: R-Car Gen2 QSPI driver performance
To: Hiep Cao Minh <cm-hiep@jinso.co.jp>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sakato Ryusuke <ryusuke.sakato.bx@renesas.com>,
        kuninori morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Nguyen Viet Dung <nv-dung@jinso.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hiep,

On Fri, Aug 26, 2016 at 2:58 AM, Hiep Cao Minh <cm-hiep@jinso.co.jp> wrote:
> I'd like to ask you about R-Car Gen2 QSPI driver performance test of sing=
le,
> dual and quad.
>
> ------
> commit 4f12b5e529e4ff274eb478ec1c2ef41358ed9577
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
> Date:   Mon Jun 2 15:38:17 2014 +0200
>
>      spi: rspi: Add DMA support for QSPI on R-Car Gen2
>
>      Enable DMA support for QSPI on R-Car Gen2, for Single, Dual, and Qua=
d
> SPI
>      Transfers.
>
>      Performance figures for reading from a QSPI FLASH driven at 24.375 M=
Hz
>      on r8a7791/koelsch:
>        - Single:  1.1 Mbps PIO, 23 Mbps DMA
>        - Dual  : 12.7 Mbps PIO, 48 Mbps DMA
>        - Quad  : 13   Mbps PIO, 70 Mbps DMA
> ------
> Could you show me how to test these performances?

As I wanted to measure raw SPI performance, and not overhead (block
device, file system, ...) or other impact (buffer cache!), I used a patch l=
ike
the (whitespace-damaged) one at the end of this email, and:

    dd if=3D/dev/mtd2 bs=3D4M count=3D1 of=3D/dev/null

Using a sufficiently large buffer size is recommended for good performance.
All of this was done in r8a7791/koelsch.

> I have tried to reproduce them but I only got the results like this:
>
> Enabled DMA:
> Linux stable v4.7
>      Quad-spi=EF=BC=9A Read 3.2 MB/s Write 601 kB/s
>      Dual-spi=EF=BC=9A Read 3.1 MB/s Write 847 kB/s
>      Single-spi=EF=BC=9A Read 2.5 MB/s Write 850 kB/s
>
> PIO:
> RcarGen2_BSP linux_v3.10.101-ltsi
>      Quad-spi=EF=BC=9A Read 2.2 MB/s Write 1.1 MB/s
>      Dual-spi=EF=BC=9A Read 2.1 MB/s Write 158 kB/s
>      Single-spi=EF=BC=9A Read 173 kB/s Write 159 kB/s

Note that some of these are even faster than mine, probably due to
caching...

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index 112f5130ee9579f4..d9d822a3e35cbed2 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -199,6 +199,8 @@ struct rspi_data {

        unsigned dma_callbacked:1;
        unsigned byte_access:1;
+
+       u64 msg_start;
 };

 static void rspi_write8(const struct rspi_data *rspi, u8 data, u16 offset)
@@ -926,6 +972,8 @@ static int rspi_prepare_message(struct spi_master *mast=
er,
        struct rspi_data *rspi =3D spi_master_get_devdata(master);
        int ret;

+       rspi->msg_start =3D get_jiffies_64();
+
        if (msg->spi->mode &
            (SPI_TX_DUAL | SPI_TX_QUAD | SPI_RX_DUAL | SPI_RX_QUAD)) {
                /* Setup sequencer for messages with multiple transfer mode=
s */
@@ -943,6 +992,7 @@ static int rspi_unprepare_message(struct spi_master *ma=
ster,
                                  struct spi_message *msg)
 {
        struct rspi_data *rspi =3D spi_master_get_devdata(master);
+       unsigned int elapsed, bps;

        /* Disable SPI function */
        rspi_write8(rspi, rspi_read8(rspi, RSPI_SPCR) & ~SPCR_SPE, RSPI_SPC=
R);
@@ -950,6 +1000,13 @@ static int rspi_unprepare_message(struct
spi_master *master,
        /* Reset sequencer for Single SPI Transfers */
        rspi_write16(rspi, rspi->spcmd, RSPI_SPCMD0);
        rspi_write8(rspi, 0, RSPI_SPSCR);
+
+       elapsed =3D get_jiffies_64() - rspi->msg_start;
+       bps =3D elapsed ? div_u64(msg->actual_length * 8ULL * HZ + elapsed =
/ 2,
+                               elapsed) : 0;
+       printk("RSPI %u bps (%u bytes in %u ticks)\n", bps, msg->actual_len=
gth,
+              elapsed);
+
        return 0;
 }

 Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
