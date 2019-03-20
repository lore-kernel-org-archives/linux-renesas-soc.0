Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996F7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 20:41:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FD35218AE
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 20:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="JEoetqvG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfCTUlq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 16:41:46 -0400
Received: from mail-eopbgr1400123.outbound.protection.outlook.com ([40.107.140.123]:35900
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726832AbfCTUlq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 16:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sArm/SEbaW2l5i+7zkU/Y3bVpBqPl/Kw25Lf8VKlq/k=;
 b=JEoetqvGTxaWqwF0tYFNEV9RpFPBZdXjMu4kM/SPB1iJblwsNLlrSPaBhiwBy/Xm2H3TAImIWZKIiRY5EIlw+IEf0khX7A4bwn6tmV8QJWfjYkvOPG09H+FWGmJzdRnFUMO0j4P43gG7nM81TDOjKy5CiD/C9sqJjO+WaOzNV5Y=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB1564.jpnprd01.prod.outlook.com (52.133.162.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Wed, 20 Mar 2019 20:41:43 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::195b:1385:70ae:194c]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::195b:1385:70ae:194c%2]) with mapi id 15.20.1709.015; Wed, 20 Mar 2019
 20:41:43 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 0/2] ARM: dts: rskrza1: Add I2C and remaining LEDs
Thread-Topic: [PATCH 0/2] ARM: dts: rskrza1: Add I2C and remaining LEDs
Thread-Index: AQHU31VQE49rVXGiT0GAAZ+LlWgMvaYU+Pog
Date:   Wed, 20 Mar 2019 20:41:43 +0000
Message-ID: <TY1PR01MB15627B138E7BE709BC483E2A8A410@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190320194410.14870-1-geert+renesas@glider.be>
In-Reply-To: <20190320194410.14870-1-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fa0e82e-b90d-4ded-bfff-08d6ad747683
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1564;
x-ms-traffictypediagnostic: TY1PR01MB1564:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TY1PR01MB15648B4BF5AAF6171D58550D8A410@TY1PR01MB1564.jpnprd01.prod.outlook.com>
x-forefront-prvs: 098291215C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(39860400002)(346002)(376002)(396003)(199004)(189003)(478600001)(99286004)(97736004)(55016002)(2906002)(81166006)(4326008)(71200400001)(71190400001)(6246003)(14454004)(9686003)(110136005)(54906003)(6306002)(81156014)(305945005)(316002)(53936002)(8936002)(6436002)(52536014)(33656002)(68736007)(74316002)(186003)(72206003)(256004)(76176011)(6116002)(3846002)(25786009)(5660300002)(7696005)(7736002)(8676002)(966005)(106356001)(486006)(102836004)(86362001)(229853002)(446003)(476003)(66066001)(26005)(11346002)(4744005)(6506007)(105586002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1564;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lxXHcp71oqBkVWZJ6MjpF0fR02sJwQCig6xmRsfPhRn8iECC+70+7WfXDMnUOd0L6kAef/T6UYu6t87jJYqDxhRi+AbTodwgPDwxryUj+J7aKdtYSZSDv5dEH/jiOXcLp9kHEY6b19seUiQ3rb/vDJDj4UpSDP10fJzAZMleOkhtv51I2ndOriaMsSYT2lhLGhM4luA8LKz+i089YpujeDIJHi2/YwgHF6PNt0QNkjwYtF++cDtNoNaQPOjXk4ttuDkxkP4YXAKvm6U9oS8fN/cRJpWAoBAbicfdjlwK6EzUgYC/vQEChpHr0r89vOALGiZd2BFJAT7DhFICz7VxB6abZ5l2I8+aEhwm/rnyRk6nKHOY0JHpLnwFC9cqQkIP4DHopLJsOyFWK7nD3iN2exzDfNaJFMZP3SL6bFK3oRg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa0e82e-b90d-4ded-bfff-08d6ad747683
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2019 20:41:43.3389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1564
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Mar 20, 2019, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus, Chris,
>=20
> This patch series adds support for devices on the I2C bus on the RSKRZA1
> board, including the GPIO expander that drives 3 LEDs.
>=20
> Thanks!

Very cool.

I figured there was a more graceful way of turning on/off those LEDs=20
than what I was doing...which was just writing to the I2C bus in my LED=20
heartbeat kernel thread.
https://github.com/renesas-rz/rza_linux-4.19/blob/master/arch/arm/mach-shmo=
bile/board-rskrza1.c#L145


Chris

