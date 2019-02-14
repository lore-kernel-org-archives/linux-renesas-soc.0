Return-Path: <SRS0=Vdsz=QV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA860C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 12:57:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B1332229F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 12:57:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="AfqnE8ie"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388524AbfBNM5J (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Feb 2019 07:57:09 -0500
Received: from mail-eopbgr1410119.outbound.protection.outlook.com ([40.107.141.119]:41472
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388215AbfBNM5I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Feb 2019 07:57:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeu7D111lh1db7yhz6EDgEz5yoyq3gCw/ch9fvV6/Dk=;
 b=AfqnE8iebviAFNFPGPwF6LorVEQ16jtmYXvVux2/XW62zIVM8Wwa0yqJyVDRnZ1WSBFR1x0M1yjeZzE3f1mu7ssJz9ZyBNqa3Pf/O4GiGuc60T9ot7j3okLwdl8GridkCmFHyjDwJBADmBE/RiViOvQPNbNcPOzF5FPgxZUIiR4=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1481.jpnprd01.prod.outlook.com (52.133.161.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.22; Thu, 14 Feb 2019 12:57:04 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1601.023; Thu, 14 Feb 2019
 12:57:04 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 08/12] arm64: dts: renesas: r8a774c0: Add OPPs table for
 cpu devices
Thread-Topic: [PATCH 08/12] arm64: dts: renesas: r8a774c0: Add OPPs table for
 cpu devices
Thread-Index: AQHUv59UWIs1mWv1SE6wnM13RZEGXaXV2xMAgAAqdKCABFllAIAE6zPQ
Date:   Thu, 14 Feb 2019 12:57:03 +0000
Message-ID: <TY1PR01MB1770B6B3FFD6293A66F4A8BAC0670@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <cover.1549623801.git.horms+renesas@verge.net.au>
 <231d8908a66fa98f09553d31ad8cd5f382b29959.1549623801.git.horms+renesas@verge.net.au>
 <7d60ebf5-c245-f48d-47db-ce63f4f3690b@cogentembedded.com>
 <TY1PR01MB1770FAE6E7C26615134B8E0AC0690@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190211094927.5bs32a6q7ecvqq5t@verge.net.au>
In-Reply-To: <20190211094927.5bs32a6q7ecvqq5t@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d27a2c04-ca77-4f86-2277-08d6927beb1a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1481;
x-ms-traffictypediagnostic: TY1PR01MB1481:
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1481;20:b8GfWlpm2xLP2HqPwmDMWXVnmHwACvmW8vYAbNeHgorwcmT0A/+lxuNQo6kQkuaCOxQ8xo6qby0aF+k/BSnqGEZqFMuig4Fp70Wkt5fqKnjlz+5fNIH1ijCyOgjC+tTjXdJM7h/Nh5Ck61MCYwmqTtUHlZRaKvaVZztKD8NSC80=
x-microsoft-antispam-prvs: <TY1PR01MB14819741D0B685280AE98526C0670@TY1PR01MB1481.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09480768F8
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(376002)(396003)(366004)(39860400002)(13464003)(189003)(199004)(105586002)(66066001)(54906003)(2906002)(68736007)(106356001)(71190400001)(71200400001)(97736004)(6116002)(305945005)(74316002)(6436002)(14454004)(9686003)(7736002)(33656002)(86362001)(6246003)(229853002)(11346002)(6916009)(4326008)(256004)(14444005)(93886005)(3846002)(81166006)(8936002)(76176011)(478600001)(8676002)(446003)(81156014)(44832011)(486006)(476003)(6506007)(26005)(99286004)(102836004)(53546011)(53936002)(7696005)(186003)(25786009)(316002)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1481;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BiAevY438qcptH0Crfs89kDCS7br4Ab7rlzNCFmTwbzELlBkNDrsvCOf7JJrMCwlI2TmTBd4RxP2B3yOscgHFwdP+hxYJFgGUTd8ERbXW6QpHKW0Uvgrw4leUy5i7Diy7LFBqoUmTv+1ptnBf0mBHuRIpUeM4tem93rXVirOiW27pq+MEo3usy4kWXal64oQB36h7bFwAGUQg5ZtnBGO9oWEVmM47/gnjZFv7KvVlrE0RLDJLPngzZtN1e4w5Vqw+3x/0ua5Zzai1RDhtDxVUTgilkDwc5Bv6IalDUt/AVbgVnA979XVBe5euZOd7gEpYqbtl5tRUmrdLRGWRV3rAjHpocr2eD1PEj2Sj/FBnfOTaJkZeBJQtvpyYEE45uXNW8ZWkpzoSkDtHwbA7tgoTixgIe+6DyWUIlgQS/o9XK0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d27a2c04-ca77-4f86-2277-08d6927beb1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2019 12:57:03.9963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1481
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

> From: Simon Horman <horms@verge.net.au>
> Sent: 11 February 2019 09:50
> Subject: Re: [PATCH 08/12] arm64: dts: renesas: r8a774c0: Add OPPs table =
for cpu devices
>
> On Fri, Feb 08, 2019 at 03:26:49PM +0000, Fabrizio Castro wrote:
> > Hello Sergei,
> >
> > Thank you for your feedback!
> >
> > > -----Original Message-----
> > > From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > > Sent: 08 February 2019 12:53
> > > To: Simon Horman <horms+renesas@verge.net.au>; linux-renesas-soc@vger=
.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org; Magnus Damm <magnus.damm@gm=
ail.com>; Fabrizio Castro
> > > <fabrizio.castro@bp.renesas.com>
> > > Subject: Re: [PATCH 08/12] arm64: dts: renesas: r8a774c0: Add OPPs ta=
ble for cpu devices
> > >
> > > Hello!
> > >
> > > On 02/08/2019 02:13 PM, Simon Horman wrote:
> > >
> > > > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > >
> > > > This patch defines OOP tables for all CPUs, similarly to
> > > > what done by Takeshi Kihara and Yoshihiro Kaneko for the
> > > > R8A77990.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > [...]
> > > > @@ -55,6 +76,8 @@
> > > >  power-domains =3D <&sysc R8A774C0_PD_CA53_CPU0>;
> > > >  next-level-cache =3D <&L2_CA53>;
> > > >  enable-method =3D "psci";
> > > > +clocks =3D<&cpg CPG_CORE R8A774C0_CLK_Z2>;
> > >
> > >    Need space after =3D...
> >
> > Doh! Simon, do you want me to send another version to fix both spacing =
issues?
>
> Likewise, sorry I didn't notice that earlier.
>
> I'd rather not re-send this pull request just to resolve whitespace issue=
s.
> So please send an incremental patch for now.

Thanks, will do.

Cheers,
Fab


Renesas Electronics Europe GmbH,Geschaeftsfuehrer/President : Michael Hanna=
wald, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse =
10, 40472 Duesseldorf, Germany,Handelsregister/Commercial Register: Duessel=
dorf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr.=
/WEEE reg. no.: DE 14978647
