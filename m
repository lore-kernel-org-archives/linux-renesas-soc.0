Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35577 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725952AbeLCVmW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 16:42:22 -0500
Subject: Re: [PATCH 14/14] gpio: pca953x: Restore registers after
 suspend/resume cycle
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20181202193553.29704-1-marek.vasut+renesas@gmail.com>
 <20181202193553.29704-14-marek.vasut+renesas@gmail.com>
 <CAMuHMdUc4v5C-KCkuAQ_nsbcjWjYDyUggPDgi1tivMbcRcCNDQ@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1c5d6210-01ac-1196-6a12-1d526b85aad8@gmail.com>
Date: Mon, 3 Dec 2018 22:42:17 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUc4v5C-KCkuAQ_nsbcjWjYDyUggPDgi1tivMbcRcCNDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/03/2018 06:55 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sun, Dec 2, 2018 at 8:36 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> It is possible that the PCA953x is powered down during suspend.
>> Use regmap cache to assure the registers in the PCA953x are in
>> line with the driver state after resume.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Thanks for your series!
> 
> Background info: the main motivation for this series is to make sure SATA
> keeps working after system suspend/resume on the Salvator-XS development
> board, where the SATA functionality is configured using a gpio hog.
> 
> With your series applied, the SATA link seems to be functional after resume.
> Dmesg difference:
> 
>      ata1: link resume succeeded after 1 retries
>     -ata1: SATA link down (SStatus 0 SControl 300)
>     -ata1: link resume succeeded after 1 retries
>     -ata1: SATA link down (SStatus 0 SControl 300)
>     -ata1: link resume succeeded after 1 retries
>     -ata1: SATA link down (SStatus 0 SControl 300)
>     -ata1.00: disabled
>     -sd 0:0:0:0: rejecting I/O to offline device
>     +ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
>     +ata1.00: configured for UDMA/133
> 
> However, when trying to read from an attached hard drive, it fails:
> 
>     ata1.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
>     ata1.00: failed command: READ DMA
>     ata1.00: cmd c8/00:20:00:00:00/00:00:00:00:00/e0 tag 0 dma 16384 in
>              res 40/00:00:01:4f:c2/00:00:00:00:00/00 Emask 0x4 (timeout)
>     ata1.00: status: { DRDY }
>     ata1: hard resetting link
>     ata1: link resume succeeded after 1 retries
>     ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
>     ata1.00: configured for UDMA/133
>     sd 0:0:0:0: [sda] tag#0 UNKNOWN(0x2003) Result: hostbyte=0x00
> driverbyte=0x08
>     sd 0:0:0:0: [sda] tag#0 Sense Key : 0x5 [current]
>     sd 0:0:0:0: [sda] tag#0 ASC=0x21 ASCQ=0x4
>     sd 0:0:0:0: [sda] tag#0 CDB: opcode=0x28 28 00 00 00 00 00 00 00 20 00
>     print_req_error: I/O error, dev sda, sector 0
>     ata1: EH complete
>     ...
>     Buffer I/O error on dev sda, logical block 0, async page read
> 
> Does SATA work for you after resume!

Yes!
http://paste.debian.net/1054228/

> This could still be an issue in the sata_rcar driver.

I wonder if this has to do with the SATA link being cut off by the GPIO
mux at a bad time OR restored at a bad time.

-- 
Best regards,
Marek Vasut
