Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f171.google.com ([209.85.217.171]:35087 "EHLO
        mail-ua0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934002AbeEJIMX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 May 2018 04:12:23 -0400
Received: by mail-ua0-f171.google.com with SMTP id a2-v6so779438uak.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 May 2018 01:12:23 -0700 (PDT)
MIME-Version: 1.0
From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Thu, 10 May 2018 11:12:22 +0300
Message-ID: <CAOtvUMc80rEZaKD8j=F0fyV27Y17JOU5zzXtqDgPo=KEMROrhQ@mail.gmail.com>
Subject: Booting Salvator-X ES1 board with upstream kernel
To: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi there,

I am trying to add support for the CryptoCell security IP in the
R-Rcar boards to mainline but I've run into some trouble.

I have an R-Car 3rd gen Salvator-X ES1 board. I've been able to boot
Linux 4.9 on it from the rareness-bsp tree, using the defconfig and
the r8a7795-es1-salvator-x DTB with no problems, so the HW is fine.

However, I can't seem to boot an upstream kernel (Linus master or
soc-for-v4.17 branch) on it. I just get total silence on the UART
after u-boot.

Any tips or ideas for me to try?

Many thanks,
Gilad

-- 
Gilad Ben-Yossef
Chief Coffee Drinker

"If you take a class in large-scale robotics, can you end up in a
situation where the homework eats your dog?"
 -- Jean-Baptiste Queru
