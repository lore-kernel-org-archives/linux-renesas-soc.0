Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:61837 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752375AbdHBPHI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2017 11:07:08 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc-owner@vger.kernel.org" <linux-mmc-owner@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH 0/4] tmio/sdhi: use max sd_buf size & clean header file
 before
Date: Wed, 2 Aug 2017 15:07:03 +0000
Message-ID: <KL1PR06MB17025CCB937607865A95A66EB8B00@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <20170630105649.16137-1-wsa+renesas@sang-engineering.com>
 <TY1PR06MB07025EC75F78AF0092E15134B7B00@TY1PR06MB0702.apcprd06.prod.outlook.com>
In-Reply-To: <TY1PR06MB07025EC75F78AF0092E15134B7B00@TY1PR06MB0702.apcprd06.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

I am having issues with this patch (commit id:-785b215250310c690142abb1bdbb=
0767b8487c49 " mmc: sdhi: use maximum width for the sdbuf register")
I am testing SDHI1 against linux-next-20170727 tag  with iWave RZ/G1M board=
 which is identical to R-Car M2.

Getting below SDHI1 errors during boot. This issue is fixed by reverting th=
is patch.

[   11.846211] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD51)
[   11.906243] mmc2: error -110 whilst initialising SD card
[   17.046328] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   22.166212] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   27.286205] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   32.406204] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   37.526209] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[   42.646206] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[   47.766203] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[   52.886204] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD55)
[   58.086208] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD52)
[   63.206204] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   68.326205] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)
[   73.446204] sh_mobile_sdhi ee140000.sd: timeout waiting for hardware int=
errupt (CMD5)

Regards,
Biju

> -----Original Message-----
> From: linux-mmc-owner@vger.kernel.org [mailto:linux-mmc-
> owner@vger.kernel.org] On Behalf Of Wolfram Sang
> Sent: 30 June 2017 11:57
> To: linux-mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org; Simon Horman <horms@verge.net.au>;
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Wolfram Sang
> <wsa@the-dreams.de>
> Subject: [PATCH 0/4] tmio/sdhi: use max sd_buf size & clean header file b=
efore
>
> From: Wolfram Sang <wsa@the-dreams.de>
>
> The main patch is patch 4 which uses the maximum sd_buf size, i.e. 32 bit=
 on
> Gen2 and 64 bit on Gen3. Instead of a new flag, we use the bus_shift
> information we already have. See the patch description for details.
>
> Before fixing this, I wanted to remove a magic value in that function whi=
ch is
> done in patch 3.
>
> When adding the new define, I noticed that some description is missing in=
 the
> header which is fixed with patch 2.
>
> When adding the description, I noticed this meanwhile obsolete define whi=
ch
> gets removed in patch 1.
>
> That's the way it went :)
>
> Tested on Salvator-X/M3-W and Lager/H2.
>
> Regards,
>
>    Wolfram
>
> Wolfram Sang (4):
>   mmc: tmio: remove obsolete TMIO_BBS
>   mmc: tmio: add references to bit defines in the header
>   mmc: tmio: no magic values when enabling DMA
>   mmc: sdhi: use maximum width for the sdbuf register
>
>  drivers/mmc/host/renesas_sdhi_core.c | 5 ++---
>  drivers/mmc/host/tmio_mmc.h          | 7 +++++--
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in t=
he body
> of a message to majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
