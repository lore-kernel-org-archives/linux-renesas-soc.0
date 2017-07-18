Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:34200 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751189AbdGRH2t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 03:28:49 -0400
Received: by mail-it0-f65.google.com with SMTP id o202so1505712itc.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jul 2017 00:28:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWdsLBRC0ZfpwExXLk6as01c5Xix8PN9yHxOid6s6p5iQ@mail.gmail.com>
References: <201707180130.B5VCWALQ%fengguang.wu@intel.com> <CAMuHMdWdsLBRC0ZfpwExXLk6as01c5Xix8PN9yHxOid6s6p5iQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jul 2017 09:28:47 +0200
Message-ID: <CAMuHMdVRVfqBC6qraucxX6YTrVspcUtatugQDXbc42UdUTRm0Q@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/renesas-overlays 1/86] drivers//of/configfs.c:48:2:
 error: implicit declaration of function 'of_fdt_unflatten_tree'
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 18, 2017 at 8:44 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Jul 17, 2017 at 7:58 PM, kbuild test robot
> <fengguang.wu@intel.com> wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
>> head:   8361d7e7432d1937f94e1863211fb3f852e37f36
>> commit: 1ba23467c1d052c0b5c35436c034f0fb7103eeaf [1/86] OF: DT-Overlay configfs interface (v7)
>> config: sparc64-allmodconfig (attached as .config)
>> compiler: sparc64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
>> reproduce:
>>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout 1ba23467c1d052c0b5c35436c034f0fb7103eeaf
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=sparc64
>>
>> All errors (new ones prefixed by >>):
>>
>>    drivers//of/configfs.c: In function 'create_overlay':
>>>> drivers//of/configfs.c:48:2: error: implicit declaration of function 'of_fdt_unflatten_tree' [-Werror=implicit-function-declaration]
>>      of_fdt_unflatten_tree(blob, NULL, &overlay->overlay);
>>      ^~~~~~~~~~~~~~~~~~~~~
>>    cc1: some warnings being treated as errors
>
> Apparently OF_OVERLAY should depend on OF_FLATTREE.

Oops, I meant CONFIG_OF_CONFIGFS.
But that causes warnings due to recursive dependencies:

drivers/of/Kconfig:59:error: recursive dependency detected!
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/of/Kconfig:59: symbol OF_EARLY_FLATTREE is selected by OF_UNITTEST
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/of/Kconfig:14: symbol OF_UNITTEST depends on OF_IRQ
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/of/Kconfig:83: symbol OF_IRQ depends on IRQ_DOMAIN
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
kernel/irq/Kconfig:63: symbol IRQ_DOMAIN is selected by GENERIC_IRQ_CHIP
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
kernel/irq/Kconfig:58: symbol GENERIC_IRQ_CHIP is selected by GPIO_DWAPB
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpio/Kconfig:160: symbol GPIO_DWAPB depends on GPIOLIB
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpio/Kconfig:13: symbol GPIOLIB is selected by PINCTRL_STM32
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/pinctrl/stm32/Kconfig:3: symbol PINCTRL_STM32 is selected by
PINCTRL_STM32F429
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/pinctrl/stm32/Kconfig:11: symbol PINCTRL_STM32F429 depends on
IRQ_DOMAIN_HIERARCHY
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
kernel/irq/Kconfig:67: symbol IRQ_DOMAIN_HIERARCHY is selected by
GENERIC_MSI_IRQ_DOMAIN
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
kernel/irq/Kconfig:80: symbol GENERIC_MSI_IRQ_DOMAIN is selected by MV_XOR_V2
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/dma/Kconfig:358: symbol MV_XOR_V2 depends on DMADEVICES
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/dma/Kconfig:5: symbol DMADEVICES is selected by CRYPTO_DEV_CCP_DD
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/crypto/ccp/Kconfig:1: symbol CRYPTO_DEV_CCP_DD depends on CRYPTO
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
crypto/Kconfig:15: symbol CRYPTO is selected by IP_SCTP
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
net/sctp/Kconfig:5: symbol IP_SCTP is selected by DLM
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
fs/dlm/Kconfig:1: symbol DLM depends on SYSFS
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
fs/sysfs/Kconfig:1: symbol SYSFS is selected by CONFIGFS_FS
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
fs/configfs/Kconfig:1: symbol CONFIGFS_FS is selected by OF_CONFIGFS
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/of/Kconfig:129: symbol OF_CONFIGFS depends on OF_EARLY_FLATTREE

Pantelis: Is there a newer version of of/configfs available, or an
alternative solution?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
