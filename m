Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:10656 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750945AbdHCHS7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2017 03:18:59 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc-owner@vger.kernel.org" <linux-mmc-owner@vger.kernel.org>
Subject: RE: [PATCH 4/4] mmc: sdhi: use maximum width for the sdbuf register
Date: Thu, 3 Aug 2017 07:18:53 +0000
Message-ID: <KL1PR06MB1702544BC4FD755C76314608B8B10@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <20170630105649.16137-1-wsa+renesas@sang-engineering.com>
 <20170630105649.16137-5-wsa+renesas@sang-engineering.com>
 <TY1PR06MB07023DF77FC5A4453B09D82AB7B00@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <KL1PR06MB1702B525F5A03DD74B960928B8B00@KL1PR06MB1702.apcprd06.prod.outlook.com>
 <20170802190427.GA1474@katana>
In-Reply-To: <20170802190427.GA1474@katana>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> -----Original Message-----
> From: Wolfram Sang [mailto:wsa@the-dreams.de]
> Sent: 02 August 2017 20:04
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>; linux-renesas-
> soc@vger.kernel.org; Simon Horman <horms@verge.net.au>; Yoshihiro
> Shimoda <yoshihiro.shimoda.uh@renesas.com>; linux-mmc-
> owner@vger.kernel.org
> Subject: Re: [PATCH 4/4] mmc: sdhi: use maximum width for the sdbuf regis=
ter
>
>
> > I am having issues with this patch(commitid:-
> 785b215250310c690142abb1bdbb0767b8487c49)
> > on iWave RZ/G1M board which is identical to R-Car M2.
>
> Uh, that's bad. Let's see, can you print out the bus_shift variable?
>
> Like this
>
> pr_info("bus_width: %u\n", host->bus_shift);
>

[    0.890105] sh_mobile_sdhi ee100000.sd: Got CD GPIO
[    0.945805] bus_width: 1
[    1.005912] sh_mobile_sdhi ee100000.sd: mmc0 base at 0xee100000 max cloc=
k rate 195 MHz
[    1.014299] sh_mobile_sdhi ee140000.sd: Got CD GPIO
[    1.019228] sh_mobile_sdhi ee140000.sd: Got WP GPIO
[    1.026753] bus_width: 1
[    1.029290] bus_width: 1
[    1.033696] bus_width: 1
[    1.036245] bus_width: 1
[    1.044481] bus_width: 1
[    1.047033] bus_width: 1
[    1.051437] bus_width: 1
[    1.053968] bus_width: 1
[    1.058396] bus_width: 1
[    1.060928] bus_width: 1
[    1.065331] bus_width: 1
[    1.067883] bus_width: 1
[    1.075753] sh_mmcif ee200000.mmc: Chip version 0x0003, clock rate 12MHz
....
[    1.162808] sh_mobile_sdhi ee140000.sd: Got CD GPIO
[    1.167721] sh_mobile_sdhi ee140000.sd: Got WP GPIO
[    1.225803] bus_width: 0
[    1.285896] sh_mobile_sdhi ee140000.sd: mmc2 base at 0xee140000 max cloc=
k rate 97 MHz
[    1.295945] bus_width: 0
[    1.295955] bus_width: 0
[    1.310067] bus_width: 0
[    1.312621] bus_width: 0
[    1.315700] mmc0: new high speed SDHC card at address aaaa
[    1.321502] mmcblk0: mmc0:aaaa SL16G 14.8 GiB
[    1.327974] bus_width: 0
[    1.330512] bus_width: 0
[    1.333120]  mmcblk0: p1 p2
[    1.336043] bus_width: 0
[    1.338578] bus_width: 0
[    1.342913] bus_width: 0
[    1.345449] bus_width: 0
[    1.349814] bus_width: 0
[    1.352349] bus_width: 0
[    1.574048] mmc1: new high speed MMC card at address 0001
[    1.579733] mmcblk1: mmc1:0001 MMC04G 3.52 GiB
[    1.584354] mmcblk1boot0: mmc1:0001 MMC04G partition 1 16.0 MiB
[    1.590373] mmcblk1boot1: mmc1:0001 MMC04G partition 2 16.0 MiB
[    1.599432]  mmcblk1: p1 p2


[    6.645766] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD51)
Configuring network interfaces... [    6.705785] bus_width: 0
[    6.708329] bus_width: 0
[    6.710885] mmc2: error -110 whilst initialising SD card
[    6.718189] bus_width: 0
[    6.720735] bus_width: 0
[    6.778163] bus_width: 0
[    6.780732] bus_width: 0
[    6.785697] bus_width: 0
[    6.788305] bus_width: 0
[    6.797313] bus_width: 0
[    6.799924] bus_width: 0
[    6.804870] bus_width: 0
[    6.807504] bus_width: 0
[    6.813239] bus_width: 0
[    6.815864] bus_width: 0
[    6.820826] bus_width: 0
[    6.823447] bus_width: 0

 [   11.925733] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware in=
terrupt (CMD51)
[   11.985731] bus_width: 0
[   11.988272] bus_width: 0
[   11.990827] mmc2: error -110 whilst initialising SD card
[   11.998720] bus_width: 0
[   12.001256] bus_width: 0
[   12.059276] bus_width: 0
[   12.061811] bus_width: 0
[   12.067902] bus_width: 0
[   12.070437] bus_width: 0
[   17.125730] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   17.185731] bus_width: 0
[   17.188268] bus_width: 0
[   22.245732] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   22.305737] bus_width: 0
[   22.308277] bus_width: 0
[   27.365728] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   27.425736] bus_width: 0
[   27.428273] bus_width: 0
[   32.485727] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   32.545735] bus_width: 0
[   32.548271] bus_width: 0
[   37.605729] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[   37.665737] bus_width: 0
[   37.668274] bus_width: 0
[   42.725727] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[   42.785736] bus_width: 0
[   42.788273] bus_width: 0
[   47.845726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[   47.905735] bus_width: 0
[   47.908271] bus_width: 0
[   52.965725] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[   53.025735] bus_width: 0
[   53.028272] bus_width: 0
[   53.034530] bus_width: 0
[   53.037081] bus_width: 0
[   53.102796] bus_width: 0
[   53.105332] bus_width: 0
[   53.114998] bus_width: 0
[   53.117546] bus_width: 0
[   58.165726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   58.225729] bus_width: 0
[   58.228265] bus_width: 0
[   63.285727] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   63.345730] bus_width: 0
[   63.348267] bus_width: 0
[   68.405726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   68.465729] bus_width: 0
[   68.468264] bus_width: 0
[   73.525725] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   73.585729] bus_width: 0
[   73.588265] bus_width: 0
[   78.645725] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[   78.705729] bus_width: 0
[   78.708265] bus_width: 0
[   83.765725] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[   83.825728] bus_width: 0
[   83.828264] bus_width: 0
[   88.885725] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[   88.945728] bus_width: 0
[   88.948264] bus_width: 0
[   94.005726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[   94.065728] bus_width: 0
[   94.068264] bus_width: 0
[   94.078043] bus_width: 0
[   94.080580] bus_width: 0
[   94.137513] bus_width: 0
[   94.140048] bus_width: 0
[   94.144376] bus_width: 0
[   94.146929] bus_width: 0
[   94.155085] bus_width: 0
[   94.157638] bus_width: 0
[   94.161966] bus_width: 0
[   94.164500] bus_width: 0
[   94.168877] bus_width: 0
[   94.171412] bus_width: 0
[   94.175748] bus_width: 0
[   94.178284] bus_width: 0
[   99.285727] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD51)
[   99.345729] bus_width: 0
[   99.348266] bus_width: 0
[   99.350813] mmc2: error -110 whilst initialising SD card
[   99.358094] bus_width: 0
[   99.360630] bus_width: 0
[   99.418115] bus_width: 0
[   99.420650] bus_width: 0
[   99.425579] bus_width: 0
[   99.428134] bus_width: 0
[   99.437034] bus_width: 0
[   99.439567] bus_width: 0
[   99.444495] bus_width: 0
[   99.447046] bus_width: 0
[   99.451977] bus_width: 0
[   99.454510] bus_width: 0
[   99.459494] bus_width: 0
[   99.462029] bus_width: 0
[  104.565727] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD51)
[  104.625735] bus_width: 0
[  104.628270] bus_width: 0
[  104.630813] mmc2: error -110 whilst initialising SD card
[  104.638687] bus_width: 0
[  104.641222] bus_width: 0
[  104.699272] bus_width: 0
[  104.701807] bus_width: 0
[  104.707895] bus_width: 0
[  104.710430] bus_width: 0
[  109.765726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[  109.825736] bus_width: 0
[  109.828272] bus_width: 0
[  114.885726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[  114.945739] bus_width: 0
[  114.948275] bus_width: 0
[  120.005726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[  120.065735] bus_width: 0
[  120.068271] bus_width: 0
[  125.125727] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[  125.185736] bus_width: 0
[  125.188272] bus_width: 0
[  130.245726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[  130.305736] bus_width: 0
[  130.308272] bus_width: 0
[  135.365725] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[  135.425735] bus_width: 0
[  135.428272] bus_width: 0
[  140.485725] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[  140.545735] bus_width: 0
[  140.548271] bus_width: 0
[  145.605725] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[  145.665737] bus_width: 0
[  145.668273] bus_width: 0
[  145.674528] bus_width: 0
[  145.677077] bus_width: 0
[  145.742795] bus_width: 0
[  145.745330] bus_width: 0
[  145.754986] bus_width: 0
[  145.757535] bus_width: 0
[  150.805726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[  150.865729] bus_width: 0
[  150.868264] bus_width: 0
[  155.925725] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[  155.985729] bus_width: 0
[  155.988265] bus_width: 0
[  161.045742] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[  161.105730] bus_width: 0
[  161.108267] bus_width: 0
[  166.165726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[  166.225729] bus_width: 0
[  166.228265] bus_width: 0
[  171.285726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[  171.345729] bus_width: 0
[  171.348264] bus_width: 0
[  176.405725] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[  176.465729] bus_width: 0
[  176.468266] bus_width: 0
[  181.525726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[  181.585730] bus_width: 0
[  181.588265] bus_width: 0
[  186.645726] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[  186.705728] bus_width: 0
[  186.708264] bus_width: 0
[  186.718039] bus_width: 0
[  186.720576] bus_width: 0

> before this line?
>
> > > +renesas_sdhi_sdbuf_width(host, enable ? (16 << host->bus_shift) : 16=
);
>
> Thanks,
>
>    Wolfram




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
