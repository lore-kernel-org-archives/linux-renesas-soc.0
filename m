Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44268 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbeLCRzW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 12:55:22 -0500
MIME-Version: 1.0
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com> <20181202193553.29704-14-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181202193553.29704-14-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Dec 2018 18:55:04 +0100
Message-ID: <CAMuHMdUc4v5C-KCkuAQ_nsbcjWjYDyUggPDgi1tivMbcRcCNDQ@mail.gmail.com>
Subject: Re: [PATCH 14/14] gpio: pca953x: Restore registers after
 suspend/resume cycle
To: Marek Vasut <marek.vasut@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

On Sun, Dec 2, 2018 at 8:36 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> It is possible that the PCA953x is powered down during suspend.
> Use regmap cache to assure the registers in the PCA953x are in
> line with the driver state after resume.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks for your series!

Background info: the main motivation for this series is to make sure SATA
keeps working after system suspend/resume on the Salvator-XS development
board, where the SATA functionality is configured using a gpio hog.

With your series applied, the SATA link seems to be functional after resume.
Dmesg difference:

     ata1: link resume succeeded after 1 retries
    -ata1: SATA link down (SStatus 0 SControl 300)
    -ata1: link resume succeeded after 1 retries
    -ata1: SATA link down (SStatus 0 SControl 300)
    -ata1: link resume succeeded after 1 retries
    -ata1: SATA link down (SStatus 0 SControl 300)
    -ata1.00: disabled
    -sd 0:0:0:0: rejecting I/O to offline device
    +ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
    +ata1.00: configured for UDMA/133

However, when trying to read from an attached hard drive, it fails:

    ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
    ata1.00: failed command: READ DMA
    ata1.00: cmd c8/00:20:00:00:00/00:00:00:00:00/e0 tag 0 dma 16384 in
             res 40/00:00:01:4f:c2/00:00:00:00:00/00 Emask 0x4 (timeout)
    ata1.00: status: { DRDY }
    ata1: hard resetting link
    ata1: link resume succeeded after 1 retries
    ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
    ata1.00: configured for UDMA/133
    sd 0:0:0:0: [sda] tag#0 UNKNOWN(0x2003) Result: hostbyte=0x00
driverbyte=0x08
    sd 0:0:0:0: [sda] tag#0 Sense Key : 0x5 [current]
    sd 0:0:0:0: [sda] tag#0 ASC=0x21 ASCQ=0x4
    sd 0:0:0:0: [sda] tag#0 CDB: opcode=0x28 28 00 00 00 00 00 00 00 20 00
    print_req_error: I/O error, dev sda, sector 0
    ata1: EH complete
    ...
    Buffer I/O error on dev sda, logical block 0, async page read

Does SATA work for you after resume!
This could still be an issue in the sata_rcar driver.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
