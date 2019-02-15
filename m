Return-Path: <SRS0=NmnW=QW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C130CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 12:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 803402192B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 12:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="mFcJNDeo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbfBOMdl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Feb 2019 07:33:41 -0500
Received: from mail-eopbgr1400121.outbound.protection.outlook.com ([40.107.140.121]:60681
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725818AbfBOMdl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Feb 2019 07:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3kCUl5LrvRqdKvC2b9wq5Jty9/bSspOt6Rwv572L9U=;
 b=mFcJNDeogSL2BluXjj7V/rrvW9p/Mr2uyCQAJs2RmScdC+WFZeUTfpo/aqeIYf05Z2Ux0RLeAgxk5O2KE1atqnHCdq4Gd48jZ49nesIiOIIMYjawaoIFH/rIS79XrIQVhryHhys+4hwM5wt1TXzMud1t7Xj/eVrnVv9ImIn9D+A=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB1866.jpnprd01.prod.outlook.com (52.133.161.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Fri, 15 Feb 2019 12:33:38 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74fc:a361:eeec:1678]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74fc:a361:eeec:1678%5]) with mapi id 15.20.1622.018; Fri, 15 Feb 2019
 12:33:38 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: what happened to /proc/vmallocinfo as of v4.15?
Thread-Topic: what happened to /proc/vmallocinfo as of v4.15?
Thread-Index: AdTFKbgFlyDruYNHRB6kXWqSadKudA==
Date:   Fri, 15 Feb 2019 12:33:37 +0000
Message-ID: <TY1PR01MB1562B1C04915AB16AE53D95B8A600@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ad182f9-4490-4e90-aeaa-08d69341cf6a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1866;
x-ms-traffictypediagnostic: TY1PR01MB1866:
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1866;20:51cFJxPIQCHekJCR1P1+nk5YsoP44mcjpk20YO/+dND/84CNfQdGpH70TP9LrVIK18/riJ6OsEHLpvyHvyBz+QlAlpYrlrcozROs7v9DrriAWJXjRIBeR3rOIWUHqW5nHLB8XFNY0TeS6BqAuZtt3xjkxM3A71DcOKwzNXF33Hs=
x-microsoft-antispam-prvs: <TY1PR01MB18660BD4A467C87A96C6F80E8A600@TY1PR01MB1866.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09497C15EB
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(376002)(39860400002)(346002)(396003)(189003)(199004)(53754006)(486006)(7736002)(25786009)(86362001)(72206003)(81156014)(81166006)(71200400001)(478600001)(476003)(71190400001)(316002)(8676002)(6916009)(6116002)(8936002)(3846002)(14454004)(105586002)(68736007)(99286004)(7696005)(106356001)(55016002)(9686003)(305945005)(6436002)(2351001)(5640700003)(186003)(33656002)(2501003)(74316002)(97736004)(26005)(66066001)(6506007)(256004)(102836004)(53936002)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1866;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SYP1kkTKRB5pMwixOAQ80AgIvDP9+zMLaoaICYOYIpfS/CCs0+iCVnpIr9pf7W7sA3EBnJ6yJnAKkc9PWAI5ZA7lPcPOuXhiS+K6q+wtZ0zDoXy7E02NI8d1kfM29yTw8Xzaj3BRFSP/lEMNODGPyLxNac66qsdd0A2iJg+gFxx1+821deERRGks4S5TWEF81mLS2AmZvDv9mlzVMESBhCGjAhiMGVDMOblA9hBIOlQXFIFX8GanJ8iDUc7VR2AqQGaNmvw9a+Qst9QoJjva+saD9zgRn1oMBPWF50D3U6jvLaiasZ0yZPyFrmSQnl4q5XVa0StU4ktecdQUpl7I6McVIfJjeIoT4KCEbNgvk8rLWgUk3emM2E3/oSBrtx/2NzG5MIfATz2m55ejFg+tPBvB54jfiBY6X+P0EXe+WFY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad182f9-4490-4e90-aeaa-08d69341cf6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2019 12:33:37.8314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1866
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello everyone,

I just noticed this yesterday and I can't seem to figure it out.

In linux-4.14, vmallocinfo looked like this:

$ cat /proc/vmallocinfo
0xc2800000-0xc2802000    8192 of_iomap+0x19/0x22 phys=3D0xe8201000 ioremap
0xc2802000-0xc2804000    8192 of_iomap+0x19/0x22 phys=3D0xe8202000 ioremap
0xc2804000-0xc2806000    8192 l2x0_of_init+0x3f/0x174 phys=3D0x3ffff000 ior=
emap
0xc2806000-0xc2808000    8192 of_iomap+0x19/0x22 phys=3D0xfcfe0000 ioremap
0xc2808000-0xc280a000    8192 unpurged vm_area
0xc280a000-0xc280c000    8192 unpurged vm_area
0xc280c000-0xc280e000    8192 of_iomap+0x19/0x22 phys=3D0xfcfe0000 ioremap
0xc280e000-0xc2810000    8192 of_iomap+0x19/0x22 phys=3D0xfcfe0000 ioremap
0xc2810000-0xc2812000    8192 of_iomap+0x19/0x22 phys=3D0xfcfe0000 ioremap


However as of linux-4.15, it now looks like this:

$ cat /proc/vmallocinfo
0x2423e1ec-0x1d348857    8192 of_iomap+0x19/0x22 phys=3D0xe8201000 ioremap
0x1d348857-0x52c37840    8192 of_iomap+0x19/0x22 phys=3D0xe8202000 ioremap
0x52c37840-0x402f3b08    8192 l2x0_of_init+0x3f/0x174 phys=3D0x3ffff000 ior=
emap
0x402f3b08-0x06d553ef    8192 of_iomap+0x19/0x22 phys=3D0xfcfe0000 ioremap
0x06d553ef-0xf6dfcceb    8192 unpurged vm_area
0xf6dfcceb-0xd99b6570    8192 unpurged vm_area
0xd99b6570-0xa32d8fae    8192 of_iomap+0x19/0x22 phys=3D0xfcfe0000 ioremap
0xa32d8fae-0xffd15855    8192 of_iomap+0x19/0x22 phys=3D0xfcfe0000 ioremap
0xffd15855-0x9d2cc6ea    8192 of_iomap+0x19/0x22 phys=3D0xfcfe0000 ioremap


The virtual addresses are all wrong!

I can't seem to find any patches or code changes that would explain this.

Does anyone have an idea why it now looks like this?

Thanks,
Chris

