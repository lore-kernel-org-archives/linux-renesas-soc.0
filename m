Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:58503 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732326AbeKWChu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 21:37:50 -0500
From: Avri Altman <Avri.Altman@wdc.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC PATCH 1/3] mmc: core: validate user input for RPMB block
 count
Date: Thu, 22 Nov 2018 15:57:51 +0000
Message-ID: <SN6PR04MB49253CEB654E5FE5C69992A1FCDB0@SN6PR04MB4925.namprd04.prod.outlook.com>
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
 <20181120230832.1840-2-wsa+renesas@sang-engineering.com>
 <SN6PR04MB49251A94A2BF6E60D12919E1FCDB0@SN6PR04MB4925.namprd04.prod.outlook.com>
 <20181122140510.GA1070@kunai>
In-Reply-To: <20181122140510.GA1070@kunai>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

>=20
> Hi Avri,
>=20
> thanks for your comments!
>=20
> > > For RPMB, block count is a non-zero 16 bit wide number. Reject invali=
d
> > Actually this is not what limits the number of rpmb frames to be read,
> > As those are not indicated in the block_count field of the rpmb frame,
> > But in CMD23.
> > While it is true that by eMMCv52 RPMB_SIZE_MULT max value is 0x80,
> > Which limits the RPMB are to 16M, or 65535 rpmb frames,
> > I don't think that it is up to the host to validate the rpmb frame cont=
ent -
>=20
> I wanted to fix the following issue:
>=20
> Currently, in to-be-removed mmc_set_blockcount() we have:
>=20
> 	cmd.arg =3D blockcount & 0x0000FFFF;
>=20
> So, sending a IOCTL with a value of 65537 will silently(!) produce a
> block count of 1. I didn't like this.
>=20
> I don't have the eMMC specs on this computer but I recall it is defined
> somewhere that there are 2 bytes reserved for it in the packet frame?
Yes. But strangely as it may sound, this u16 in the rpmb frame should be se=
t=20
to 0x0 in all cases except for data write in which it may carry 1, 2, or 32=
.
The block count for all other operations is set by CMD23.
This might explain why the community people hate JEDEC guys so much.

I agree - the blockcount in mmc_set_blockcount carries not the frame
Content, but the mmc_ioc_cmd blocks field, which is unsigned int.
 So this line in mmc_set_blockcount performs an unnecessary input validatio=
n.

>=20
> But yes, standards may be extended, so I am not opposed to fill in
> bigger numbers than 16 bit and let the card handle the error.
>=20
> So you suggest dropping this patch and keep the others, did I get this
> right? Would be fine with me.
Yes. Thanks.

Cheers,
Avri

>=20
> Regards,
>=20
>    Wolfram
