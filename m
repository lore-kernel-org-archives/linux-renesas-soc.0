Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33957 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754727AbeEAP1L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 May 2018 11:27:11 -0400
Date: Tue, 1 May 2018 17:27:07 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT 0/3] mmc: renesas_sdhi: add support for r8a77965
Message-ID: <20180501152643.itilgwfoqe7dnwdg@verge.net.au>
References: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 30, 2018 at 04:48:13AM +0900, Yoshihiro Kaneko wrote:
> This series adds SDHI device support for r8a77965.
> 
> This series is based on the next branch of Ulf Hansson's mmc tree.
> 
> Masaharu Hayakawa (1):
>   mmc: renesas_sdhi: Add r8a77965 support
> 
> Takeshi Kihara (2):
>   pinctrl: sh-pfc: r8a77965: Add SDHI pins, groups and functions

Thanks,

I did some testing of these patches applied on top of a merge of:
* renesas-devel-20180430-v4.17-rc3
* mmc/next (5bec8e5878e2)

And things seem to work :)

Tested-by: Simon Horman <horms+renesas@verge.net.au>



# dmesg | grep mmc
[    1.519354] renesas_sdhi_internal_dmac ee140000.sd: mmc0 base at 0xee140000 max clock rate 200 MHz
[    1.726791] mmc0: new HS200 MMC card at address 0001
[    1.732769] mmcblk0: mmc0:0001 BGSD3R 29.1 GiB 
[    1.737725] mmcblk0boot0: mmc0:0001 BGSD3R partition 1 16.0 MiB
[    1.744019] mmcblk0boot1: mmc0:0001 BGSD3R partition 2 16.0 MiB
[    1.750462] mmcblk0rpmb: mmc0:0001 BGSD3R partition 3 4.00 MiB, chardev (243:0)
[    1.879912] renesas_sdhi_internal_dmac ee100000.sd: mmc1 base at 0xee100000 max clock rate 200 MHz
[    1.949727] renesas_sdhi_internal_dmac ee160000.sd: mmc2 base at 0xee160000 max clock rate 200 MHz
[    2.055805] mmc1: new ultra high speed SDR50 SDHC card at address e624
[    2.064320] mmcblk1: mmc1:e624 SU08G 7.40 GiB 
[    2.119395] mmc2: new ultra high speed SDR50 SDHC card at address 0001
[    2.126544] mmcblk2: mmc2:0001 00000 29.8 GiB 
# dmesg | egrep '(mmc|sd)'
[    1.457672] renesas_sdhi_internal_dmac ee100000.sd: Got CD GPIO
[    1.463699] renesas_sdhi_internal_dmac ee100000.sd: Got WP GPIO
[    1.519354] renesas_sdhi_internal_dmac ee140000.sd: mmc0 base at 0xee140000 max clock rate 200 MHz
[    1.529021] renesas_sdhi_internal_dmac ee160000.sd: Got CD GPIO
[    1.535111] renesas_sdhi_internal_dmac ee160000.sd: Got WP GPIO
[    1.726791] mmc0: new HS200 MMC card at address 0001
[    1.732769] mmcblk0: mmc0:0001 BGSD3R 29.1 GiB 
[    1.737725] mmcblk0boot0: mmc0:0001 BGSD3R partition 1 16.0 MiB
[    1.744019] mmcblk0boot1: mmc0:0001 BGSD3R partition 2 16.0 MiB
[    1.750462] mmcblk0rpmb: mmc0:0001 BGSD3R partition 3 4.00 MiB, chardev (243:0)
[    1.818520] renesas_sdhi_internal_dmac ee100000.sd: Got CD GPIO
[    1.824539] renesas_sdhi_internal_dmac ee100000.sd: Got WP GPIO
[    1.879912] renesas_sdhi_internal_dmac ee100000.sd: mmc1 base at 0xee100000 max clock rate 200 MHz
[    1.889678] renesas_sdhi_internal_dmac ee160000.sd: Got CD GPIO
[    1.895692] renesas_sdhi_internal_dmac ee160000.sd: Got WP GPIO
[    1.949727] renesas_sdhi_internal_dmac ee160000.sd: mmc2 base at 0xee160000 max clock rate 200 MHz
[    2.055805] mmc1: new ultra high speed SDR50 SDHC card at address e624
[    2.064320] mmcblk1: mmc1:e624 SU08G 7.40 GiB 
[    2.119395] mmc2: new ultra high speed SDR50 SDHC card at address 0001
[    2.126544] mmcblk2: mmc2:0001 00000 29.8 GiB 
# time dd if=/dev/mmcblk0 of=/dev/null bs=1M count=2048
[   92.910712] random: crng init done
2048+0 records in
2048+0 records out
real    0m 12.90s
user    0m 0.00s
sys     0m 4.19s
# time dd if=/dev/mmcblk1 of=/dev/null bs=1M count=512
512+0 records in
512+0 records out
real    0m 11.61s
user    0m 0.00s
sys     0m 1.06s
# time dd if=/dev/mmcblk2 of=/dev/null bs=1M count=512
512+0 records in
512+0 records out
real    0m 11.67s
user    0m 0.00s
sys     0m 1.06s
# time dd if=/dev/zero of=/dev/mmcblk0 bs=1M count=512
512+0 records in
512+0 records out
real    0m 21.41s
user    0m 0.00s
sys     0m 2.87s
# time dd if=/dev/zero of=/dev/mmcblk1 bs=1M count=64
64+0 records in
64+0 records out
real    0m 18.07s
user    0m 0.00s
sys     0m 0.43s
# time dd if=/dev/zero of=/dev/mmcblk2 bs=1M count=64
64+0 records in
64+0 records out
real    0m 16.58s
user    0m 0.00s
sys     0m 0.44s
