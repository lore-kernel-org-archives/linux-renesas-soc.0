Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAF0C282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 18:25:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C1182147A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 18:25:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="hKgyVdpT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfA1SZB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:25:01 -0500
Received: from mail-eopbgr1410129.outbound.protection.outlook.com ([40.107.141.129]:60151
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726266AbfA1SZA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 13:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hmb9/dY8FtV0QRs/hSAFLCRKiXZHxFJAkUvI0/3CyTE=;
 b=hKgyVdpTr50wSBZqLxyGU1RTY83cEjWTVWYJBFpWUCeW5yNk4eiybH3fvm7Xid6ybXskWXxoIXLSDen6Z+XEZw3MhH2xnE6rJPAPa7aDUdDOWtjPAV49ZBHCd5u53VZmS225q7/E6HJjct1THpm4aXHN6JPGumgjOYM3qnsZo4Q=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB1692.jpnprd01.prod.outlook.com (52.133.160.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.18; Mon, 28 Jan 2019 18:24:57 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74fc:a361:eeec:1678]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74fc:a361:eeec:1678%5]) with mapi id 15.20.1558.023; Mon, 28 Jan 2019
 18:24:56 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] serial: sh-sci: Do not free irqs that have already been
 freed
Thread-Topic: [PATCH] serial: sh-sci: Do not free irqs that have already been
 freed
Thread-Index: AQHUtzMiUO/XQs/2A0648BX5c6cqUqXE/J6AgAAA0TA=
Date:   Mon, 28 Jan 2019 18:24:56 +0000
Message-ID: <TY1PR01MB1562762F677A5BBAE1F156588A960@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190128175832.33670-1-chris.brandt@renesas.com>
 <00dc1b7b-04de-7d6b-8525-a92dbe529916@cogentembedded.com>
In-Reply-To: <00dc1b7b-04de-7d6b-8525-a92dbe529916@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1692;20:/r3fwbvgGOenPE1FUeQVthrt0wXvGLJCpYCepbp3q5nTbPHNsPpr8VvGt17dmBZa/3AGR4jDGMlNMykUhp6F5igcWMVyW5RamMLo3WfHQNiBIEdmF7GOuRwvtA3D3aErPvXteyu/VH+UgIl6b62GGsBoX4yNXZNz73yZ3pY0jrE=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 8d262104-fd47-4855-9432-08d6854de7e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1692;
x-ms-traffictypediagnostic: TY1PR01MB1692:
x-microsoft-antispam-prvs: <TY1PR01MB169210229C02CD15A09D29F88A960@TY1PR01MB1692.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0931CB1479
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(136003)(366004)(346002)(376002)(199004)(189003)(305945005)(74316002)(81166006)(8676002)(76176011)(7696005)(558084003)(316002)(7736002)(86362001)(53936002)(229853002)(6246003)(54906003)(110136005)(25786009)(68736007)(14454004)(4326008)(55016002)(478600001)(8936002)(81156014)(6436002)(72206003)(97736004)(99286004)(9686003)(2906002)(33656002)(256004)(71190400001)(71200400001)(105586002)(106356001)(486006)(66066001)(3846002)(11346002)(6116002)(446003)(476003)(6506007)(102836004)(186003)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1692;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 14Y/niQb/ss7gR7Z9noR5UZ46hOfEnkdeVMGwfz39kMmMOGVdroGi4+5pwZdFRJ3XTDyqsGd8VmgI1tDJVfG2myaQQv4yM+dnukyz5ZdD+xoEujViy7hvmsG8yq1M2H2D4hENO6LXj8JWwzH1EZ9u7FToKrShSvaZr2aWIWBvbSMUhdpFha4FzU83a8awq5Ny0hUWytRAAGjPHf963mDBvvtPkx2YBGC9CA7tKgo45qYAqJstR7EMhpO4YZHVFF8YYH59UvCghFWofpfli023BHBszrvi+t++LFjk/KN/09OEuczd4g8Hgr+Rsrf4BwUV5nvsHrnhcL0TIAEkbGWRIcjcYP812BpcVXs6hD2jQsI9mTAayqLxaLqr+hYYcCRIoBFaW1201Q6tHucAvR/VoLoIBfcJljYi9LfSq8oSw0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d262104-fd47-4855-9432-08d6854de7e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2019 18:24:56.7602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1692
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gTW9uZGF5LCBKYW51YXJ5IDI4LCAyMDE5LCBTZXJnZWkgU2h0eWx5b3Ygd3JvdGU6DQo+ID4g
U2luY2UgSVJRcyBtaWdodCBhcmUgbXV4ZWQgb24gc29tZSBwYXJ0cywgd2UgbmVlZCB0byBwYXkg
YXR0ZW50aW9uIHdoZW4NCj4gd2UNCj4gDQo+ICAgIHMvYXJlL2JlLz8NCg0KT29vcHMhDQoNCg0K
VGhhbmsgeW91Lg0KDQpDaHJpcw0K
