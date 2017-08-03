Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:28816 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751704AbdHCJAV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2017 05:00:21 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc-owner@vger.kernel.org" <linux-mmc-owner@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 4/4] mmc: sdhi: use maximum width for the sdbuf register
Date: Thu, 3 Aug 2017 09:00:16 +0000
Message-ID: <KL1PR06MB1702E65D0C3D2FA864819F26B8B10@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <20170630105649.16137-1-wsa+renesas@sang-engineering.com>
 <20170630105649.16137-5-wsa+renesas@sang-engineering.com>
 <TY1PR06MB07023DF77FC5A4453B09D82AB7B00@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <KL1PR06MB1702B525F5A03DD74B960928B8B00@KL1PR06MB1702.apcprd06.prod.outlook.com>
 <20170802190427.GA1474@katana>
 <KL1PR06MB1702544BC4FD755C76314608B8B10@KL1PR06MB1702.apcprd06.prod.outlook.com>
 <20170803074304.GB1500@katana>
 <KL1PR06MB17029D34B970C8C59602ED42B8B10@KL1PR06MB1702.apcprd06.prod.outlook.com>
 <20170803085722.GA2574@katana>
In-Reply-To: <20170803085722.GA2574@katana>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



> -----Original Message-----
> From: Wolfram Sang [mailto:wsa@the-dreams.de]
> Sent: 03 August 2017 09:57
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>; linux-renesas-
> soc@vger.kernel.org; Simon Horman <horms@verge.net.au>; Yoshihiro
> Shimoda <yoshihiro.shimoda.uh@renesas.com>; linux-mmc-
> owner@vger.kernel.org; Chris Paterson <Chris.Paterson2@renesas.com>
> Subject: Re: [PATCH 4/4] mmc: sdhi: use maximum width for the sdbuf regis=
ter
>
>
> > > Which tree is this based on? I can't find SDHI nodes for r8a7743 in
> > > its dtsi file in linux-next? I'd think the node is not correct.
> >
> >
> > It is not upstreamed yet. I am going to upstream this patches with in a=
 week
> or two.
> > Currently this patch is under internal review.
>
> Ok, I see the problem now. It is likely that we in deed need to revert th=
e patch
> because I missed that Gen2 has two versions of the SDHI controller and th=
e
> second version has an exception with the SDBUF register.
>
> Thanks for the report! (one suggestion for next time: please describe whi=
ch
> branch you tested)
>

Thanks for the feedback. I will do it next time.

> Regards,
>
>    Wolfram




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
