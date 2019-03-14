Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C75C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 09:32:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B0552085A
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 09:32:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="g8yR95ib"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfCNJch (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 05:32:37 -0400
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:34590
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726421AbfCNJcg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 05:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KA/3VSa/rDEZBLBxRKo6SpltRKGxOY28XReOIsMWDc=;
 b=g8yR95ibxrp2uXwNoQ4n7Shg4MwKNvIW4q6QtpwCkracipBd6BruzODQwT9wKOUMnEzbK/IMiIQAeHAGftMU7N/o2Vi8NJ2JQaXU8yfN3vXDzokFOn4806rkOVOFQyjv0obasmTys59jY/T+n7ySJSwGvWETiKtGPyYs5ye3hQE=
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com (52.133.176.147) by
 TYAPR01MB3838.jpnprd01.prod.outlook.com (20.178.138.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.20; Thu, 14 Mar 2019 09:32:29 +0000
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::dca7:9e3c:3fda:e52d]) by TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::dca7:9e3c:3fda:e52d%5]) with mapi id 15.20.1686.021; Thu, 14 Mar 2019
 09:32:29 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Felipe Balbi <balbi@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 4/7] usb: gadget: udc: renesas_usb3: Use
 usb_role_switch framework
Thread-Topic: [PATCH v2 4/7] usb: gadget: udc: renesas_usb3: Use
 usb_role_switch framework
Thread-Index: AQHU2kJVRmClUPTznESJc+DOs2H116YK2fuA////wuCAAAJicA==
Date:   Thu, 14 Mar 2019 09:32:29 +0000
Message-ID: <TYAPR01MB2111006A25126526EE125484B84B0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
 <1552552775-51667-5-git-send-email-biju.das@bp.renesas.com>
 <TY2PR01MB4812FADD3C565B4EC8585EF1D84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
 <TYAPR01MB2111FC40CA162501E42456D5B84B0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB2111FC40CA162501E42456D5B84B0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6d0dac1-86ed-471e-fcef-08d6a85ffa4f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYAPR01MB3838;
x-ms-traffictypediagnostic: TYAPR01MB3838:
x-ms-exchange-purlcount: 2
x-microsoft-exchange-diagnostics: 1;TYAPR01MB3838;20:jPyGPmh3W3TprBsqjwLECWA8YK83is6tF6sc+JVCgNAA/t0Ml1G32SoZFMEP3nC3r0htH68HV5+d4wazbB+z6sm2IfeJ3FCLRwh5Hfx1XR5zRUEYUc1X7jR/C9tvdZkOIFGdEO4gKbeHXoWRWYiuWr2cRNxn6ZzqEroj2Fq0opLb0yy61epyn2TlnsJtvdWlSpQKqBGDkLqVzX1atUV5YsJKZq46+MA78rux9MoV40nI/MqlhSx8+w1ownm3ellI
x-microsoft-antispam-prvs: <TYAPR01MB3838295A2845B3040573C0C9B84B0@TYAPR01MB3838.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09760A0505
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(376002)(346002)(366004)(39860400002)(199004)(189003)(71200400001)(229853002)(7736002)(476003)(446003)(102836004)(71190400001)(33656002)(76176011)(186003)(106356001)(11346002)(97736004)(105586002)(7696005)(486006)(5660300002)(4326008)(54906003)(4744005)(6346003)(66066001)(2906002)(93156006)(2940100002)(6436002)(256004)(86362001)(55016002)(316002)(74316002)(3846002)(6306002)(99286004)(81156014)(6116002)(26005)(81166006)(44832011)(53936002)(110136005)(8676002)(305945005)(14454004)(8936002)(93886005)(6246003)(966005)(6506007)(9686003)(68736007)(478600001)(25786009)(52536014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3838;H:TYAPR01MB2111.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZJ8I8/MFLodRcOt22/oD7kMG2Zod2v/FKmMz4eu8I+RL15ict69tdk8EA71jzp+nvnFeOFXqrc3qzp2sarTHcpADkltcKu8H0HqdTURVScD3hULPpheeU94dNJHMxaG5o8vVBYI14F8r/7yenIGTZPBF173uTRIaCM0wsiXJtQVrm9g5Y5TRiHszSoP7fIQLCPbHsUANyZXbavV3jLo6A1YtuyXEFFdnlyqiGrlK3WBcXImWHobU/MYajB4NBSY87qQjxJipODXkxqhHY4KQ9nBSxANticzsd/qzeFlFNjjxKhbcxvxssR9fy/MKghxifEkec7BGR7ZWkTIhPF96mGrw1o4x4bDERNSqgTzeNpqzKbLlAPjGiPQ015rc6ObS213gY75udgWHbBdmWaiOawVCjHN2NW/GgJ4xbNTeP7I=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d0dac1-86ed-471e-fcef-08d6a85ffa4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2019 09:32:29.1817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3838
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-San,

Sorry. I pasted a wrong link.

> > This causes build error because struct usb_role_switch_desc doesn't
> > have fwnode.
>=20
> I have compiled this code with linux-next and the commit
> 09aa11cfda9d8186046b ("device connection: Add fwnode member to struct
> device_connection") defines the property fwnode. The HD3SS3220 port
> controller driver uses usb-role-switch property to get role-switch handle
> using graph api's.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-
> next.git/commit/?h=3Dnext-
> 20190306&id=3D09aa11cfda9d8186046bcd1adcd6498b688114f4

Commit id ec69e9533c4879c81eb7122771792864eb49af35 ("usb: roles: Find the m=
uxes by also matching against the device node")
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?h=3Dnext-20190306&id=3Dec69e9533c4879c81eb7122771792864eb49af35

regards,
Biju
