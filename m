Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:34990 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751155AbdERGfN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2017 02:35:13 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Yasushi SHOJI <yashi@atmark-techno.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH] mmc: tmio: use SDIO master interrupt bit only when
 allowed
Date: Thu, 18 May 2017 06:35:08 +0000
Message-ID: <TY1PR06MB0992F4B8367512C3A9EAFE5ED8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <20161209165141.26599-1-wsa+renesas@sang-engineering.com>
 <TY1PR06MB099248E104D6762E9E860BF3D8E70@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <20170518061746.GA1454@katana>
In-Reply-To: <20170518061746.GA1454@katana>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram-san,

> From: Wolfram Sang
> Sent: Thursday, May 18, 2017 3:18 PM
>=20
> Shimoda-san,
>=20
> > This patch enables CTL_TRANSACTION_CTL to 0x0001 in tmio_mmc_host_probe=
().
> > But, I have a concern we have to disable/enable the register in suspend=
/resume()
> > because registers setting is possible to be cleared after resume.
> > What do you think?
>=20
> This is very likely true. I'll cook up a patch today.

Thank you very much!

Best regards,
Yoshihiro Shimoda

> Thanks,
>=20
>    Wolfram
