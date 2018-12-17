Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D08C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 10:46:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58F3E20874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 10:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="EXSzMnCM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbeLQKqr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 05:46:47 -0500
Received: from mail-eopbgr1400097.outbound.protection.outlook.com ([40.107.140.97]:65152
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726566AbeLQKqr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 05:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikTfFYnUo5gfTAE1LMhTi/15vmS91tckMs9t5HEQGOs=;
 b=EXSzMnCMaKrADX4tFt16sFmdH5y6utQjV8KSs2xxh5+IBpafIagwjBf236ihTzk+gxvTe1oUjv39tsWaASTjYpwbAzq52SEXNsXFKWAA7wHJ0usgEMOFLgKs7eilghn1YKY0IkiEiChXyTtHCUtaXPYLE9AfvozDBNbmHBo4jSQ=
Received: from OSAPR01MB2290.jpnprd01.prod.outlook.com (52.134.238.13) by
 OSAPR01MB3764.jpnprd01.prod.outlook.com (20.178.102.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Mon, 17 Dec 2018 10:46:42 +0000
Received: from OSAPR01MB2290.jpnprd01.prod.outlook.com
 ([fe80::a8ae:bee4:d7e7:e5b7]) by OSAPR01MB2290.jpnprd01.prod.outlook.com
 ([fe80::a8ae:bee4:d7e7:e5b7%2]) with mapi id 15.20.1425.021; Mon, 17 Dec 2018
 10:46:41 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>
CC:     David Miller <davem@davemloft.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] net: phy: micrel: add tobling phy reset
Thread-Topic: [PATCH v2 0/2] net: phy: micrel: add tobling phy reset
Thread-Index: AQHUhvkeJM24u1pT9kGiWhF5fnNqFqVtr76AgAABDYCAAL2qgIAUbesQ
Date:   Mon, 17 Dec 2018 10:46:41 +0000
Message-ID: <OSAPR01MB229035772BF81EDC3F58C2F6D8BC0@OSAPR01MB2290.jpnprd01.prod.outlook.com>
References: <1543395612-5430-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181203.152057.61263535375452379.davem@davemloft.net>
 <92358866-e231-15e7-84f4-86a6fa51ed49@gmail.com>
 <20181204104333.GC741@lunn.ch>
In-Reply-To: <20181204104333.GC741@lunn.ch>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSAPR01MB3764;20:9J2RVl/xhvJhIZ5NPV8zLfEDw5klPqdrm+G4614h+th7asfVIB64Y3ZmLpSmgRDm7cymK6dm4ulV9YB3e/czUIYuaWJBqiN787SN7hHiP/PW4cAz053RdF64XFHNmtH2C13GzldLTooiu3H95RNTEjXawN6gUZdK7EacYTVImaU=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 84465958-2118-40d5-ee5f-08d6640cee43
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSAPR01MB3764;
x-ms-traffictypediagnostic: OSAPR01MB3764:
x-microsoft-antispam-prvs: <OSAPR01MB37642B7BEAD1F49D64229533D8BC0@OSAPR01MB3764.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(3231475)(944501520)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:OSAPR01MB3764;BCL:0;PCL:0;RULEID:;SRVR:OSAPR01MB3764;
x-forefront-prvs: 08897B549D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(39860400002)(376002)(396003)(346002)(199004)(189003)(8936002)(478600001)(86362001)(305945005)(229853002)(81156014)(5024004)(5660300001)(476003)(7736002)(8676002)(81166006)(68736007)(2906002)(14454004)(93886005)(110136005)(4326008)(316002)(6246003)(26005)(53936002)(9686003)(54906003)(102836004)(99286004)(55016002)(76176011)(6506007)(71200400001)(6436002)(446003)(105586002)(186003)(486006)(39060400002)(71190400001)(6116002)(3846002)(11346002)(25786009)(33656002)(74316002)(97736004)(66066001)(256004)(7696005)(14444005)(106356001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3764;H:OSAPR01MB2290.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: a/ZyuaiybWdHarGlOjwdHegTD3Xha3nlTXuzYwV5vcbQqGStBs1NJLtHl5XE6kqMmLmG8/mQOnmTEDGHtgArUM/C4Ag4RF5lgSTY0omq25hhGlRMAYXm7IWB58qbWfgcVfv3iKowsxX3VN1ZNzhCxjv2gjDTwm8sehTj6Vv0rnR56rh0EJlTvpokPxVLxpwaJ0Y6YpGBydbRUv3d4RvBv+quKinBD6hdA8QF/LFmABDG0fLuCN6gxPcJy1uafir4A+W1/KGtalU0EyL7bQ53ZTVq8HYjJhmABgexp4a8SeJPeMht6Vq7ByWiwEuh0nt0
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84465958-2118-40d5-ee5f-08d6640cee43
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2018 10:46:41.7016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3764
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Andrew, Florian,

> From: Andrew Lunn, Sent: Tuesday, December 4, 2018 7:44 PM
>=20
> > > Series applied, thank you.
> >
> > Meh! I guess we should be faster at reviewing stuff :/
>=20
> And there have been things going on behind the scenes to try to get a
> real fix. Sorry, i should of mentioned that.

Sorry for the delayed response. How to try to get a real fix?
I have two ideas:

Idea 1: Assert/deassert the reset in phy_{suspend,resume}()
 - call phy_device_reset(phydev, 0); if !phydev->attached_dev in phy_suspen=
d()
 - call phy_device_reset(phydev, 1); if !phydev->attached_dev in phy_resume=
()

Idea 2: Toggle the reset in phy_resume().
 - call phy_device_reset(phydev, 0); udelay(1); phy_device_reset(phydev, 1)=
;
   if !phydev->attached_dev in phy_resume ()

I think the idea 1 is better. But, what do you think?

Best regards,
Yoshihiro Shimoda

