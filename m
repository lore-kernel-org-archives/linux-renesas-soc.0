Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-hk2apc01on0136.outbound.protection.outlook.com ([104.47.124.136]:40992
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753187AbcIALfR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 07:35:17 -0400
Message-ID: <57C80EC9.9060607@tataelxsi.co.in>
Date: Thu, 1 Sep 2016 16:49:37 +0530
From: Roopesh K P <roopeshkp@tataelxsi.co.in>
MIME-Version: 1.0
To: <linux-renesas-soc@vger.kernel.org>
Subject: Loading kernel from SPL without U-boot
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Renesas SoC,

I am following steps for flashing u-boot in Lager board (R-CAR H2) by 
changing the SW17 to 3pin and reset the board to start mini monitor. 
After setting dip switch SW17 to 1pin, give the Input User Program Start 
Address as e8080000 and write the u-boot.srec.

Now I am trying to use minimal secondary program loader (SPL) to 
directly load the kernel from flash and skipping u-boot (Falcon mode). I 
need to flash the SPL in location 0x00000000 instead of MERAM address 
0xe8080000 (Flash addr 0x80000). From my understanding, mini monitor and 
and SPI Loader are flashed in 4MB flash and u-boot is stored in 64MB 
flash memory.

Is my understanding correct ?

I am trying to flash SPL from existing U-boot prompt using tftp 
protocol. Flashing minimal SPL in 0x00000000 will corrupt any data or it 
should be write in MERAM address e8080000 (Flash addr 0x80000)?

regards,
RKP
