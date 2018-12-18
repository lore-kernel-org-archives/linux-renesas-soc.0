Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FF5C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 15:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85F8221852
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 15:40:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="MXG+zysM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbeLRPkI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 10:40:08 -0500
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:49822
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726422AbeLRPkH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 10:40:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWJcpCMleViPGqUObCJlAe2osnTEAQvBxKwXwi2LV6w=;
 b=MXG+zysMEyh1LFqFb2N/xtqzTipBlGRtoSRNzI82Mv8TKLNUDPVI3nCx3GKcwXmershI2t94BYDKVFc2ltQV0OUf+Xp10I9i1zfNSwxw6uQiwsqGf5BJc263mKj9/68DyERfbSgqw/w0AavWWRI+omup9Hg5msxGrHWjwRjQm5o=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1680.jpnprd01.prod.outlook.com (52.133.167.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.20; Tue, 18 Dec 2018 15:40:03 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::78ca:ce95:aef5:e8ca]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::78ca:ce95:aef5:e8ca%6]) with mapi id 15.20.1425.024; Tue, 18 Dec 2018
 15:40:02 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] ARM: dts: r7s9210: Initial SoC device tree
Thread-Topic: [PATCH v3 1/2] ARM: dts: r7s9210: Initial SoC device tree
Thread-Index: AQHUlhb2WsaMteCV20Wth5ScoWeeaqWEmiaAgAAIpNA=
Date:   Tue, 18 Dec 2018 15:40:02 +0000
Message-ID: <TYXPR01MB1568D8FDF5E286B2832703048ABD0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20181217144324.99422-1-chris.brandt@renesas.com>
 <20181217144324.99422-2-chris.brandt@renesas.com>
 <20181218150551.GA15519@bogus>
In-Reply-To: <20181218150551.GA15519@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TYXPR01MB1680;20:7ADtBubLvuR2bs0bmte7nKDTEZ0cMdXXz+/MamkqSq3E6sEjXgQTXRsucXde8uL6vRd/sUxVGZzv9Qn5xSsKuqnOHbtM72qEK6soWe0e3EwMhIPQyh3XW0Nyy6A50N5YA/L9Hi7f7K0azLlCUHy3i3wN8RLnkyelrUDCPG9KG4I=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: cd3744e6-8258-4133-2e06-08d664ff13ae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYXPR01MB1680;
x-ms-traffictypediagnostic: TYXPR01MB1680:
x-microsoft-antispam-prvs: <TYXPR01MB16808BC4891772CB3FE5F1338ABD0@TYXPR01MB1680.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:TYXPR01MB1680;BCL:0;PCL:0;RULEID:;SRVR:TYXPR01MB1680;
x-forefront-prvs: 08902E536D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(366004)(376002)(39860400002)(136003)(199004)(189003)(2906002)(6436002)(8936002)(81166006)(81156014)(8676002)(53936002)(476003)(11346002)(55016002)(7736002)(66066001)(486006)(305945005)(106356001)(446003)(9686003)(105586002)(86362001)(74316002)(7696005)(97736004)(99286004)(316002)(54906003)(102836004)(478600001)(3846002)(6116002)(229853002)(14454004)(6506007)(26005)(72206003)(76176011)(5660300001)(68736007)(6246003)(256004)(4326008)(33656002)(186003)(71190400001)(71200400001)(25786009)(6916009);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1680;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: et9/ePOLI0y4qHUjRH7hJJrAtHYGlkhf05bwvhdOwvnNQJzuW40YK+Ntj0Tg0iEzdoZntrTyL1CKDerQg6rXQwCmaDkx8fxycGwPmBfi/k7NoJbuMJ7Syusc6P/7sajIsxaLG6VCRTvtzUN3xH4gKkeZEOlkM6zmc5PU38J4duFnMNlYhOeYFemNAf1Z1xUZhesfeEbj08aS3K3BXHSW6nZBztEV2PmimiXMTtxC4Y4RqS7US9+LiyFh/366eSpL0u209Yq93sIDOOcmEgFGDNRQfijwAGHIPubx1+pF8KSct4GdRUJnXM69haihEZhW
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3744e6-8258-4133-2e06-08d664ff13ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2018 15:40:02.6692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1680
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tuesday, December 18, 2018 1, Rob Herring wrote:
> > +/ {
> > +	compatible =3D "renesas,r7s9210";
> > +	interrupt-parent =3D <&gic>;
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <1>;
> > +
> > +	bsid: chipid@fcfe8004 {
>=20
> Put all the mmio peripherals under a simple-bus node or nodes.

Just to be clear on what you mean, basically put all the peripherals=20
under a 'soc' node like the other Renesas parts?

	soc {
		compatible =3D "simple-bus";
		interrupt-parent =3D <&gic>;

		#address-cells =3D <2>;
		#size-cells =3D <2>;
		ranges;


Thanks,
Chris

